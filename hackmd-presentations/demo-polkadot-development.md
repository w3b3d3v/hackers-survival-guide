# Building on Polkadot Asset Hub
<!-- HackMD Presentation - Mock Demo for Latin Hack 2024 -->

<style>
/* Brand Color Palette - Polkadot Theme */
:root {
  --primary-color: #e6007a;     /* Polkadot Pink */
  --secondary-color: #552bbf;   /* Polkadot Purple */
  --accent-color: #00d4aa;      /* Polkadot Teal */
  --text-color: #1a1a1a;        /* Dark text */
  --background-color: #ffffff;  /* White background */
  --light-gray: #f8f9fa;        /* Light backgrounds */
}

/* Global presentation styling */
.reveal {
  font-family: "Inter", "Segoe UI", Roboto, sans-serif;
  color: var(--text-color);
}

.reveal h1, .reveal h2, .reveal h3 {
  color: var(--primary-color);
  font-weight: 700;
}

.reveal h1 {
  font-size: 2.5em;
  margin-bottom: 0.5em;
}

.reveal h2 {
  font-size: 2em;
  margin-bottom: 0.4em;
}

/* Slide backgrounds */
.reveal .slides section {
  background: var(--background-color);
  border-top: 4px solid var(--primary-color);
}

/* Code blocks styling */
.reveal pre {
  background: var(--light-gray);
  border-left: 4px solid var(--accent-color);
}

.reveal code {
  background: var(--light-gray);
  color: var(--secondary-color);
  padding: 0.2em 0.4em;
  border-radius: 4px;
}

/* Lists styling */
.reveal ul li, .reveal ol li {
  margin-bottom: 0.5em;
}

/* Emphasis and strong styling */
.reveal strong {
  color: var(--primary-color);
}

.reveal em {
  color: var(--secondary-color);
  font-style: italic;
}

/* Quote styling */
.reveal blockquote {
  border-left: 4px solid var(--accent-color);
  background: var(--light-gray);
  padding: 1em;
  margin: 1em 0;
}

/* Custom slide classes */
.title-slide {
  text-align: center;
  background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
  color: white;
}

.title-slide h1 {
  color: white;
}

.section-slide {
  background: var(--light-gray);
  border-top: 8px solid var(--accent-color);
}

.network-slide {
  background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
  color: white;
}

.contact-slide {
  text-align: center;
  background: var(--primary-color);
  color: white;
}
</style>

<!-- Title Slide -->
<!-- {_class="title-slide"} -->
# Building on Polkadot Asset Hub
## From Zero to dApp in Latin Hack 2024
### Your Name | Latin Hack Conference

---

<!-- Agenda Slide -->
## What We'll Cover Today

- **🌐 Network Overview** - Kusama vs Paseo environments
- **⚙️ Development Setup** - Getting your environment ready
- **🏗️ Smart Contracts** - Building your first dApp
- **🚀 Deployment** - From testnet to mainnet
- **🔍 Tools & Resources** - Explorer, faucets, and debugging

---

<!-- Section Break -->
<!-- {_class="section-slide"} -->
# Network Overview

---

<!-- {_class="network-slide"} -->
## Production Environment: Kusama Asset Hub

**Network Specifications:**
- **Chain ID**: `420420418`
- **Para ID**: `1000`
- **Symbol**: `KSM`

**Key Endpoints:**
- **EVM RPC**: `https://kusama-asset-hub-eth-rpc.polkadot.io`
- **Substrate RPC**: `https://kusama-asset-hub-rpc.polkadot.io/`

**Explorers:**
- Primary: `blockscout-kusama-asset-hub.parity-chains-scw.parity.io`
- Alternative: `https://assethub-kusama.subscan.io/`

---

## Testing Environment: Paseo Asset Hub

> **"Before you push to mainnet, test your code on Paseo. Passet Hub is the bleeding-edge testnet where legends are born and bugs go to die."**

**Network Specifications:**
- **Chain ID**: `420420422`
- **Symbol**: `PAS`
- **Para ID**: `1111`

**Development Endpoints:**
- **RPC**: `https://testnet-passet-hub-eth-rpc.polkadot.io`
- **Explorer**: `https://blockscout-passet-hub.parity-testnet.parity.io/`
- **Faucet**: `https://faucet.polkadot.io/?parachain=1111`

---

<!-- Section Break -->
<!-- {_class="section-slide"} -->
# Development Workflow

---

## Step 1: Environment Setup

**Prerequisites:**
```bash
# Install Node.js and npm
node --version  # v18+
npm --version   # v9+

# Install development tools
npm install -g @polkadot/api
npm install -g @polkadot/extension-dapp
```

**Project Structure:**
```
my-polkadot-dapp/
├── contracts/          # Smart contracts
├── frontend/           # dApp interface
├── scripts/           # Deployment scripts
└── config/            # Network configurations
```

---

## Step 2: Network Configuration

Create `config/networks.js`:

```javascript
const networks = {
  paseo: {
    chainId: 420420422,
    rpc: 'https://testnet-passet-hub-eth-rpc.polkadot.io',
    explorer: 'https://blockscout-passet-hub.parity-testnet.parity.io/',
    faucet: 'https://faucet.polkadot.io/?parachain=1111'
  },
  kusama: {
    chainId: 420420418,
    rpc: 'https://kusama-asset-hub-eth-rpc.polkadot.io',
    explorer: 'blockscout-kusama-asset-hub.parity-chains-scw.parity.io'
  }
};
```

---

## Step 3: Smart Contract Development

**Basic Contract Example:**

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LatinHackDemo {
    mapping(address => string) public messages;

    event MessageSet(address indexed user, string message);

    function setMessage(string memory _message) public {
        messages[msg.sender] = _message;
        emit MessageSet(msg.sender, _message);
    }

    function getMessage(address _user) public view returns (string memory) {
        return messages[_user];
    }
}
```

---

<!-- Section Break -->
<!-- {_class="section-slide"} -->
# Deployment Process

---

## Testing Strategy

**1. Local Development**
```bash
# Start local development chain
substrate-contracts-node --dev --ws-port 9944
```

**2. Paseo Testnet Deployment**
```bash
# Get test tokens from faucet
curl -X POST https://faucet.polkadot.io/api/faucet \
  -H "Content-Type: application/json" \
  -d '{"address":"YOUR_ADDRESS","parachain":1111}'

# Deploy to testnet
npm run deploy:paseo
```

**3. Kusama Mainnet**
```bash
# Final deployment (after thorough testing!)
npm run deploy:kusama
```

---

## Deployment Script Example

```javascript
const { ethers } = require('hardhat');

async function deployContract(networkConfig) {
  console.log(`Deploying to ${networkConfig.name}...`);

  // Configure provider
  const provider = new ethers.JsonRpcProvider(networkConfig.rpc);

  // Deploy contract
  const Contract = await ethers.getContractFactory('LatinHackDemo');
  const contract = await Contract.deploy();

  await contract.waitForDeployment();

  console.log(`Contract deployed to: ${await contract.getAddress()}`);
  console.log(`Explorer: ${networkConfig.explorer}/address/${await contract.getAddress()}`);
}
```

---

<!-- Section Break -->
<!-- {_class="section-slide"} -->
# Tools & Resources

---

## Essential Development Tools

**Explorers & Debugging:**
- **Blockscout**: Transaction and contract analysis
- **Subscan**: Advanced blockchain data
- **Polkadot.js Apps**: Direct chain interaction

**Development Environment:**
- **Hardhat**: Smart contract development
- **Remix**: Browser-based IDE
- **VS Code**: With Solidity extensions

**Testing & Faucets:**
- **Paseo Faucet**: Free test tokens
- **Local Node**: `substrate-contracts-node`

---

## Key Resources

**📚 Official Documentation:**
- [Polkadot Tutorial](https://docs.polkadot.com/tutorials/smart-contracts/launch-your-first-project/)
- [Asset Hub Documentation](https://docs.polkadot.com/developers/parachains/asset-hub/)

**🛠️ Development Tools:**
- [Polkadot.js API](https://polkadot.js.org/docs/)
- [ink! Smart Contracts](https://use.ink/)

**🌐 Community:**
- [Polkadot Stack Exchange](https://substrate.stackexchange.com/)
- [Discord Developer Channels](https://discord.gg/polkadot)

---

## Pro Tips for Success

**🎯 Development Best Practices:**
1. **Always test on Paseo first** - Never skip testnet
2. **Use proper gas estimation** - Account for network fees
3. **Implement proper error handling** - Graceful failure modes
4. **Monitor contract events** - Essential for debugging

**🔐 Security Considerations:**
- Audit smart contracts before mainnet
- Use multi-signature wallets for critical operations
- Implement proper access controls
- Keep dependencies updated

---

<!-- Section Break -->
<!-- {_class="section-slide"} -->
# Live Demo

---

## Demo: Deploying Our First Contract

**What we'll do:**
1. 🔧 Configure Paseo testnet connection
2. 💰 Get test tokens from faucet
3. 📝 Deploy the LatinHackDemo contract
4. 🔍 Verify on Blockscout explorer
5. ⚡ Interact with the contract

**Follow along:** `github.com/yourproject/latin-hack-demo`

---

<!-- Q&A Section -->
<!-- {_class="section-slide"} -->
# Questions & Discussion

---

## Let's Connect!

**Discussion Topics:**
- Parachain integration strategies
- Cross-chain communication patterns
- Asset Hub specific features
- Optimization techniques

**Need Help?**
- Ask questions now
- Join the Polkadot Discord
- Check out the hackathon mentors

---

<!-- Contact/Thank You Slide -->
<!-- {_class="contact-slide"} -->
# Thank You!

## Keep Building on Polkadot! 🚀

**Resources:**
- **Slides**: [hackmd.io/your-presentation]
- **Code Examples**: [github.com/your-repo]
- **Documentation**: [docs.polkadot.com]

**Connect:**
- 🐦 Twitter: @yourhandle
- 💼 LinkedIn: /in/yourprofile
- 📧 Email: you@example.com

**Happy Hacking at Latin Hack 2024!** 🎉

---

<!-- Backup Slides -->
# Backup: Advanced Topics

---

## Cross-Chain Asset Transfers

**XCM Integration:**
```javascript
// Example: Transfer assets between parachains
const xcmTransfer = await api.tx.xcmPallet.teleportAssets(
  dest,           // Destination parachain
  beneficiary,    // Recipient address
  assets,         // Assets to transfer
  feeAssetItem    // Fee payment
);
```

**Use Cases:**
- Multi-chain dApps
- Asset bridging
- Governance participation

---

## Performance Optimization

**Gas Optimization Strategies:**
- Batch operations when possible
- Use view functions for reads
- Optimize storage patterns
- Implement efficient data structures

**Network-Specific Considerations:**
- Asset Hub: Optimized for asset operations
- Lower fees compared to Ethereum
- Faster finality times

<!-- Speaker Notes:
- Practice the demo beforehand
- Have backup plan if live demo fails
- Prepare for questions about:
  - Gas costs comparison
  - Cross-chain capabilities
  - Security considerations
  - Development timeline
-->