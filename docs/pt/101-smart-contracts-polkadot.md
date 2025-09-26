## 🚀 Desenvolvimento de Smart Contracts no Polkadot

O Polkadot permite **deploy de smart contracts** via **PolkaVM**. Isso permite usar **ferramentas do Ethereum** familiares e **bibliotecas** enquanto aproveita o robusto ecossistema do Polkadot. **PolkaVM** está ativo no Passet Hub, a testnet da comunidade Polkadot. ✅

Por favor, forneça **feedback** sobre sua experiência fazendo deploy de smart contracts no Polkadot usando este [formulário de feedback](https://forms.gle/BhL5ZCaFMUvSipos8).

_Consulte o documento de [**problemas conhecidos**](https://docs.google.com/document/d/1j5hnQZRqlbVagW28dC24OVAF8uRih5jWubBxy5PlMYc/edit?usp=sharing) se você estiver enfrentando problemas ao fazer deploy de contratos ou usar qualquer uma das ferramentas abaixo. Se você tiver um novo bug ou problema, por favor reporte um issue no [Contracts Bug tracker](https://github.com/paritytech/contract-issues) no Github._

### 📚 Ambientes de Desenvolvimento Solidity

Existem múltiplos ambientes de desenvolvimento já disponíveis para o desenvolvimento de smart contracts no Polkadot. Aqui estão alguns dos mais populares:

- 🖥️ [**Polkadot Remix IDE**](https://docs.polkadot.com/develop/smart-contracts/dev-environments/remix/) - uma IDE baseada na web que permite escrever, testar e fazer deploy de smart contracts diretamente no seu navegador. É integrada com chains compatíveis: você pode fazer deploy diretamente do navegador

- ⚒️ [**Hardhat**](https://docs.polkadot.com/develop/smart-contracts/dev-environments/hardhat/) - um ambiente de desenvolvimento Ethereum popular que pode ser usado para desenvolvimento de smart contracts no Polkadot com a ajuda de plugins customizados
- 🤠 [**Foundry**](https://docs.polkadot.com/develop/smart-contracts/dev-environments/foundry/) - uma toolchain de desenvolvimento de smart contracts que gerencia suas dependências, compila seu projeto, executa testes, faz deploy e permite interagir com os contratos.

### 🦀 Contratos em Rust

Além do **Solidity**, você também pode escrever smart contracts em Rust usando **ink!** &mdash; a linguagem padrão para desenvolvimento de smart contracts baseados em Rust no Polkadot. Confira a [**documentação do ink!**](https://use.ink/6.x) (compatível com PolkaVM a partir da v6) para começar.

### 👨‍💻 Bibliotecas de Interação com Contratos

Várias bibliotecas podem ser usadas para interagir com smart contracts implantados no Polkadot, tanto para Solidity quanto para Rust.

**Solidity**

- 🔵 [**Ethers.js**](https://docs.polkadot.com/develop/smart-contracts/libraries/ethers-js/)

- ⚡ [**viem**](https://docs.polkadot.com/develop/smart-contracts/libraries/viem/)

- 🌐 [**Web3.js**](https://docs.polkadot.com/develop/smart-contracts/libraries/web3-js/)

- 🐍 [**Web3.py**](https://docs.polkadot.com/develop/smart-contracts/libraries/web3-py/)

- 🧙 [**Wagmi**](https://docs.polkadot.com/develop/smart-contracts/libraries/wagmi/)

**ink!**

- 🥸 [**PAPI**](https://papi.how/ink)

### 📚 Tutoriais e Guias

Aqui você pode encontrar alguns tutoriais e recursos úteis para ajudá-lo a começar com o desenvolvimento de smart contracts no Polkadot:

- ✍️ [**Criar um Smart Contract**](https://docs.polkadot.com/tutorials/smart-contracts/launch-your-first-project/create-contracts/) - um guia passo a passo para criar seu primeiro smart contract no Polkadot

- ⚙️ [**Testar e Fazer Deploy com Hardhat**](https://docs.polkadot.com/tutorials/smart-contracts/launch-your-first-project/test-and-deploy-with-hardhat/) - um guia para testar e fazer deploy do seu smart contract usando Hardhat

- 🎨 [**Deploy de NFT**](https://docs.polkadot.com/tutorials/smart-contracts/deploy-nft/) - um tutorial sobre como fazer deploy de um smart contract NFT no Polkadot

- 💰 [**Deploy de ERC-20**](https://docs.polkadot.com/tutorials/smart-contracts/deploy-erc20/) - um tutorial sobre como fazer deploy de um smart contract de token ERC-20 no Polkadot

- 🛠️ [**Criar um dApp com Viem**](https://docs.polkadot.com/develop/smart-contracts/libraries/viem/) - um tutorial sobre como criar um dApp simples usando a biblioteca Viem

- 🛠️ [**Criar um dApp com Ethers.js**](https://docs.polkadot.com/develop/smart-contracts/libraries/ethers-js/) - um tutorial sobre como criar um dApp simples usando a biblioteca Ethers.js

- 🎥 [**Deploy de contratos Rust e Solidity**](https://youtu.be/TGgpG1jPxeE) – um workshop demonstrando como fazer deploy e interagir com contratos Solidity e Rust no Polkadot Hub.

### 🔑 Como Conectar ao Polkadot Hub Testnet

Você pode usar qualquer carteira **compatível com Ethereum** para se conectar ao Polkadot Hub Testnet. Siga o guia [Conecte sua Carteira](https://docs.polkadot.com/develop/smart-contracts/connect-to-polkadot/) para conectar usando MetaMask. Também recomendamos usar [Talisman](https://talisman.xyz/), que é feita tanto para Polkadot quanto para Ethereum.

```
Detalhes da testnet:
* Nome da rede: Passet Hub
* Chain ID: 420420421
* URL RPC: https://testnet-passet-hub-eth-rpc.polkadot.io
* URL do Block Explorer: https://blockscout-passet-hub.parity-testnet.parity.io/
```

### 💧 Faucet do Polkadot

Precisa de **tokens da testnet**? Pegue alguns no [**Testnet Faucet**](https://faucet.polkadot.io/?parachain=1111) 💧

> **Nota:** Certifique-se de ter selecionado a chain **Passet Hub** na rede **Paseo**!

### 🏆 Templates Iniciais

Comece rapidamente seu **dApp de smart contract** com estes templates:

- [**create-polkadot-dapp**](https://www.npmjs.com/package/create-polkadot-dapp?activeTab=readme) - uma ferramenta de scaffolding para gerar boilerplates de projeto. Explore o template `react-solidity` localizado na pasta `templates` que vem pré-configurado com **React, Tailwind CSS e Ethers.js** para interação frontend com seus smart contracts

- [**hardhat-polkadot-example**](https://github.com/UtkarshBhardwaj007/hardhat-polkadot-example) - uma demo de como usar Hardhat com Polkadot.

### Vibre codando com AI: helper de configuração de LLM

- Se usando ferramentas de AI como LLMs, lembre-se de direcioná-las para usar a [documentação mais atualizada](https://docs.polkadot.com/).

- Especialmente se você está usando Claude, [este documento](https://www.kusamahub.com/downloads/LLMCONTRACTS.md) contém configurações para usar a testnet para fazer deploy de smart contracts, e recomendamos informar seu LLM para consultá-lo.