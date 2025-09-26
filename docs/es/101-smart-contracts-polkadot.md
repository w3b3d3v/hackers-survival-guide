## 🚀 Desarrollo de Smart Contracts en Polkadot

Polkadot permite el **despliegue de smart contracts** a través de **PolkaVM**. Esto permite usar **herramientas** y **librerías de Ethereum** familiares mientras aprovechas el robusto ecosistema de Polkadot. **PolkaVM** está en funcionamiento en Passet Hub, la testnet de la comunidad de Polkadot. ✅

Por favor, proporciona **feedback** sobre tu experiencia desplegando smart contracts en Polkadot usando este [formulario de feedback](https://forms.gle/BhL5ZCaFMUvSipos8).

_Consulta el documento de [**problemas conocidos**](https://docs.google.com/document/d/1j5hnQZRqlbVagW28dC24OVAF8uRih5jWubBxy5PlMYc/edit?usp=sharing) si tienes problemas desplegando contratos o usando cualquiera de las herramientas a continuación. Si tienes un nuevo bug o problema, por favor crea un issue en el [Contracts Bug tracker](https://github.com/paritytech/contract-issues) en Github._

### 📚 Entornos de Desarrollo Solidity

Hay múltiples entornos de desarrollo ya disponibles para el desarrollo de smart contracts en Polkadot. Aquí tienes algunos de los más populares:

- 🖥️ [**Polkadot Remix IDE**](https://docs.polkadot.com/develop/smart-contracts/dev-environments/remix/) - un IDE basado en web que te permite escribir, probar y desplegar smart contracts directamente en tu navegador. Está integrado con chains compatibles: puedes desplegar directamente desde el navegador

- ⚒️ [**Hardhat**](https://docs.polkadot.com/develop/smart-contracts/dev-environments/hardhat/) - un entorno de desarrollo de Ethereum popular que puede ser usado para el desarrollo de smart contracts en Polkadot con la ayuda de plugins personalizados
- 🤠 [**Foundry**](https://docs.polkadot.com/develop/smart-contracts/dev-environments/foundry/) - un toolchain de desarrollo de smart contracts que maneja tus dependencias, compila tu proyecto, ejecuta tests, despliega, y te permite interactuar con los contratos.

### 🦀 Contratos Rust

Además de **Solidity**, también puedes escribir smart contracts en Rust usando **ink!** &mdash; el lenguaje de referencia para el desarrollo de smart contracts basados en Rust en Polkadot. Consulta la [**documentación de ink!**](https://use.ink/6.x) (compatible con PolkaVM desde la v6) para comenzar.

### 👨‍💻 Librerías de Interacción con Contratos

Varias librerías pueden ser usadas para interactuar con smart contracts desplegados en Polkadot tanto para Solidity como para Rust.

**Solidity**

- 🔵 [**Ethers.js**](https://docs.polkadot.com/develop/smart-contracts/libraries/ethers-js/)

- ⚡ [**viem**](https://docs.polkadot.com/develop/smart-contracts/libraries/viem/)

- 🌐 [**Web3.js**](https://docs.polkadot.com/develop/smart-contracts/libraries/web3-js/)

- 🐍 [**Web3.py**](https://docs.polkadot.com/develop/smart-contracts/libraries/web3-py/)

- 🧙 [**Wagmi**](https://docs.polkadot.com/develop/smart-contracts/libraries/wagmi/)

**ink!**

- 🥸 [**PAPI**](https://papi.how/ink)

### 📚 Tutoriales y Guías

Aquí puedes encontrar algunos tutoriales útiles y recursos para ayudarte a comenzar con el desarrollo de smart contracts en Polkadot:

- ✍️ [**Crear un Smart Contract**](https://docs.polkadot.com/tutorials/smart-contracts/launch-your-first-project/create-contracts/) - una guía paso a paso para crear tu primer smart contract en Polkadot

- ⚙️ [**Probar y Desplegar con Hardhat**](https://docs.polkadot.com/tutorials/smart-contracts/launch-your-first-project/test-and-deploy-with-hardhat/) - una guía para probar y desplegar tu smart contract usando Hardhat

- 🎨 [**Desplegar un NFT**](https://docs.polkadot.com/tutorials/smart-contracts/deploy-nft/) - un tutorial sobre desplegar un smart contract de NFT en Polkadot

- 💰 [**Desplegar un ERC-20**](https://docs.polkadot.com/tutorials/smart-contracts/deploy-erc20/) - un tutorial sobre desplegar un smart contract de token ERC-20 en Polkadot

- 🛠️ [**Crear una dApp con Viem**](https://docs.polkadot.com/develop/smart-contracts/libraries/viem/) - un tutorial sobre crear una dApp simple usando la librería Viem

- 🛠️ [**Crear una dApp con Ethers.js**](https://docs.polkadot.com/develop/smart-contracts/libraries/ethers-js/) - un tutorial sobre crear una dApp simple usando la librería Ethers.js

- 🎥 [**Desplegar contratos Rust y Solidity**](https://youtu.be/TGgpG1jPxeE) – un workshop que muestra cómo desplegar e interactuar con contratos Solidity y Rust en el Polkadot Hub.

### 🔑 Cómo Conectarse a la Testnet de Polkadot Hub

Puedes usar cualquier wallet **compatible con Ethereum** para conectarte a la Testnet de Polkadot Hub. Sigue la guía [Conectar tu Wallet](https://docs.polkadot.com/develop/smart-contracts/connect-to-polkadot/) para conectarte usando MetaMask. También recomendamos usar [Talisman](https://talisman.xyz/), que está construido tanto para Polkadot como para Ethereum.

```
Detalles de la testnet:
* Nombre de la red: Passet Hub
* Chain ID: 420420421
* RPC URL: https://testnet-passet-hub-eth-rpc.polkadot.io
* Block Explorer URL: https://blockscout-passet-hub.parity-testnet.parity.io/
```

### 💧 Faucet de Polkadot

¿Necesitas **tokens de testnet**? Consigue algunos del [**Faucet de Testnet**](https://faucet.polkadot.io/?parachain=1111) 💧

> **Nota:** ¡Asegúrate de haber seleccionado la chain **Passet Hub** en la red **Paseo**!

### 🏆 Plantillas de Inicio

Acelera tu **dApp de smart contracts** con estas plantillas:

- [**create-polkadot-dapp**](https://www.npmjs.com/package/create-polkadot-dapp?activeTab=readme) - una herramienta de scaffolding para generar boilerplates de proyecto. Explora la plantilla `react-solidity` ubicada en la carpeta `templates` que viene preconfigurada con **React, Tailwind CSS, y Ethers.js** para la interacción frontend con tus smart contracts

- [**hardhat-polkadot-example**](https://github.com/UtkarshBhardwaj007/hardhat-polkadot-example) - una demo de cómo usar Hardhat con Polkadot.

### Programa con estilo usando IA: helper de configuración LLM

- Si usas herramientas de IA como LLMs, recuerda dirigirlos a usar la [documentación más actualizada](https://docs.polkadot.com/).

- Especialmente si estás usando Claude, [este documento](https://www.kusamahub.com/downloads/LLMCONTRACTS.md) contiene configuraciones para usar la testnet para desplegar smart contracts, y recomendamos informar a tu LLM que se refiera a él.