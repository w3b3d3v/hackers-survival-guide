# Polkadot Hackathon Development Guide

_For Developers New to Web3_

## Documentation Overview

- **[Polkadot Development Tools](polkadot-development-tools.md)** - Comprehensive toolkit and resource map for building on Polkadot
- **[Smart Contracts 101](101-smart-contracts-polkadot.md)** - In-depth beginner's guide to Polkadot smart contracts
- **[Writing Guidelines](writing-guidelines.md)** - Writing standards and best practices for AI agents
- **[Agents](Agents.md)** - Complete deployment guide and troubleshooting reference for agents

## 1. Quick Start with kitdot

### Who This Guide Is For

Developers with solid programming skills but no Web3/Polkadot experience.

### Key Goal

Deploy working smart contracts on Polkadot testnet and build a functional frontend within hackathon timeframes.

### Start Your Project with kitdot

**Recommended**: Use kitdot@latest for proper network configuration and project setup:

```bash
npx kitdot@latest install -y
```

or

```bash
npm install -g kitdot@latest
kitdot init my-polkadot-project
cd my-polkadot-project
```

**Why kitdot?** Ensures proper network settings, correct dependencies, and battle-tested configurations. Skip setup headaches and start building immediately.

**Web2 Experience on Web3:** kitdot's default setup initializes a complete frontend project that provides a familiar Web2 user experience for Web3 applications. Users interact with your dApp without needing to understand blockchain complexity.

**Existing Project?** Start fresh with kitdot@latest and copy your files over. This prevents configuration conflicts and network connection issues.

## 2. Pre-Built Contract Libraries

### Leverage Existing Code

Before building from scratch, explore these battle-tested contract libraries:

**Thirdweb Contracts**

- **Repository:** [thirdweb-dev/contracts](https://github.com/thirdweb-dev/contracts/tree/main/contracts)
- **Best for:** NFTs, tokens, marketplaces, governance
- **Advantage:** Production-ready, gas-optimized implementations
- **Note:** May need size optimization for Polkadot's 100KB limit

**Polkadot-Optimized OpenZeppelin Contracts**

- **Repository:** [papermoonio/openzeppelin-contracts-polkadot](https://github.com/papermoonio/openzeppelin-contracts-polkadot)
- **Best for:** Standard implementations (ERC20, ERC721, ERC1155)

### Strategy

1. **Browse** existing contracts for inspiration
2. **Copy** core logic patterns
3. **Simplify** by removing unnecessary features
4. **Test** contract size with `npx hardhat compile`

## 3. Development Environment Setup

### Choose Your Path

![Development Path Flowchart](../flowchart.png)

| Factor                | Remix IDE        | Hardhat            |
| --------------------- | ---------------- | ------------------ |
| **Setup Time**        | Quick            | Moderate           |
| **Experience Needed** | None             | JavaScript/Node.js |
| **Best For**          | Simple contracts | Complex dApps      |

### Path 1: Remix IDE

1. Open [Polkadot Remix IDE](https://remix.polkadot.io)
2. Get testnet tokens from [faucet](https://faucet.polkadot.io/?parachain=1111)
3. Start coding in browser

**Getting ABI for Frontend Projects:**
After compiling contracts in Remix:

1. Go to **Solidity Compiler** tab
2. Click on your contract name under compilation artifacts
3. Copy the **ABI** array from the compilation details
4. Use in frontend projects:

```javascript
// Save ABI as contractABI.json or import directly
import { ethers } from "ethers";

const contractABI = [
  /* paste ABI array here */
];
const contract = new ethers.Contract(contractAddress, contractABI, signer);
```

### Path 2: Manual Hardhat Setup (Not Recommended)

**Use kitdot@latest instead** for automated setup, but if you must set up manually:

```bash
# Better: Use kitdot@latest init instead
mkdir hackathon-project && cd hackathon-project
npm init -y
npm install --save-dev @parity/hardhat-polkadot solc@0.8.28
npm install --force @nomicfoundation/hardhat-toolbox
npx hardhat-polkadot init
```

**IMPORTANT:** Always use `@parity/hardhat-polkadot` instead of standard hardhat. This plugin provides essential PolkaVM compatibility and network configurations required for Polkadot deployment.

**kitdot@latest handles this automatically** with proper network configurations.

### Path 3: Local Development Network

For local testing without connecting to testnets:

```bash
# Run local generic testnet (NOT a PolkaVM testnet)
npx hardhat node

# In another terminal, deploy to local network
npx hardhat ignition deploy ./ignition/modules/YourModule.js --network localhost
```

**Note:** This runs a standard Ethereum local testnet, not a PolkaVM-compatible network. Use for initial development and testing before deploying to Paseo.

**Create hardhat.config.js:**

```javascript
require("@nomicfoundation/hardhat-toolbox");
require("@parity/hardhat-polkadot");
const { vars } = require("hardhat/config");

module.exports = {
  solidity: "0.8.28",
  resolc: { version: "0.3.0", compilerSource: "npm" },
  networks: {
    passetHub: {
      polkavm: true,
      url: "https://testnet-passet-hub-eth-rpc.polkadot.io",
      accounts: [vars.get("PRIVATE_KEY")],
    },
  },
};
```

**Setup Wallet:**

```bash
npx hardhat vars set PRIVATE_KEY
# Enter your private key (no 0x prefix)
```

**Test Setup:**

```bash
npx hardhat compile
npx hardhat ignition deploy ./ignition/modules/Test.js --network passetHub
```

## 4. Smart Contract Development

### Critical Constraints

- **Maximum bytecode:** ~100KB
- **Solidity version:** ^0.8.28

### Test Contract

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Test {
    uint256 public value = 42;
    function setValue(uint256 _value) external { value = _value; }
}
```

### Minimal ERC20

```solidity
contract SimpleToken {
    mapping(address => uint256) public balanceOf;
    uint256 public totalSupply;
    string public name;
    string public symbol;

    constructor(string memory _name, string memory _symbol, uint256 _supply) {
        name = _name; symbol = _symbol; totalSupply = _supply;
        balanceOf[msg.sender] = _supply;
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        return true;
    }
}
```

### Deployment Strategy

```javascript
// ignition/modules/YourModule.js
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("YourModule", (m) => {
  const contract = m.contract("YourContract", []);
  return { contract };
});
```

```bash
npx hardhat compile
npx hardhat ignition deploy ./ignition/modules/YourModule.js --network passetHub
```

## 5. Wallet Setup (If not using default template from kitdot)

### Enable Testnets on Your Wallet

**MetaMask:**

1. Open MetaMask extension
2. Click on your profile icon (top right)
3. Go to **Settings** → **Advanced**
4. Enable **Show test networks**
5. Your network dropdown will now show testnet options

**Talisman:**

1. Open Talisman extension
2. Go to **Settings** → **Networks & Tokens**
3. Enable **Show test networks**
4. Testnet networks will appear in your network list

### Add Paseo Network to MetaMask

**Quick Method (Recommended):**

1. Visit [https://chainlist.org/?search=passet](https://chainlist.org/?search=passet)
2. Find "Polkadot Asset Hub Testnet"
3. Click **Connect Wallet** and **Add to MetaMask**
4. Approve the network addition in MetaMask

**Manual Method:**

```javascript
// Add this configuration manually in MetaMask
Network Name: Polkadot Hub TestNet
Chain ID: 420420422
RPC URL: https://testnet-passet-hub-eth-rpc.polkadot.io
Currency Symbol: PAS
Block Explorer: https://blockscout-passet-hub.parity-testnet.parity.io
```

## 6. Frontend Integration

### Connect to Polkadot Network

```javascript
const paseoConfig = {
  chainId: "0x1911f0a6", // 420420422
  chainName: "Polkadot Hub TestNet",
  nativeCurrency: { name: "PAS", symbol: "PAS", decimals: 18 },
  rpcUrls: ["https://testnet-passet-hub-eth-rpc.polkadot.io"],
  blockExplorerUrls: ["https://blockscout-passet-hub.parity-testnet.parity.io"],
};

await window.ethereum.request({
  method: "wallet_addEthereumChain",
  params: [paseoConfig],
});
```

### Contract Interaction (Ethers.js)

```javascript
import { ethers } from "ethers";

const provider = new ethers.JsonRpcProvider(
  "https://testnet-passet-hub-eth-rpc.polkadot.io"
);
const contract = new ethers.Contract(contractAddress, abi, signer);
const result = await contract.someFunction();
```

### Template Projects

- **kitdot@latest (Recommended):** `kitdot@latest init -y` - Configured templates with proper network settings
- **React + Hardhat:** [create-polkadot-dapp](https://www.npmjs.com/package/create-polkadot-dapp)
- **Examples:** [hardhat-polkadot-example](https://github.com/UtkarshBhardwaj007/hardhat-polkadot-example)

### Project Management Template

For effective hackathon project management and team collaboration:

- **GitHub Projects Template:** [Hackathon Project Board](https://github.com/orgs/w3b3d3v/projects/34/views/1) - Ready-to-use project board with task tracking, sprint planning, and team coordination features

## 6. Troubleshooting

### Emergency Commands

```bash
# Clean restart
npx hardhat clean && rm -rf ignition/deployments/ && npx hardhat compile

# Check balance
npx hardhat console --network passetHub
> await ethers.provider.getBalance("YOUR_ADDRESS")

# Track deployment
npx hardhat ignition track-tx <txHash> <deploymentId> --network passetHub
```

## 7. Project Ideas

**Proven Simple Ideas:**

- **Custom Token:** [ERC-20 Tutorial](https://docs.polkadot.com/tutorials/smart-contracts/deploy-erc20/)
- **NFT Collection:** [NFT Tutorial](https://docs.polkadot.com/tutorials/smart-contracts/deploy-nft/)
- **Simple DeFi:** [Uniswap V2 Example](https://github.com/papermoonio/uniswap-v2-polkadot)

**Comprehensive P2P Sharing Economy Ideas:**

- **[Comprehensive P2P Sharing Economy Catalog](https://docs.google.com/document/d/165krMbAVbejDAOTD2xa9CB1hDcmciHXI0LJ4hEpH2SQ):** Extensive catalog of peer-to-peer sharing economy platforms across various sectors with implemented applications and "Possible Ideas" for unexplored categories. Perfect for identifying market gaps and building decentralized alternatives.

## 8. Network Details

- **Chain ID:** 420420422
- **RPC:** https://testnet-passet-hub-eth-rpc.polkadot.io
- **Explorer:** https://blockscout-passet-hub.parity-testnet.parity.io
- **Faucet:** https://faucet.polkadot.io/?parachain=1111

## 9. Security Best Practices

- Keep contracts under 100KB
- Validate all inputs
- Use minimal implementations instead of heavy libraries

### Simple Reentrancy Guard

```solidity
contract SimpleReentrancyGuard {
    bool private locked;
    modifier nonReentrant() {
        require(!locked, "Reentrant call");
        locked = true; _; locked = false;
    }
}
```

## 10. Demo Preparation

**Essential Components:**

1. Deployed contract on block explorer
2. Frontend connecting to wallet
3. Core functionality working
4. Clear value demonstration

**Demo Script:**

- Brief: Problem statement
- Core: Live demo of solution
- Wrap: Technical highlights & future vision

## 11. Resources & Tools

**Essential Documentation**

- [Polkadot Open Source Tool Map](polkadot-development-tools.md): We've created a map of all the major open source tools on Polkadot.
- [Polkadot Smart Contract Basic Guide](101-smart-contracts-polkadot.md): If you want to start from scratch and need more in-depth documentation on Polkadot smart contracts, such as a 101 for beginners, we suggest checking out this guide.

**Development Environments:**

- [Remix IDE](https://docs.polkadot.com/develop/smart-contracts/dev-environments/remix/)
- [Hardhat Guide](https://docs.polkadot.com/develop/smart-contracts/dev-environments/hardhat/)

**Libraries:**

- [Ethers.js Integration](https://docs.polkadot.com/develop/smart-contracts/libraries/ethers-js/)
- [Web3.js Integration](https://docs.polkadot.com/develop/smart-contracts/libraries/web3-js/)

**Detailed References:**

- **Writing Guidelines:** Use `writing-guidelines.md` when creating documentation
- **Agents Context Setup:** `Agents.md`
- **Network Details:** `docs/seed-content/configs.md`
- **Tools Overview:** `docs/polkadot-development-tools.md`

**Video Tutorials:**

- [Deploy Contracts Workshop](https://youtu.be/TGgpG1jPxeE)
- [Smart Contracts on Polkadot](https://www.youtube.com/watch?v=GPuTt10dxKI)

## Start with kitdot

Use `kitdot@latest init -y` for proper project setup with verified network configurations. Alternative templates available.

You're building on Polkadot using familiar Ethereum tools. Focus on working functionality over perfect code.
