# Herramientas y Recursos de Desarrollo para Polkadot

_Kit de herramientas completo para construir en el ecosistema Polkadot_

## Stack de Desarrollo Principal (2025)

| Herramienta | Tipo | Descripción | Caso de Uso | Enlace |
|-------------|------|-------------|-------------|---------|
| **PAPI** | Librería Cliente | Cliente TypeScript, light client first, fuertemente tipado | dApps Frontend & Node | [papi.how](https://papi.how) |
| **Dedot** | Librería Cliente | Cliente JS ligero, tree-shakable con soporte multi-cadena | dApps multi-cadena eficientes | [dedotdev/dedot](https://github.com/dedotdev/dedot) |
| **ReactiveDOT** | Capa Frontend | Bindings reactivos sobre PAPI para flujos de datos UI fluidos | Aplicaciones React/Vue | [reactivedot.dev](https://reactivedot.dev/) |
| **POP CLI** | Herramienta de Desarrollo | Scaffold para cadenas y contratos, automatiza redes locales | Scaffolding y deployment de proyectos | [onpop.io](https://onpop.io/) |
| **Polkadot Deployment Portal** | Plataforma de Deployment | Deployment guiado de rollups con monitoreo de progreso | Rollups testnet/mainnet | [deploypolkadot.xyz](https://www.deploypolkadot.xyz/) |
| **Paraspell** | XCM SDK | Interfaz XCM unificada compatible con PAPI y polkadot.js | Transferencias cross-chain | [paraspell/xcm-tools](https://github.com/paraspell/xcm-tools) |
| **Bagpipes** | Constructor No-Code | Workflows cross-chain drag-and-drop | Demos y operaciones | [bagpipes.io](https://bagpipes.io/) |
| **Chopsticks** | Herramienta de Testing | Fork de redes en vivo localmente para testing seguro | Validación pre-mainnet | [AcalaNetwork/chopsticks](https://github.com/AcalaNetwork/chopsticks) |

## Entornos de Desarrollo

| Herramienta | Tipo | Descripción | Mejor Para | Enlace |
|-------------|------|-------------|------------|---------|
| **Remix IDE** | IDE Browser | Desarrollo de smart contracts basado en web | Prototipado rápido | [remix.polkadot.io](https://remix.polkadot.io) |
| **Hardhat** | Framework de Desarrollo | Entorno de desarrollo local con testing | Proyectos complejos | [hardhat.org](https://hardhat.org/) |
| **Foundry** | Toolchain de Desarrollo | Desarrollo y testing de smart contracts | Desarrollo avanzado | [getfoundry.sh](https://getfoundry.sh/) |

## Wallets y Conectividad

| Wallet | Tipo | Descripción | Características | Enlace |
|--------|------|-------------|-----------------|---------|
| **Talisman** | Browser/Mobile | Wallet multi-cadena para Polkadot y Ethereum | Soporte Substrate + EVM | [talisman.xyz](https://talisman.xyz/) |
| **Nova Wallet** | Mobile | Wallet de próxima generación iOS y Android | Funciones avanzadas de staking | [novawallet.io](https://novawallet.io/) |
| **SubWallet** | Browser/Mobile | Wallet integral del ecosistema Polkadot | Soporte multi-cadena | [subwallet.app](https://www.subwallet.app/) |
| **Polkagate** | Extensión Browser | Extensión Polkadot fácil de usar | Interfaz simple | [polkagate.xyz](https://polkagate.xyz/) |
| **MetaMask** | Extensión Browser | Wallet estándar de Ethereum | Compatibilidad EVM | [metamask.io](https://metamask.io/) |
| **Fearless Wallet** | Mobile/Browser | Wallet enfocado en DeFi | Integraciones DeFi | [fearlesswallet.io](https://fearlesswallet.io/) |
| **Polkadot Vault** | Mobile | Almacenamiento frío air-gapped | Máxima seguridad | [signer.parity.io](https://signer.parity.io/) |

## Librerías Frontend

| Librería | Lenguaje | Descripción | Caso de Uso | Enlace |
|----------|----------|-------------|-------------|---------|
| **Ethers.js** | JavaScript | Librería de interacción con contratos | Apps Web3 estándar | [docs.ethers.org](https://docs.ethers.org/) |
| **Web3.js** | JavaScript | Librería de interacción Web3 | Apps Web3 legacy | [web3js.org](https://web3js.org/) |
| **Viem** | TypeScript | Librería Web3 moderna | Desarrollo type-safe | [viem.sh](https://viem.sh/) |
| **Wagmi** | React | React hooks para Web3 | Aplicaciones React | [wagmi.sh](https://wagmi.sh/) |
| **Web3.py** | Python | Librería Web3 de Python | Backends Python | [web3py.readthedocs.io](https://web3py.readthedocs.io/) |
| **Polkadart** | Dart | Librería Dart para Polkadot | Aplicaciones Flutter | [leonardocustodio/polkadart](https://github.com/leonardocustodio/polkadart) |

## Desarrollo de Smart Contracts

| Herramienta | Lenguaje | Descripción | Caso de Uso | Enlace |
|-------------|----------|-------------|-------------|---------|
| **ink!** | Rust | Lenguaje de smart contracts Rust | Contratos nativos Polkadot | [use.ink](https://use.ink/) |
| **Solidity** | Solidity | Contratos compatibles con Ethereum | Desarrollo compatible con EVM | [soliditylang.org](https://soliditylang.org/) |
| **OpenZeppelin (Polkadot)** | Solidity | Librería de contratos optimizada en tamaño | Implementaciones estándar | [papermoonio/openzeppelin-contracts-polkadot](https://github.com/papermoonio/openzeppelin-contracts-polkadot) |
| **PAPI ink! Support** | TypeScript | Interacción type-safe con contratos ink! | Integración frontend ink! | [papi.how/ink](https://papi.how/ink) |

## Testing y Simulación

| Herramienta | Tipo | Descripción | Caso de Uso | Enlace |
|-------------|------|-------------|-------------|---------|
| **Chopsticks** | Fork de Red | Fork de redes en vivo para testing | Entorno de testing seguro | [AcalaNetwork/chopsticks](https://github.com/AcalaNetwork/chopsticks) |
| **Zombienet** | Simulador de Red | Redes de test efímeras | Testing multi-nodo | [paritytech/zombienet](https://github.com/paritytech/zombienet) |
| **Simnode** | Framework de Testing | Testing de simulación para parachains | Testing de parachains | [polytope-labs/sc-simnode](https://github.com/polytope-labs/sc-simnode) |
| **Fudge** | Herramienta de Base de Datos | Interactuar con bases de datos Substrate | Manipulación de base de datos | [centrifuge/fudge](https://github.com/centrifuge/fudge) |

## Monitoreo y Analytics

| Herramienta | Tipo | Descripción | Caso de Uso | Enlace |
|-------------|------|-------------|-------------|---------|
| **Subscan** | Explorador de Bloques | Explorador de blockchain integral | Monitoreo de transacciones | [subscan.io](https://subscan.io/) |
| **Statescan** | Explorador de Bloques | Explorador de blockchain alternativo | Exploración de bloques | [statescan.io](https://www.statescan.io/) |
| **Polkawatch** | Analytics | Herramienta de medición de descentralización | Análisis de red | [polkawatch.app](https://polkawatch.app/) |
| **Ocelloids** | Data Streaming | Streams de datos en tiempo real multi-cadena | Monitoreo cross-chain | [ocelloids.net](https://www.ocelloids.net/) |
| **XCM Tracker** | Monitor XCM | Rastrear mensajes cross-chain | Debugging XCM | [xcm-tracker.ocelloids.net](https://xcm-tracker.ocelloids.net/) |

## Infraestructura y Deployment

| Herramienta | Tipo | Descripción | Caso de Uso | Enlace |
|-------------|------|-------------|-------------|---------|
| **Polkadot Cloud** | Plataforma Cloud | Infraestructura Polkadot gestionada | Deployment de producción | [polkadot.cloud](https://polkadot.cloud/) |
| **Substrate Connect** | Light Client | Light client basado en browser | Apps descentralizadas | [substrate.io/developers/substrate-connect](https://substrate.io/developers/substrate-connect/) |
| **Smoldot** | Light Client | Implementación alternativa de light client | Aplicaciones embebidas | [smol-dot/smoldot](https://github.com/smol-dot/smoldot) |

## Cross-Chain e Interoperabilidad

| Herramienta | Tipo | Descripción | Caso de Uso | Enlace |
|-------------|------|-------------|-------------|---------|
| **XCM Playground** | Herramienta de Desarrollo | Probar funcionalidad XCM | Desarrollo XCM | [paraspell/xcm-tools](https://github.com/paraspell/xcm-tools) |
| **Snowbridge** | Bridge | Bridge Ethereum <> Polkadot | Interoperabilidad ETH | [Snowfork/snowbridge](https://github.com/Snowfork/snowbridge) |
| **Bagpipes** | Constructor de Workflows | Constructor de workflows XCM no-code | Operaciones cross-chain | [xcmsend.com](https://xcmsend.com/) |

## Utilidades y Helpers

| Herramienta | Tipo | Descripción | Caso de Uso | Enlace |
|-------------|------|-------------|-------------|---------|
| **SS58 Transform** | Herramienta de Direcciones | Convertir entre formatos de direcciones | Conversión de direcciones | [polkadot.subscan.io/tools/ss58_transform](https://polkadot.subscan.io/tools/ss58_transform) |
| **Polkadot Faucet** | Herramienta Testnet | Obtener tokens de testnet | Testing de desarrollo | [faucet.polkadot.io](https://faucet.polkadot.io/) |
| **Sub.ID** | Herramienta de Identidad | Identidad unificada entre cadenas | Gestión de identidad | [sub.id](https://sub.id/) |
| **Multix** | Herramienta Multisig | Gestión simple de multisig | Wallets multi-firma | [multix.chainsafe.io](https://multix.chainsafe.io/) |

## Herramientas de Comunidad

| Herramienta | Tipo | Descripción | Caso de Uso | Enlace |
|-------------|------|-------------|-------------|---------|
| **Polkassembly** | Gobernanza | Plataforma de discusión para propuestas | Participación en gobernanza | [polkadot.polkassembly.io](https://polkadot.polkassembly.io/) |
| **Subsquare** | Gobernanza | Discusión y votación de propuestas | Gobernanza comunitaria | [subsquare.io](https://www.subsquare.io/) |
| **Staking Dashboard** | Herramienta de Staking | Participar en staking | Staking de tokens | [staking.polkadot.network](https://staking.polkadot.network/) |
| **DotApps** | Portal | Directorio de apps del ecosistema Polkadot | Descubrimiento de apps | [dotapps.io](https://dotapps.io/) |

## Recursos de Desarrollo

| Recurso | Tipo | Descripción | Enlace |
|---------|------|-------------|---------|
| **Polkadot Docs** | Documentación | Documentación oficial de desarrollo | [docs.polkadot.com](https://docs.polkadot.com/) |
| **Substrate Docs** | Documentación | Documentación del framework Substrate | [docs.substrate.io](https://docs.substrate.io/) |
| **Polkadot Wiki** | Base de Conocimiento | Guía integral del ecosistema | [wiki.polkadot.network](https://wiki.polkadot.network/) |
| **OpenGuild Learning** | Educación | Plataforma de aprendizaje Rust y Polkadot | [openguild.wtf/learn](https://openguild.wtf/learn) |
| **DotCodeSchool** | Educación | Tutoriales de desarrollo Web3 | [dotcodeschool.com](https://dotcodeschool.com/) |

## Proyectos Template

| Template | Tecnología | Descripción | Enlace |
|----------|------------|-------------|---------|
| **create-polkadot-dapp** | React + Hardhat | Template dApp full-stack | [create-polkadot-dapp](https://www.npmjs.com/package/create-polkadot-dapp) |
| **hardhat-polkadot-example** | Hardhat | Ejemplos de smart contracts | [UtkarshBhardwaj007/hardhat-polkadot-example](https://github.com/UtkarshBhardwaj007/hardhat-polkadot-example) |
| **Polkadot Next.js** | Next.js | Template starter frontend | [niklasp/polkadot-nextjs-starter](https://github.com/niklasp/polkadot-nextjs-starter) |
| **Uniswap V2 Port** | Solidity | Ejemplo de protocolo DeFi | [papermoonio/uniswap-v2-polkadot](https://github.com/papermoonio/uniswap-v2-polkadot) |

## Stack de Desarrollo Recomendado

### Para Principiantes
- **IDE:** Remix IDE (basado en browser)
- **Wallet:** Talisman o MetaMask
- **Testing:** Herramientas integradas de Remix
- **Recursos:** Tutoriales oficiales y documentación

### Para Desarrolladores Experimentados
- **Framework:** Hardhat + @parity/hardhat-polkadot
- **Librería Cliente:** PAPI o Dedot
- **Frontend:** ReactiveDOT para React/Vue
- **Testing:** Chopsticks para fork de redes
- **Deployment:** POP CLI → Polkadot Deployment Portal
- **Cross-chain:** Paraspell XCM SDK

### Para Aplicaciones de Producción
- **Infraestructura:** Polkadot Cloud
- **Monitoreo:** Subscan + analytics personalizados
- **Seguridad:** Wallets multi-firma
- **Cross-chain:** Bridges probados en batalla (Snowbridge)
- **Experiencia de Usuario:** Integración de light client