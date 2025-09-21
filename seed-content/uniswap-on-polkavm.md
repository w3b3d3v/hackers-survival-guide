# Uniswap V2 Successfully Launches on PolkaVM: A Milestone for Polkadot Hub | by OneBlock+ | Medium

![OneBlock+](https://miro.medium.com/v2/resize:fill:64:64/1*YKY5yPoVDZgpzaO--kCt3w.jpeg)
[OneBlock+](https://medium.com/@OneBlockplus)

Press enter or click to view image in full size

> Disclaimer: All referenced code is provided by PaperMoon and is not recommended for direct use in production environments. If you plan to use it in production, please ensure it has been thoroughly tested and audited.

_Author: Maggie, PaperMoon_

_Translation: OneBlock+_

Uniswap V2 has recently been successfully deployed on PolkaVM. At first glance, it may seem like just another protocol going live on a new blockchain.

But in reality, this milestone signals something much more important: **Polkadot’s smart contract ecosystem is now truly usable.**

This is a community-led technical migration — not an official deployment by Uniswap — but it sends two powerful signals:

✅ Polkadot is no longer just synonymous with cross-chain interoperability. **It’s now capable of hosting mainstream DApps.**  
✅ Solidity-based projects can migrate with minimal friction. **The door to Polkadot is now truly open for the EVM ecosystem.**

This isn’t just a flashy headline — it’s a moment for developers to actually take action. For Web3 projects looking for a low-cost, scalable deployment platform, this could be a compelling new home.

## What Is PolkaVM, and How Is It Different from EVM Chains?

PolkaVM is a RISC-V–based virtual machine developed by the Polkadot core team. It’s designed to provide a high-performance, low-cost, and business-friendly environment for on-chain applications.

Unlike most common EVM chains, PolkaVM isn’t based on Wasm and isn’t a direct fork of the EVM — it’s a brand new architecture with several key features:

- **RISC-V architecture**: Offers more flexibility and control at the virtual machine level, allowing for deeper optimizations tailored to blockchain use cases.
- **EVM compatibility**: PolkaVM can already run most contracts written in Solidity.
- **High runtime efficiency**: Its JIT compiler outperforms traditional interpreter-based execution models.
- **Native support for Polkadot interoperability**: Seamlessly connects to the wider ecosystem via XCM and other cross-chain protocols.

While PolkaVM isn’t an “EVM chain” in the traditional sense, it achieves Solidity compatibility through a YUL compiler — this is the technical foundation that made the Uniswap V2 deployment possible.

## Contract Model: PolkaVM vs. EVM

In the traditional EVM model, each time a contract is deployed, a complete copy of the contract’s bytecode is stored on-chain — even if the code is identical. If you deploy the same contract twice, it gets stored twice.

This leads to two major problems:

- **Heavy data redundancy**: The more deployments, the more bloated the chain becomes.
- **High overhead for nested contracts**: For example, if contract A deploys contract B during its own deployment, it must embed B’s full bytecode inside its own. This causes the contract size to grow significantly.

PolkaVM introduces a clever design to address this:

🧩 It splits the mapping of **contract address → contract code** into a two-layer structure:  
**ContractAddress → ContractCodeHash → Bytecode**

This structure brings two key benefits:

✅ **1\. Code reuse to avoid redundant storage**  
If the contract code is identical, the bytecode is only stored once on-chain — no matter how many times it’s deployed. This means:

- Identical logic won’t cause unnecessary blockchain bloat;
- Storage is used more efficiently, improving sync and scalability for nodes.

✅ **2\. Lightweight nested contracts**  
When contract A needs to deploy contract B, it only needs to reference B’s `CodeHash`, instead of embedding B’s full bytecode. This results in:

- Smaller deployment sizes;
- More flexible and scalable nested logic;
- Greater freedom for developers to build complex, modular systems without ending up with “fat contracts”.

This model not only optimizes storage but makes **modular contract architecture** truly feasible. If you’ve ever built nested contracts on Ethereum, you’ll immediately see how impactful this change is.

It also means that building large-scale, component-based systems like DeFi or GameFi in the Polkadot ecosystem is fundamentally more efficient from the ground up.

## Uniswap V2 on PolkaVM

**Uniswap V2 is one of the earliest and most successful AMM (Automated Market Maker) protocols in DeFi.** Its successful deployment on PolkaVM marks a critical turning point — showing that PolkaVM’s compatibility has reached a stage where real-world applications are viable.

Key aspects of this deployment include:

- **Original Solidity code preserved**: No code changes were required — indicating a high degree of compatibility between PolkaVM and the Ethereum toolchain
- **Fully functional**: Contracts execute correctly, events are triggered properly, and transactions are handled without issues.
- **90% test coverage passed**: Due to fundamental differences in gas computation between Polkadot and Ethereum, gas-related test cases aren’t portable. However, all other core logic tests passed on the PolkaVM chain.

This was not a “symbolic” deployment — it’s a genuinely usable version that can handle real assets and real transactions.

## How to Run Uniswap V2 on Polkadot

### 🧩 Step 1: Prepare Substrate and Compatibility Tools

PolkaVM is not a typical EVM or Wasm environment. It’s a RISC-V–based virtual machine with a compatibility layer for Solidity contracts. You’ll need to build the Polkadot SDK from source:

```
git clone https://github.com/paritytech/polkadot-sdk
cd polkadot-sdk
cargo build --bin substrate-node --release
cargo build -p pallet-revive-eth-rpc --bin eth-rpc --release
```

This will generate two essential components:

- `substrate-node`: A local node running PolkaVM
- `eth-rpc`: An RPC adapter allowing EVM tools like Hardhat to interact with PolkaVM

### 🧩 Step 2: Clone the Uniswap Migration Code

This migration was led by the community team Papermoon. The code is open-sourced on GitHub:

```
git clone git@github.com:papermoonio/uniswap-v2-polkadot.git
cd uniswap-v2-polkadot
pnpm install
```

This project ports Uniswap V2’s core contracts (factory, pair, router, etc.) into a Hardhat environment adapted for PolkaVM.

### 🧩 Step 3: Configure Hardhat to Connect with PolkaVM

Open `hardhat.config.js` and set up the PolkaVM-related networks—both the local testnet and the AssetHub Westend network:

```
networks: {
  localNode: {
    url: "http://127.0.0.1:8545",
    nodeBinaryPath: "/your/path/to/substrate-node",
    adapterBinaryPath: "/your/path/to/eth-rpc",
    ...
  }
}
```

This is the critical bridge: Hardhat communicates with the local `substrate-node` through `eth-rpc`, enabling Solidity contracts to deploy on PolkaVM.

### 🧩 Step 4: Test Deployment — Get It Running!

Now, you can test and deploy Uniswap just like you would on an EVM chain, either locally or on Westend:

- Run tests on local PolkaVM:

```
npx hardhat test --network localNode
```

- Deploy on Westend public testnet:

```
npx hardhat test --network westendHub
```

## Test Results: Validating Uniswap V2 on-Chain

To ensure this wasn’t just a “successful deploy and done” scenario, the Papermoon team conducted thorough functional testing of the migration version.

Modules tested include:

Press enter or click to view image in full size

Tests related to gas usage were skipped due to the fundamentally different fee models between Ethereum and Polkadot. However, **all other tests passed**, demonstrating that **PolkaVM’s Solidity support has reached a practical and usable level.**

## 📈 New Opportunities on Polkadot: A Lightweight, Efficient Deployment Path for EVM Projects

The successful deployment of Uniswap V2 is more than a technical milestone — it sends a clear signal: Solidity-based projects are no longer limited to traditional EVM chains. Polkadot has emerged as a truly viable destination chain.

Compared to Ethereum mainnet, Polkadot offers several advantages:

💸 **Lower costs** — no need to pay exorbitant gas fees  
🚄 **Faster transaction finality** — 6-second block times  
📦 **Lightweight contract model** — thanks to the CodeHash mechanism  
🧩 **Modular by design** — natively supports complex business logic

For many projects looking to reduce deployment costs, improve scalability, and embrace cross-chain functionality, **Polkadot + PolkaVM** offers a highly attractive alternative.

## What’s Next?

✅ **More Solidity Projects Exploring Migration**

The community team **Papermoon** has already made significant progress with Solidity on PolkaVM, including:

- Successfully migrating **Uniswap V2** contracts
- Porting public goods like **Deterministic Deploy**
- Providing technical support for mainstream DeFi protocol migrations

If you’re a Solidity developer, you can [**fork the Uniswap V2 Polkadot repo**](https://github.com/papermoonio/uniswap-v2-polkadot) right now and start experimenting.

🚧 **Still in Progress:**

- Full support for developer tools like **Foundry** is still being integrated
- Some off-chain functions (e.g. `ethers.getCreate2Address`) require modification due to differences in the contract model

But these are exactly the kinds of improvements that an open-source developer community can drive forward together.

## For Developers and Project Teams: **Why You Should Pay Attention to PolkaVM**

If you’re a Web3 developer, team lead, or DeFi builder, here’s why PolkaVM deserves your attention:

- 💰 **Lower deployment costs** — cheaper gas, lighter-weight on-chain operations
- 🔄 **Solidity compatibility** — migrate existing projects without a full rebuild
- 🌐 **Access to Polkadot’s cross-chain ecosystem** — greater scalability, connectivity with DeFi, GameFi, and NFT apps across parachains
- 🧱 **Mature infrastructure** — already includes block explorers, RPC providers, oracles, and more
- 🚀 **First-mover advantage** — early adopters can gain greater visibility, technical support, and potential ecosystem incentives

## ✍️ Final Thoughts

The migration of Uniswap V2 is more than just another protocol deployment — it marks the beginning of **a new era for smart contracts on Polkadot**. PolkaVM is rapidly becoming a **safe haven and testing ground** for the next generation of Solidity-based projects.

In the coming months, we may see more DEXs, stablecoins, lending protocols, on-chain games, and NFT projects arriving on this new stage.

If you’re a builder, now’s the time to give PolkaVM a try.

### 📚 Further Reading and Resources:

💻 Polkadot smart contracts documentation: [https://contracts.polkadot.io/](https://contracts.polkadot.io/)

📦 Example project source code on GitHub: [https://github.com/papermoonio/uniswap-v2-polkadot/](https://github.com/papermoonio/uniswap-v2-polkadot/)

## About OneBlock+

OneBlock+ is the first and the largest blockchain developer community in China. At OneBlock+, we provide full support for developers with their substrate studies and further set off their career paths. We host Polkadot Hackathons every season to attract top-notch developers to build and innovate for the prosperity of the ecosystem. As a greater China technology resource integrator, OneBlock+ also partners with developers, communities, business elites, and key media who have business insights and experiences in the blockchain industry to provide educational events, such as technical courses, webinars, AMAs, and offline events for the industry. Want to shape the crypto world together? Come and join us today!

[Twitter](https://twitter.com/OneBlock_) / [Telegram](https://t.me/oneblock_dev) / [Discord](https://discord.gg/fE8deY4UbP) / [YouTube](https://www.youtube.com/channel/UCWo2r3wA6brw3ztr-JmzyXA)
