# Claude Code Smart Contract Deployment Guide - Paseo TestNet

## OVERVIEW

This document provides comprehensive information for deploying smart contracts to Polkadot Hub TestNet (Paseo) using Claude Code. It includes verified configurations, common issues, solutions, and optimization strategies.

## NETWORK INFORMATION

### Paseo TestNet Details

- **Network Name**: Polkadot Hub TestNet
- **Chain ID**: 420420422 (0x1911f0a6 in hex)
- **RPC URL**: https://testnet-passet-hub-eth-rpc.polkadot.io
- **Block Explorer**: https://blockscout-passet-hub.parity-testnet.parity.io
- **Currency**: PAS
- **Faucet**: https://faucet.polkadot.io/?parachain=1111
- **Status**: PolkaVM Preview Release (early development stage)

### Key Characteristics

- **EVM Compatibility**: Ethereum-compatible smart contract deployment
- **PolkaVM**: Requires specific configuration for compatibility
- **Bytecode Limit**: ~100KB maximum contract size
- **Gas Model**: Standard EVM gas mechanics
- **Node Version Warning**: Works with Node.js v21+ despite warnings

## REQUIRED DEPENDENCIES

### Core Dependencies

```bash
npm install --save-dev @parity/hardhat-polkadot solc@0.8.28
npm install --force @nomicfoundation/hardhat-toolbox
npm install dotenv
```

### Package.json Requirements

```json
{
  "devDependencies": {
    "@nomicfoundation/hardhat-toolbox": "^5.0.0",
    "@parity/hardhat-polkadot": "^0.1.7",
    "solc": "^0.8.28",
    "hardhat": "^2.22.0"
  },
  "dependencies": {
    "dotenv": "^17.0.1",
    "ethers": "^6.13.5"
  }
}
```

**CRITICAL**: Use `--force` flag when installing hardhat-toolbox to resolve dependency conflicts.

## HARDHAT CONFIGURATION

### Complete Working hardhat.config.js

```javascript
require("@nomicfoundation/hardhat-toolbox");
require("@parity/hardhat-polkadot");
const { vars } = require("hardhat/config");

module.exports = {
  solidity: "0.8.28",
  resolc: {
    version: "0.3.0",
    compilerSource: "npm",
  },
  networks: {
    hardhat: {
      polkavm: true,
    },
    localNode: {
      polkavm: true,
      url: "http://127.0.0.1:8545",
    },
    passetHub: {
      polkavm: true,
      url: "https://testnet-passet-hub-eth-rpc.polkadot.io",
      accounts: [vars.get("PRIVATE_KEY")],
    },
  },
  gasReporter: {
    enabled: process.env.REPORT_GAS !== undefined,
    currency: "USD",
  },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts",
  },
};
```

### Configuration Requirements

1. **Must use string format for Solidity version**: `solidity: "0.8.28"`
2. **Must include resolc configuration**: Required for PolkaVM compatibility
3. **Must set polkavm: true**: In all network configurations
4. **Must use hardhat vars**: For private key management
5. **Network name**: Use `passetHub` (not paseo or other names)

## SETUP PROCESS

### Step 1: Initialize Project

```bash
mkdir your-project
cd your-project
npm init -y
```

### Step 2: Install Dependencies

```bash
npm install --save-dev @parity/hardhat-polkadot solc@0.8.28
npm install --force @nomicfoundation/hardhat-toolbox
npm install dotenv
```

### Step 3: Initialize Polkadot Plugin

```bash
npx hardhat-polkadot init
```

### Step 4: Configure Private Key

```bash
npx hardhat vars set PRIVATE_KEY
# Enter your private key when prompted (without 0x prefix)
```

### Step 5: Get Test Tokens

1. Visit https://faucet.polkadot.io/?parachain=1111
2. Enter your wallet address
3. Request PAS tokens
4. Verify balance in wallet or block explorer

### Step 6: Create Hardhat Config

Copy the exact configuration above into `hardhat.config.js`

## CONTRACT DEVELOPMENT

### Solidity Version Requirements

- **Required Version**: ^0.8.28
- **EVM Target**: paris (default)
- **Optimizer**: Enabled by default

### Example Simple Contract

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract SimpleStorage {
    uint256 public value;

    constructor() {
        value = 42;
    }

    function setValue(uint256 _value) external {
        value = _value;
    }

    function getValue() external view returns (uint256) {
        return value;
    }
}
```

### Contract Size Limitations

- **Maximum Bytecode**: ~100KB
- **OpenZeppelin Impact**: Standard imports often exceed limit
- **Optimization Required**: Remove unnecessary dependencies

## DEPLOYMENT PROCESS

### Using Hardhat Ignition (Recommended)

#### Step 1: Create Ignition Module

```javascript
// ignition/modules/YourModule.js
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("YourModule", (m) => {
  const contract = m.contract("YourContract", [
    // constructor arguments
  ]);
  return { contract };
});
```

#### Step 2: Compile Contracts

```bash
npx hardhat compile
# Should output: "Successfully compiled X Solidity files"
```

#### Step 3: Deploy to Paseo

```bash
npx hardhat ignition deploy ./ignition/modules/YourModule.js --network passetHub
# Confirm with 'y' when prompted
```

### Deployment States

- **Clean State**: `rm -rf ignition/deployments/` to start fresh
- **Resume**: Ignition automatically resumes interrupted deployments
- **Track Transactions**: Use block explorer for failed transaction tracking

## COMMON ERRORS AND SOLUTIONS

### 1. "CodeRejected" Error

**Error**: `Failed to instantiate contract: Module(ModuleError { index: 60, error: [27, 0, 0, 0], message: Some("CodeRejected") })`

**Causes**:

- Missing PolkaVM configuration
- Incorrect network settings
- Missing resolc configuration

**Solutions**:

- Ensure `polkavm: true` in network config
- Add resolc configuration block
- Use exact hardhat.config.js format above

### 2. "initcode is too big" Error

**Error**: `initcode is too big: 125282` (or similar number)

**Cause**: Contract bytecode exceeds ~100KB limit

**Solutions**:

- Remove OpenZeppelin dependencies
- Use minimal contract implementations
- Split large contracts into smaller components
- Implement custom lightweight versions

### 3. Configuration Errors

**Error**: `Cannot read properties of undefined (reading 'settings')`

**Solution**: Use string format for Solidity version: `solidity: "0.8.28"`

### 4. Dependency Issues

**Error**: `Cannot find module 'run-container'` or similar

**Solutions**:

- Install dependencies with `--force` flag
- Clear node_modules and reinstall
- Verify @parity/hardhat-polkadot version compatibility

### 5. Private Key Issues

**Error**: `No signers found` or authentication failures

**Solutions**:

- Set private key via `npx hardhat vars set PRIVATE_KEY`
- Ensure account has PAS tokens
- Verify private key format (no 0x prefix in vars)

## CONTRACT OPTIMIZATION

### Removing OpenZeppelin Dependencies

#### Instead of OpenZeppelin Ownablee:

```solidity
contract SimpleOwnable {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function transferOwnership(address newOwner) external onlyOwner {
        owner = newOwner;
    }
}
```

#### Instead of OpenZeppelin ReentrancyGuard:

```solidity
contract SimpleReentrancyGuard {
    bool private locked;

    modifier nonReentrant() {
        require(!locked, "Reentrant call");
        locked = true;
        _;
        locked = false;
    }
}
```

#### Minimal ERC721 Implementation:

```solidity
contract MinimalERC721 {
    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;
    mapping(uint256 => address) private _tokenApprovals;

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    function ownerOf(uint256 tokenId) public view returns (address) {
        return _owners[tokenId];
    }

    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }

    function approve(address to, uint256 tokenId) public {
        address owner = ownerOf(tokenId);
        require(msg.sender == owner, "Not authorized");
        _tokenApprovals[tokenId] = to;
        emit Approval(owner, to, tokenId);
    }

    function transferFrom(address from, address to, uint256 tokenId) public {
        require(_isApprovedOrOwner(msg.sender, tokenId), "Not authorized");
        _transfer(from, to, tokenId);
    }

    function _mint(address to, uint256 tokenId) internal {
        require(to != address(0), "Invalid address");
        require(_owners[tokenId] == address(0), "Already minted");

        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(address(0), to, tokenId);
    }

    function _transfer(address from, address to, uint256 tokenId) internal {
        require(ownerOf(tokenId) == from, "Not owner");
        require(to != address(0), "Invalid address");

        delete _tokenApprovals[tokenId];
        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(from, to, tokenId);
    }

    function _isApprovedOrOwner(address spender, uint256 tokenId) internal view returns (bool) {
        address owner = ownerOf(tokenId);
        return (spender == owner || _tokenApprovals[tokenId] == spender);
    }
}
```

## FRONTEND INTEGRATION

### Network Configuration for MetaMask

```javascript
const paseoConfig = {
  chainId: "0x1911f0a6", // 420420422 in hex
  chainName: "Polkadot Hub TestNet",
  nativeCurrency: {
    name: "PAS",
    symbol: "PAS",
    decimals: 18,
  },
  rpcUrls: ["https://testnet-passet-hub-eth-rpc.polkadot.io"],
  blockExplorerUrls: ["https://blockscout-passet-hub.parity-testnet.parity.io"],
};

// Add network to MetaMask
await window.ethereum.request({
  method: "wallet_addEthereumChain",
  params: [paseoConfig],
});
```

### Contract Interaction with Ethers.js

```javascript
import { ethers } from "ethers";

// Connect to Paseo
const provider = new ethers.JsonRpcProvider(
  "https://testnet-passet-hub-eth-rpc.polkadot.io"
);

// Contract instance
const contract = new ethers.Contract(contractAddress, abi, signer);

// Call functions
const result = await contract.someFunction();
```

## TESTING AND VERIFICATION

### Compilation Verification

```bash
npx hardhat compile
# Expected output: "Successfully compiled X Solidity files"
# Should NOT show contract size warnings for contracts <100KB
```

### Deployment Verification

1. **Successful Deployment Output**:

```
[ YourModule ] successfully deployed 🚀

Deployed Addresses
YourModule#YourContract - 0x1234567890abcdef...
```

2. **Block Explorer Verification**:

- Visit https://blockscout-passet-hub.parity-testnet.parity.io
- Search for contract address
- Verify contract creation transaction

3. **Contract Interaction Test**:

```bash
npx hardhat console --network passetHub
> const Contract = await ethers.getContractFactory("YourContract");
> const contract = Contract.attach("0x...");
> await contract.someFunction();
```

## DEBUGGING STRATEGIES

### Check Network Connectivity

```bash
curl -X POST -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"web3_clientVersion","params":[],"id":1}' \
  https://testnet-passet-hub-eth-rpc.polkadot.io
```

### Verify Account Balance

```bash
npx hardhat console --network passetHub
> await ethers.provider.getBalance("YOUR_ADDRESS")
```

### Clean Build and Deploy

```bash
npx hardhat clean
rm -rf ignition/deployments/
npx hardhat compile
npx hardhat ignition deploy ./ignition/modules/YourModule.js --network passetHub
```

### Transaction Tracking

If deployment fails:

1. Check block explorer for account transactions
2. Look for failed transactions with gas errors
3. Use `npx hardhat ignition track-tx <txHash> <deploymentId> --network passetHub`

## BEST PRACTICES

### Development Workflow

1. **Start Simple**: Deploy basic contracts first to verify setup
2. **Optimize Early**: Check contract sizes during development
3. **Test Locally**: Use local hardhat network for initial testing
4. **Incremental Deployment**: Deploy components separately if too large
5. **Document Addresses**: Keep track of all deployed contract addresses

### Contract Design for Paseo

1. **Minimize Dependencies**: Avoid heavy libraries
2. **Custom Implementations**: Write minimal versions of standard contracts
3. **Modular Design**: Split functionality across multiple contracts
4. **Gas Optimization**: Use efficient data structures and algorithms
5. **Proxy Patterns**: Consider upgradeable contracts for complex logic

### Security Considerations

1. **Private Key Management**: Always use hardhat vars, never commit keys
2. **Test Network Only**: Paseo is for testing, not production value
3. **Code Verification**: Verify contracts on block explorer when possible
4. **Access Controls**: Implement proper ownership and permission systems

## REFERENCE COMMANDS

### Essential Commands

```bash
# Project setup
npm install --save-dev @parity/hardhat-polkadot solc@0.8.28
npm install --force @nomicfoundation/hardhat-toolbox
npx hardhat-polkadot init

# Configuration
npx hardhat vars set PRIVATE_KEY
npx hardhat vars list

# Development
npx hardhat compile
npx hardhat clean
npx hardhat test

# Deployment
npx hardhat ignition deploy ./ignition/modules/Module.js --network passetHub
rm -rf ignition/deployments/  # Clean deployment state

# Debugging
npx hardhat console --network passetHub
npx hardhat node  # Local development
```

### Environment Variables

```bash
# Optional .env configuration
REPORT_GAS=true
ETHERSCAN_API_KEY=your_key_here
```

## TROUBLESHOOTING CHECKLIST

When deployment fails, check:

- [ ] Hardhat config matches exact format above
- [ ] Private key set via `npx hardhat vars set PRIVATE_KEY`
- [ ] Account has sufficient PAS tokens
- [ ] Contract compiles without errors
- [ ] Contract size under 100KB
- [ ] Network connectivity to RPC endpoint
- [ ] No OpenZeppelin dependencies causing size issues
- [ ] Clean deployment state if resuming failed deployment

## LIMITATIONS AND WORKAROUNDS

### Current Limitations

- **Contract Size**: 100KB bytecode limit
- **OpenZeppelin**: Most libraries too large
- **Network Stability**: Preview release, potential downtime
- **Debugging Tools**: Limited compared to mainnet
- **Documentation**: Sparse, community-driven solutions

### Recommended Workarounds

- **Size Issues**: Use minimal custom implementations
- **Complex Logic**: Split across multiple contracts
- **State Management**: Use events for off-chain data
- **User Experience**: Provide clear error messages
- **Testing**: Extensive local testing before deployment

This guide provides comprehensive information for successful smart contract deployment to Paseo TestNet using Claude Code, including all critical configurations, common issues, and optimization strategies.
