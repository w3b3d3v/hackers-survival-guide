# Ferramentas e Recursos de Desenvolvimento Polkadot

_Kit de ferramentas abrangente para construir no ecossistema Polkadot_

## Stack Principal de Desenvolvimento (2025)

| Ferramenta | Tipo | Descrição | Caso de Uso | Link |
|------------|------|-----------|-------------|------|
| **PAPI** | Biblioteca Client | Cliente TypeScript, light client first, fortemente tipado | Frontend & Node dApps | [papi.how](https://papi.how) |
| **Dedot** | Biblioteca Client | Cliente JS leve, tree-shakable com suporte multi-chain | dApps multi-chain enxutos | [dedotdev/dedot](https://github.com/dedotdev/dedot) |
| **ReactiveDOT** | Camada Frontend | Bindings reativos sobre PAPI para fluxos suaves de dados UI | Aplicações React/Vue | [reactivedot.dev](https://reactivedot.dev/) |
| **kitdot** | Ferramenta de Desenvolvimento | Inicialização rápida de projetos com Hardhat + Polkadot | Configuração rápida de projetos | [kitdot](https://www.npmjs.com/package/kitdot) |
| **POP CLI** | Ferramenta de Desenvolvimento | Cria scaffolds de chains e contratos, automatiza redes locais | Scaffolding de projetos & deploy | [onpop.io](https://onpop.io/) |
| **Polkadot Deployment Portal** | Plataforma de Deploy | Deploy guiado de rollup com monitoramento de progresso | Rollups testnet/mainnet | [deploypolkadot.xyz](https://www.deploypolkadot.xyz/) |
| **Paraspell** | XCM SDK | Interface XCM unificada suportando PAPI e polkadot.js | Transferências cross-chain | [paraspell/xcm-tools](https://github.com/paraspell/xcm-tools) |
| **Bagpipes** | Constructor No-Code | Workflows cross-chain drag-and-drop | Demos & operações | [bagpipes.io](https://bagpipes.io/) |
| **Chopsticks** | Ferramenta de Teste | Fork de redes live localmente para teste seguro | Validação pré-mainnet | [AcalaNetwork/chopsticks](https://github.com/AcalaNetwork/chopsticks) |

## Ambientes de Desenvolvimento

| Ferramenta | Tipo | Descrição | Melhor Para | Link |
|------------|------|-----------|-------------|------|
| **Remix IDE** | IDE Browser | Desenvolvimento de smart contracts baseado em web | Prototipagem rápida | [remix.polkadot.io](https://remix.polkadot.io) |
| **Hardhat** | Framework de Desenvolvimento | Ambiente de desenvolvimento local com testes | Projetos complexos | [hardhat.org](https://hardhat.org/) |
| **Foundry** | Toolchain de Desenvolvimento | Desenvolvimento e teste de smart contracts | Desenvolvimento avançado | [getfoundry.sh](https://getfoundry.sh/) |

## Wallets & Conectividade

| Wallet | Tipo | Descrição | Recursos | Link |
|--------|------|-----------|----------|------|
| **Talisman** | Browser/Mobile | Wallet multi-chain para Polkadot & Ethereum | Suporte Substrate + EVM | [talisman.xyz](https://talisman.xyz/) |
| **Nova Wallet** | Mobile | Wallet iOS & Android de próxima geração | Recursos avançados de staking | [novawallet.io](https://novawallet.io/) |
| **SubWallet** | Browser/Mobile | Wallet abrangente do ecossistema Polkadot | Suporte multi-chain | [subwallet.app](https://www.subwallet.app/) |
| **Polkagate** | Extensão Browser | Extensão Polkadot fácil de usar | Interface simples | [polkagate.xyz](https://polkagate.xyz/) |
| **MetaMask** | Extensão Browser | Wallet Ethereum padrão | Compatibilidade EVM | [metamask.io](https://metamask.io/) |
| **Fearless Wallet** | Mobile/Browser | Wallet focada em DeFi | Integrações DeFi | [fearlesswallet.io](https://fearlesswallet.io/) |
| **Polkadot Vault** | Mobile | Armazenamento cold air-gapped | Segurança máxima | [signer.parity.io](https://signer.parity.io/) |

## Bibliotecas Frontend

| Biblioteca | Linguagem | Descrição | Caso de Uso | Link |
|------------|-----------|-----------|-------------|------|
| **Ethers.js** | JavaScript | Biblioteca de interação com contratos | Apps Web3 padrão | [docs.ethers.org](https://docs.ethers.org/) |
| **Web3.js** | JavaScript | Biblioteca de interação Web3 | Apps Web3 legacy | [web3js.org](https://web3js.org/) |
| **Viem** | TypeScript | Biblioteca Web3 moderna | Desenvolvimento type-safe | [viem.sh](https://viem.sh/) |
| **Wagmi** | React | React hooks para Web3 | Aplicações React | [wagmi.sh](https://wagmi.sh/) |
| **Web3.py** | Python | Biblioteca Web3 Python | Backends Python | [web3py.readthedocs.io](https://web3py.readthedocs.io/) |
| **Polkadart** | Dart | Biblioteca Dart para Polkadot | Aplicações Flutter | [leonardocustodio/polkadart](https://github.com/leonardocustodio/polkadart) |

## Desenvolvimento de Smart Contracts

| Ferramenta | Linguagem | Descrição | Caso de Uso | Link |
|------------|-----------|-----------|-------------|------|
| **ink!** | Rust | Linguagem de smart contracts Rust | Contratos Polkadot nativos | [use.ink](https://use.ink/) |
| **Solidity** | Solidity | Contratos compatíveis com Ethereum | Desenvolvimento compatível EVM | [soliditylang.org](https://soliditylang.org/) |
| **OpenZeppelin (Polkadot)** | Solidity | Biblioteca de contratos otimizada por tamanho | Implementações padrão | [papermoonio/openzeppelin-contracts-polkadot](https://github.com/papermoonio/openzeppelin-contracts-polkadot) |
| **PAPI ink! Support** | TypeScript | Interação type-safe com contratos ink! | Integração frontend ink! | [papi.how/ink](https://papi.how/ink) |

## Teste & Simulação

| Ferramenta | Tipo | Descrição | Caso de Uso | Link |
|------------|------|-----------|-------------|------|
| **Chopsticks** | Network Fork | Fork de redes live para teste | Ambiente de teste seguro | [AcalaNetwork/chopsticks](https://github.com/AcalaNetwork/chopsticks) |
| **Zombienet** | Simulador de Rede | Redes de teste efêmeras | Teste multi-node | [paritytech/zombienet](https://github.com/paritytech/zombienet) |
| **Simnode** | Framework de Teste | Teste de simulação para parachains | Teste de parachain | [polytope-labs/sc-simnode](https://github.com/polytope-labs/sc-simnode) |
| **Fudge** | Ferramenta de Database | Interagir com bancos de dados Substrate | Manipulação de database | [centrifuge/fudge](https://github.com/centrifuge/fudge) |

## Monitoramento & Analytics

| Ferramenta | Tipo | Descrição | Caso de Uso | Link |
|------------|------|-----------|-------------|------|
| **Subscan** | Block Explorer | Explorer blockchain abrangente | Monitoramento de transações | [subscan.io](https://subscan.io/) |
| **Statescan** | Block Explorer | Explorer blockchain alternativo | Exploração de blocos | [statescan.io](https://www.statescan.io/) |
| **Polkawatch** | Analytics | Ferramenta de medição de descentralização | Análise de rede | [polkawatch.app](https://polkawatch.app/) |
| **Ocelloids** | Data Streaming | Streams de dados em tempo real para multi-chain | Monitoramento cross-chain | [ocelloids.net](https://www.ocelloids.net/) |
| **XCM Tracker** | Monitor XCM | Rastrear mensagens cross-chain | Debug XCM | [xcm-tracker.ocelloids.net](https://xcm-tracker.ocelloids.net/) |

## Infraestrutura & Deploy

| Ferramenta | Tipo | Descrição | Caso de Uso | Link |
|------------|------|-----------|-------------|------|
| **Polkadot Cloud** | Plataforma Cloud | Infraestrutura Polkadot gerenciada | Deploy de produção | [polkadot.cloud](https://polkadot.cloud/) |
| **Substrate Connect** | Light Client | Light client baseado em browser | Apps descentralizadas | [substrate.io/developers/substrate-connect](https://substrate.io/developers/substrate-connect/) |
| **Smoldot** | Light Client | Implementação alternativa de light client | Aplicações embarcadas | [smol-dot/smoldot](https://github.com/smol-dot/smoldot) |

## Cross-Chain & Interoperabilidade

| Ferramenta | Tipo | Descrição | Caso de Uso | Link |
|------------|------|-----------|-------------|------|
| **XCM Playground** | Ferramenta de Desenvolvimento | Testar funcionalidade XCM | Desenvolvimento XCM | [paraspell/xcm-tools](https://github.com/paraspell/xcm-tools) |
| **Snowbridge** | Bridge | Bridge Ethereum <> Polkadot | Interoperabilidade ETH | [Snowfork/snowbridge](https://github.com/Snowfork/snowbridge) |
| **Bagpipes** | Constructor de Workflow | Constructor de workflow XCM no-code | Operações cross-chain | [xcmsend.com](https://xcmsend.com/) |

## Utilitários & Helpers

| Ferramenta | Tipo | Descrição | Caso de Uso | Link |
|------------|------|-----------|-------------|------|
| **SS58 Transform** | Ferramenta de Endereço | Converter entre formatos de endereço | Conversão de endereços | [polkadot.subscan.io/tools/ss58_transform](https://polkadot.subscan.io/tools/ss58_transform) |
| **Polkadot Faucet** | Ferramenta Testnet | Obter tokens testnet | Teste de desenvolvimento | [faucet.polkadot.io](https://faucet.polkadot.io/) |
| **Sub.ID** | Ferramenta de Identidade | Identidade unificada entre chains | Gestão de identidade | [sub.id](https://sub.id/) |
| **Multix** | Ferramenta Multisig | Gestão simples de multisig | Wallets multi-assinatura | [multix.chainsafe.io](https://multix.chainsafe.io/) |

## Ferramentas da Comunidade

| Ferramenta | Tipo | Descrição | Caso de Uso | Link |
|------------|------|-----------|-------------|------|
| **Polkassembly** | Governança | Plataforma de discussão para propostas | Participação em governança | [polkadot.polkassembly.io](https://polkadot.polkassembly.io/) |
| **Subsquare** | Governança | Discussão e votação de propostas | Governança comunitária | [subsquare.io](https://www.subsquare.io/) |
| **Staking Dashboard** | Ferramenta de Staking | Participar em staking | Staking de tokens | [staking.polkadot.network](https://staking.polkadot.network/) |
| **DotApps** | Portal | Diretório de apps do ecossistema Polkadot | Descoberta de apps | [dotapps.io](https://dotapps.io/) |

## Recursos de Desenvolvimento

| Recurso | Tipo | Descrição | Link |
|---------|------|-----------|------|
| **Polkadot Docs** | Documentação | Documentação oficial de desenvolvimento | [docs.polkadot.com](https://docs.polkadot.com/) |
| **Substrate Docs** | Documentação | Documentação do framework Substrate | [docs.substrate.io](https://docs.substrate.io/) |
| **Polkadot Wiki** | Base de Conhecimento | Guia abrangente do ecossistema | [wiki.polkadot.network](https://wiki.polkadot.network/) |
| **OpenGuild Learning** | Educação | Plataforma de aprendizado Rust e Polkadot | [openguild.wtf/learn](https://openguild.wtf/learn) |
| **DotCodeSchool** | Educação | Tutoriais de desenvolvimento Web3 | [dotcodeschool.com](https://dotcodeschool.com/) |

## Projetos Template

| Template | Tecnologia | Descrição | Link |
|----------|------------|-----------|------|
| **create-polkadot-dapp** | React + Hardhat | Template full-stack dApp | [create-polkadot-dapp](https://www.npmjs.com/package/create-polkadot-dapp) |
| **hardhat-polkadot-example** | Hardhat | Exemplos de smart contracts | [UtkarshBhardwaj007/hardhat-polkadot-example](https://github.com/UtkarshBhardwaj007/hardhat-polkadot-example) |
| **Polkadot Next.js** | Next.js | Template starter frontend | [niklasp/polkadot-nextjs-starter](https://github.com/niklasp/polkadot-nextjs-starter) |
| **Uniswap V2 Port** | Solidity | Exemplo de protocolo DeFi | [papermoonio/uniswap-v2-polkadot](https://github.com/papermoonio/uniswap-v2-polkadot) |

## Stack de Desenvolvimento Recomendado

### Para Iniciantes
- **IDE:** Remix IDE (baseado em browser)
- **Wallet:** Talisman ou MetaMask
- **Teste:** Ferramentas integradas do Remix
- **Recursos:** Tutoriais oficiais e documentação

### Para Desenvolvedores Experientes
- **Framework:** Hardhat + @parity/hardhat-polkadot
- **Biblioteca Client:** PAPI ou Dedot
- **Frontend:** ReactiveDOT para React/Vue
- **Teste:** Chopsticks para fork de rede
- **Deploy:** POP CLI → Polkadot Deployment Portal
- **Cross-chain:** Paraspell XCM SDK

### Para Aplicações de Produção
- **Infraestrutura:** Polkadot Cloud
- **Monitoramento:** Subscan + analytics customizados
- **Segurança:** Wallets multi-assinatura
- **Cross-chain:** Bridges testadas em batalha (Snowbridge)
- **Experiência do Usuário:** Integração light client