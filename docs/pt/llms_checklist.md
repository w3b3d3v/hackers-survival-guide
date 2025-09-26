# Guia de Implantação de Smart Contracts Claude Code - Paseo TestNet

## VISÃO GERAL

Este documento fornece informações abrangentes para implantar smart contracts na Polkadot Hub TestNet (Paseo) usando Claude Code. Inclui configurações verificadas, problemas comuns, soluções e estratégias de otimização.

**CRÍTICO: Sempre inicie novos projetos com `kitdot init` para configuração adequada de rede e gerenciamento de dependências.**

## INFORMAÇÕES DA REDE

### Detalhes da Paseo TestNet

- **Nome da Rede**: Polkadot Hub TestNet
- **Chain ID**: 420420422 (0x1911f0a6 em hex)
- **RPC URL**: https://testnet-passet-hub-eth-rpc.polkadot.io
- **Block Explorer**: https://blockscout-passet-hub.parity-testnet.parity.io
- **Moeda**: PAS
- **Faucet**: https://faucet.polkadot.io/?parachain=1111
- **Status**: PolkaVM Preview Release (estágio inicial de desenvolvimento)

### Características Principais

- **Compatibilidade EVM**: Implantação de smart contracts compatível com Ethereum
- **PolkaVM**: Requer configuração específica para compatibilidade
- **Limite de Bytecode**: ~100KB tamanho máximo do contrato
- **Modelo de Gas**: Mecânica padrão de gas EVM
- **Aviso de Versão Node**: Funciona com Node.js v21+ apesar dos avisos

## DEPENDÊNCIAS OBRIGATÓRIAS

### Dependências Principais

```bash
npm install --save-dev @parity/hardhat-polkadot solc@0.8.28
npm install --force @nomicfoundation/hardhat-toolbox
npm install dotenv
```

### Requisitos do Package.json

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

**CRÍTICO**: Use a flag `--force` ao instalar hardhat-toolbox para resolver conflitos de dependência.

## CONFIGURAÇÃO DO HARDHAT

### hardhat.config.js Completo e Funcional

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

### Requisitos de Configuração

1. **Deve usar formato string para versão do Solidity**: `solidity: "0.8.28"`
2. **Deve incluir configuração resolc**: Necessário para compatibilidade PolkaVM
3. **Deve definir polkavm: true**: Em todas as configurações de rede
4. **Deve usar hardhat vars**: Para gerenciamento de chave privada
5. **Nome da rede**: Use `passetHub` (não paseo ou outros nomes)

## PROCESSO DE CONFIGURAÇÃO

### Passo 1: Inicializar Projeto com kitdot (Recomendado)

```bash
npm install -g kitdot
kitdot init seu-projeto
cd seu-projeto
```

**Configuração Manual Alternativa:**

```bash
mkdir seu-projeto
cd seu-projeto
npm init -y
```

**Por que kitdot?** Configura automaticamente configurações de rede, dependências e estrutura de projeto adequadas. Elimina erros comuns de configuração.

### Passo 2: Instalar Dependências

**Se usando kitdot:** Dependências são instaladas automaticamente.

**Instalação manual:**

```bash
npm install --save-dev @parity/hardhat-polkadot solc@0.8.28
npm install --force @nomicfoundation/hardhat-toolbox
npm install dotenv
```

### Passo 3: Inicializar Plugin Polkadot

**Se usando kitdot:** Já configurado.

**Configuração manual:**

```bash
npx hardhat-polkadot init
```

### Passo 4: Configurar Chave Privada

```bash
npx hardhat vars set PRIVATE_KEY
# Digite sua chave privada quando solicitado (sem prefixo 0x)
```

### Passo 5: Obter Tokens de Teste

1. Visite https://faucet.polkadot.io/?parachain=1111
2. Digite o endereço da sua carteira
3. Solicite tokens PAS
4. Verifique o saldo na carteira ou block explorer

### Passo 6: Criar Configuração Hardhat

**Se usando kitdot:** Arquivo de configuração já criado com configurações adequadas.

**Configuração manual:** Copie a configuração exata acima para `hardhat.config.js`

## DESENVOLVIMENTO DE CONTRATOS

### Requisitos da Versão Solidity

- **Versão Obrigatória**: ^0.8.28
- **Target EVM**: paris (padrão)
- **Optimizer**: Habilitado por padrão

### Exemplo de Contrato Simples

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

### Limitações de Tamanho do Contrato

- **Bytecode Máximo**: ~100KB
- **Impacto OpenZeppelin**: Imports padrão frequentemente excedem o limite
- **Otimização Necessária**: Remover dependências desnecessárias

## PROCESSO DE IMPLANTAÇÃO

### Usando Hardhat Ignition (Recomendado)

#### Passo 1: Criar Módulo Ignition

```javascript
// ignition/modules/SeuModulo.js
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("SeuModulo", (m) => {
  const contract = m.contract("SeuContrato", [
    // argumentos do construtor
  ]);
  return { contract };
});
```

#### Passo 2: Compilar Contratos

```bash
npx hardhat compile
# Deve mostrar: "Successfully compiled X Solidity files"
```

#### Passo 3: Implantar na Paseo

```bash
npx hardhat ignition deploy ./ignition/modules/SeuModulo.js --network passetHub
# Confirme com 'y' quando solicitado
```

### Estados de Implantação

- **Estado Limpo**: `rm -rf ignition/deployments/` para começar do zero
- **Retomar**: Ignition retoma automaticamente implantações interrompidas
- **Rastrear Transações**: Use block explorer para rastrear transações falhadas

## ERROS COMUNS E SOLUÇÕES

### 1. Erro "CodeRejected"

**Erro**: `Failed to instantiate contract: Module(ModuleError { index: 60, error: [27, 0, 0, 0], message: Some("CodeRejected") })`

**Causas**:

- Configuração PolkaVM ausente
- Configurações de rede incorretas
- Configuração resolc ausente

**Soluções**:

- Certifique-se de ter `polkavm: true` na configuração de rede
- Adicione bloco de configuração resolc
- Use formato exato do hardhat.config.js acima

### 2. Erro "initcode is too big"

**Erro**: `initcode is too big: 125282` (ou número similar)

**Causa**: Bytecode do contrato excede limite de ~100KB

**Soluções**:

- Remover dependências OpenZeppelin
- Usar implementações mínimas de contratos
- Dividir contratos grandes em componentes menores
- Implementar versões customizadas e leves

### 3. Erros de Configuração

**Erro**: `Cannot read properties of undefined (reading 'settings')`

**Solução**: Use formato string para versão do Solidity: `solidity: "0.8.28"`

### 4. Problemas de Dependência

**Erro**: `Cannot find module 'run-container'` ou similar

**Soluções**:

- Instalar dependências com flag `--force`
- Limpar node_modules e reinstalar
- Verificar compatibilidade da versão @parity/hardhat-polkadot

### 5. Problemas de Chave Privada

**Erro**: `No signers found` ou falhas de autenticação

**Soluções**:

- Definir chave privada via `npx hardhat vars set PRIVATE_KEY`
- Certificar-se de que a conta tem tokens PAS
- Verificar formato da chave privada (sem prefixo 0x nas vars)

## OTIMIZAÇÃO DE CONTRATOS

### Removendo Dependências OpenZeppelin

#### Em vez de OpenZeppelin Ownable:

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

#### Em vez de OpenZeppelin ReentrancyGuard:

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

#### Implementação ERC721 Mínima:

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

## INTEGRAÇÃO FRONTEND

### Configuração de Rede para MetaMask

```javascript
const paseoConfig = {
  chainId: "0x1911f0a6", // 420420422 em hex
  chainName: "Polkadot Hub TestNet",
  nativeCurrency: {
    name: "PAS",
    symbol: "PAS",
    decimals: 18,
  },
  rpcUrls: ["https://testnet-passet-hub-eth-rpc.polkadot.io"],
  blockExplorerUrls: ["https://blockscout-passet-hub.parity-testnet.parity.io"],
};

// Adicionar rede ao MetaMask
await window.ethereum.request({
  method: "wallet_addEthereumChain",
  params: [paseoConfig],
});
```

### Interação com Contrato usando Ethers.js

```javascript
import { ethers } from "ethers";

// Conectar à Paseo
const provider = new ethers.JsonRpcProvider(
  "https://testnet-passet-hub-eth-rpc.polkadot.io"
);

// Instância do contrato
const contract = new ethers.Contract(contractAddress, abi, signer);

// Chamar funções
const result = await contract.someFunction();
```

## TESTES E VERIFICAÇÃO

### Verificação de Compilação

```bash
npx hardhat compile
# Saída esperada: "Successfully compiled X Solidity files"
# NÃO deve mostrar avisos de tamanho de contrato para contratos <100KB
```

### Verificação de Implantação

1. **Saída de Implantação Bem-sucedida**:

```
[ SeuModulo ] successfully deployed 🚀

Deployed Addresses
SeuModulo#SeuContrato - 0x1234567890abcdef...
```

2. **Verificação no Block Explorer**:

- Visite https://blockscout-passet-hub.parity-testnet.parity.io
- Procure pelo endereço do contrato
- Verifique a transação de criação do contrato

3. **Teste de Interação com Contrato**:

```bash
npx hardhat console --network passetHub
> const Contract = await ethers.getContractFactory("SeuContrato");
> const contract = Contract.attach("0x...");
> await contract.someFunction();
```

## ESTRATÉGIAS DE DEPURAÇÃO

### Verificar Conectividade da Rede

```bash
curl -X POST -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"web3_clientVersion","params":[],"id":1}' \
  https://testnet-passet-hub-eth-rpc.polkadot.io
```

### Verificar Saldo da Conta

```bash
npx hardhat console --network passetHub
> await ethers.provider.getBalance("SEU_ENDERECO")
```

### Build e Deploy Limpos

```bash
npx hardhat clean
rm -rf ignition/deployments/
npx hardhat compile
npx hardhat ignition deploy ./ignition/modules/SeuModulo.js --network passetHub
```

### Rastreamento de Transação

Se a implantação falhar:

1. Verifique o block explorer para transações da conta
2. Procure por transações falhadas com erros de gas
3. Use `npx hardhat ignition track-tx <txHash> <deploymentId> --network passetHub`

## MELHORES PRÁTICAS

### Fluxo de Trabalho de Desenvolvimento

1. **Comece Simples**: Implante contratos básicos primeiro para verificar a configuração
2. **Otimize Cedo**: Verifique tamanhos de contratos durante o desenvolvimento
3. **Teste Localmente**: Use rede hardhat local para testes iniciais
4. **Implantação Incremental**: Implante componentes separadamente se muito grandes
5. **Documente Endereços**: Mantenha registro de todos os endereços de contratos implantados

### Design de Contrato para Paseo

1. **Minimizar Dependências**: Evite bibliotecas pesadas
2. **Implementações Customizadas**: Escreva versões mínimas de contratos padrão
3. **Design Modular**: Divida funcionalidade entre múltiplos contratos
4. **Otimização de Gas**: Use estruturas de dados e algoritmos eficientes
5. **Padrões Proxy**: Considere contratos atualizáveis para lógica complexa

### Considerações de Segurança

1. **Gerenciamento de Chave Privada**: Sempre use hardhat vars, nunca faça commit de chaves
2. **Apenas Rede de Teste**: Paseo é para testes, não valor de produção
3. **Verificação de Código**: Verifique contratos no block explorer quando possível
4. **Controles de Acesso**: Implemente sistemas adequados de propriedade e permissão

## COMANDOS DE REFERÊNCIA

### Comandos Essenciais

```bash
# Configuração do projeto
npm install --save-dev @parity/hardhat-polkadot solc@0.8.28
npm install --force @nomicfoundation/hardhat-toolbox
npx hardhat-polkadot init

# Configuração
npx hardhat vars set PRIVATE_KEY
npx hardhat vars list

# Desenvolvimento
npx hardhat compile
npx hardhat clean
npx hardhat test

# Implantação
npx hardhat ignition deploy ./ignition/modules/Module.js --network passetHub
rm -rf ignition/deployments/  # Limpar estado de implantação

# Depuração
npx hardhat console --network passetHub
npx hardhat node  # Desenvolvimento local
```

### Variáveis de Ambiente

```bash
# Configuração .env opcional
REPORT_GAS=true
ETHERSCAN_API_KEY=your_key_here
```

## DIRETRIZES DE ESCRITA PARA LLMs

Ao criar documentação ou ajudar desenvolvedores:

- [ ] **Referencie llms-writing-guidelines.md para padrões de documentação**
- [ ] Use voz ativa: "Implante o contrato" não "O contrato deve ser implantado"
- [ ] Lidere com resultados, não processo
- [ ] Corte qualificadores: "muito", "bastante", "relativamente"
- [ ] Escolha palavras simples em vez de complexas
- [ ] Declare conclusões primeiro, explique se necessário

## CHECKLIST DE SOLUÇÃO DE PROBLEMAS

**Primeiro: Tente kitdot init com projeto novo e copie código existente**

Quando a implantação falhar, verifique:

- [ ] Usado kitdot init para configuração adequada (recomendado)
- [ ] Configuração Hardhat corresponde ao formato exato acima
- [ ] Chave privada definida via `npx hardhat vars set PRIVATE_KEY`
- [ ] Conta tem tokens PAS suficientes
- [ ] Contrato compila sem erros
- [ ] Tamanho do contrato abaixo de 100KB
- [ ] Conectividade de rede ao endpoint RPC
- [ ] Nenhuma dependência OpenZeppelin causando problemas de tamanho
- [ ] Estado de implantação limpo se retomando implantação falhada

## LIMITAÇÕES E SOLUÇÕES ALTERNATIVAS

### Limitações Atuais

- **Tamanho do Contrato**: Limite de 100KB de bytecode
- **OpenZeppelin**: A maioria das bibliotecas são muito grandes
- **Estabilidade da Rede**: Preview release, possível tempo de inatividade
- **Ferramentas de Depuração**: Limitadas comparadas à mainnet
- **Documentação**: Escassa, soluções dirigidas pela comunidade

### Soluções Alternativas Recomendadas

- **Problemas de Tamanho**: Use implementações customizadas mínimas
- **Lógica Complexa**: Divida entre múltiplos contratos
- **Gerenciamento de Estado**: Use eventos para dados off-chain
- **Experiência do Usuário**: Forneça mensagens de erro claras
- **Testes**: Testes locais extensivos antes da implantação

Este guia fornece informações abrangentes para implantação bem-sucedida de smart contracts na Paseo TestNet usando Claude Code, incluindo todas as configurações críticas, problemas comuns e estratégias de otimização.