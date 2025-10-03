# Guía de Desarrollo para Hackathons de Polkadot

_Para Desarrolladores Nuevos en Web3_

## Descripción General de la Documentación

- **[Herramientas de Desarrollo de Polkadot](polkadot-development-tools.md)** - Conjunto completo de herramientas y mapa de recursos para construir en Polkadot
- **[Smart Contracts 101](101-smart-contracts-polkadot.md)** - Guía completa para principiantes sobre smart contracts de Polkadot
- **[Writing Guidelines](writing-guidelines.md)** - Estándares de escritura y mejores prácticas para agentes de IA
- **[Agents](Agents.md)** - Guía completa de despliegue y referencia de solución de problemas para agentes

## 1. Inicio Rápido con Kitdot

### Para Quién Es Esta Guía

Desarrolladores con sólidas habilidades de programación pero sin experiencia en Web3/Polkadot.

### Objetivo Principal

Desplegar smart contracts funcionales en la testnet de Polkadot y construir un frontend funcional dentro de los tiempos de un hackathon.

### Inicia Tu Proyecto con Kitdot

**Recomendado**: Usa kitdot@latest para una configuración adecuada de red y configuración de proyecto:

```bash
npx kitdot@latest install -y
```

o

```bash
npm install -g kitdot@latest
kitdot init my-polkadot-project
cd my-polkadot-project
```

**¿Por qué kitdot?** Asegura configuraciones de red adecuadas, dependencias correctas y configuraciones probadas en batalla. Evita dolores de cabeza de configuración y comienza a construir inmediatamente.

**Experiencia Web2 en Web3:** La configuración predeterminada de kitdot inicializa un proyecto frontend completo que proporciona una experiencia de usuario Web2 familiar para aplicaciones Web3. Los usuarios interactúan con tu dApp sin necesidad de entender la complejidad de blockchain.

**¿Proyecto Existente?** Comienza desde cero con kitdot@latest y copia tus archivos. Esto previene conflictos de configuración y problemas de conexión de red.

## 2. Librerías de Contratos Pre-construidos

### Aprovecha el Código Existente

Antes de construir desde cero, explora estas librerías de contratos probadas en batalla:

**Contratos de Thirdweb**

- **Repositorio:** [thirdweb-dev/contracts](https://github.com/thirdweb-dev/contracts/tree/main/contracts)
- **Mejor para:** NFTs, tokens, marketplaces, governance
- **Ventaja:** Implementaciones listas para producción, optimizadas en gas
- **Nota:** Puede necesitar optimización de tamaño para el límite de 100KB de Polkadot

**Contratos de OpenZeppelin Optimizados para Polkadot**

- **Repositorio:** [papermoonio/openzeppelin-contracts-polkadot](https://github.com/papermoonio/openzeppelin-contracts-polkadot)
- **Mejor para:** Implementaciones estándar (ERC20, ERC721, ERC1155)

### Estrategia

1. **Navega** contratos existentes para inspiración
2. **Copia** patrones de lógica principal
3. **Simplifica** removiendo características innecesarias
4. **Prueba** el tamaño del contrato con `npx hardhat compile`

## 3. Configuración del Entorno de Desarrollo

### Elige Tu Ruta

![Diagrama de Flujo de Desarrollo](../flowchart.png)

| Factor                | Remix IDE        | Hardhat            |
| --------------------- | ---------------- | ------------------ |
| **Tiempo de Setup**   | Rápido           | Moderado           |
| **Experiencia Requerida** | Ninguna      | JavaScript/Node.js |
| **Mejor Para**        | Contratos simples | dApps complejas   |

### Ruta 1: Remix IDE

1. Abre [Polkadot Remix IDE](https://remix.polkadot.io)
2. Obtén tokens de testnet del [faucet](https://faucet.polkadot.io/?parachain=1111)
3. Comienza a codificar en el navegador

**Obteniendo ABI para Proyectos Frontend:**
Después de compilar contratos en Remix:

1. Ve a la pestaña **Solidity Compiler**
2. Haz clic en el nombre de tu contrato bajo artefactos de compilación
3. Copia el array **ABI** de los detalles de compilación
4. Úsalo en proyectos frontend:

```javascript
// Guarda ABI como contractABI.json o importa directamente
import { ethers } from "ethers";

const contractABI = [
  /* pega el array ABI aquí */
];
const contract = new ethers.Contract(contractAddress, contractABI, signer);
```

### Ruta 2: Configuración Manual de Hardhat (No Recomendado)

**Usa kitdot@latest en su lugar** para configuración automatizada, pero si debes configurar manualmente:

```bash
# Mejor: Usa kitdot@latest init en su lugar
mkdir hackathon-project && cd hackathon-project
npm init -y
npm install --save-dev @parity/hardhat-polkadot solc@0.8.28
npm install --force @nomicfoundation/hardhat-toolbox
npx hardhat-polkadot init
```

**IMPORTANTE:** Siempre usa `@parity/hardhat-polkadot` en lugar de hardhat estándar. Este plugin proporciona compatibilidad esencial con PolkaVM y configuraciones de red requeridas para el despliegue en Polkadot.

**kitdot@latest maneja esto automáticamente** con configuraciones de red apropiadas.

### Ruta 3: Red de Desarrollo Local

Para pruebas locales sin conectarse a testnets:

```bash
# Ejecuta testnet genérica local (NO es una testnet PolkaVM)
npx hardhat node

# En otra terminal, despliega a la red local
npx hardhat ignition deploy ./ignition/modules/YourModule.js --network localhost
```

**Nota:** Esto ejecuta una testnet Ethereum estándar local, no una red compatible con PolkaVM. Úsala para desarrollo inicial y pruebas antes de desplegar en Paseo.

**Crear hardhat.config.js:**

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

**Configurar Wallet:**

```bash
npx hardhat vars set PRIVATE_KEY
# Ingresa tu clave privada (sin prefijo 0x)
```

**Probar Configuración:**

```bash
npx hardhat compile
npx hardhat ignition deploy ./ignition/modules/Test.js --network passetHub
```

## 4. Desarrollo de Smart Contracts

### Restricciones Críticas

- **Bytecode máximo:** ~100KB
- **Versión de Solidity:** ^0.8.28

### Contrato de Prueba

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Test {
    uint256 public value = 42;
    function setValue(uint256 _value) external { value = _value; }
}
```

### ERC20 Mínimo

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

### Estrategia de Despliegue

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

## 5. Configuración de Wallet (Si no usas el template por defecto de kitdot)

### Habilitar Testnets en tu Wallet

**MetaMask:**

1. Abre la extensión MetaMask
2. Haz clic en el ícono de tu perfil (arriba a la derecha)
3. Ve a **Settings** → **Advanced**
4. Habilita **Show test networks**
5. Tu dropdown de red ahora mostrará opciones de testnet

**Talisman:**

1. Abre la extensión Talisman
2. Ve a **Settings** → **Networks & Tokens**
3. Habilita **Show test networks**
4. Las redes de testnet aparecerán en tu lista de redes

### Agregar Red Paseo a MetaMask

**Método Rápido (Recomendado):**

1. Visita [https://chainlist.org/?search=passet](https://chainlist.org/?search=passet)
2. Encuentra "Polkadot Asset Hub Testnet"
3. Haz clic en **Connect Wallet** y **Add to MetaMask**
4. Aprueba la adición de red en MetaMask

**Método Manual:**

```javascript
// Agrega esta configuración manualmente en MetaMask
Network Name: Polkadot Hub TestNet
Chain ID: 420420422
RPC URL: https://testnet-passet-hub-eth-rpc.polkadot.io
Currency Symbol: PAS
Block Explorer: https://blockscout-passet-hub.parity-testnet.parity.io
```

## 6. Integración Frontend

### Conectar a la Red de Polkadot

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

### Interacción con Contratos (Ethers.js)

```javascript
import { ethers } from "ethers";

const provider = new ethers.JsonRpcProvider(
  "https://testnet-passet-hub-eth-rpc.polkadot.io"
);
const contract = new ethers.Contract(contractAddress, abi, signer);
const result = await contract.someFunction();
```

### Proyectos Template

- **kitdot@latest (Recomendado):** `kitdot@latest init -y` - Templates configurados con configuraciones de red apropiadas
- **React + Hardhat:** [create-polkadot-dapp](https://www.npmjs.com/package/create-polkadot-dapp)
- **Ejemplos:** [hardhat-polkadot-example](https://github.com/UtkarshBhardwaj007/hardhat-polkadot-example)

### Template de Gestión de Proyectos

Para una gestión efectiva de proyectos de hackathon y colaboración en equipo:

- **Template GitHub Projects:** [Tablero de Proyecto Hackathon](https://github.com/orgs/w3b3d3v/projects/34/views/1) - Tablero de proyecto listo para usar con seguimiento de tareas, planificación de sprints y funciones de coordinación de equipo

## 6. Solución de Problemas

### Comandos de Emergencia

```bash
# Reinicio limpio
npx hardhat clean && rm -rf ignition/deployments/ && npx hardhat compile

# Verificar balance
npx hardhat console --network passetHub
> await ethers.provider.getBalance("YOUR_ADDRESS")

# Rastrear despliegue
npx hardhat ignition track-tx <txHash> <deploymentId> --network passetHub
```

## 7. Ideas de Proyecto

**Ideas Simples Probadas:**

- **Token Personalizado:** [Tutorial ERC-20](https://docs.polkadot.com/tutorials/smart-contracts/deploy-erc20/)
- **Colección NFT:** [Tutorial NFT](https://docs.polkadot.com/tutorials/smart-contracts/deploy-nft/)
- **DeFi Simple:** [Ejemplo Uniswap V2](https://github.com/papermoonio/uniswap-v2-polkadot)

**Ideas Comprehensivas de Economía de Intercambio P2P:**

- **[Catálogo Comprehensivo de Economía de Intercambio P2P](https://docs.google.com/document/d/165krMbAVbejDAOTD2xa9CB1hDcmciHXI0LJ4hEpH2SQ):** Catálogo extenso de plataformas de economía de intercambio peer-to-peer en varios sectores con aplicaciones implementadas e "Ideas Posibles" para categorías no exploradas. Perfecto para identificar brechas de mercado y construir alternativas descentralizadas.

## 8. Detalles de Red

- **Chain ID:** 420420422
- **RPC:** https://testnet-passet-hub-eth-rpc.polkadot.io
- **Explorer:** https://blockscout-passet-hub.parity-testnet.parity.io
- **Faucet:** https://faucet.polkadot.io/?parachain=1111

## 9. Mejores Prácticas de Seguridad

- Mantén los contratos bajo 100KB
- Valida todas las entradas
- Usa implementaciones mínimas en lugar de librerías pesadas

### Guardia Simple de Reentrancy

```solidity
contract SimpleReentrancyGuard {
    bool private locked;
    modifier nonReentrant() {
        require(!locked, "Reentrant call");
        locked = true; _; locked = false;
    }
}
```

## 10. Preparación de Demo

**Componentes Esenciales:**

1. Contrato desplegado en el explorador de bloques
2. Frontend conectando al wallet
3. Funcionalidad principal funcionando
4. Demostración clara del valor

**Script de Demo:**

- Breve: Declaración del problema
- Principal: Demo en vivo de la solución
- Cierre: Aspectos técnicos destacados y visión futura

## 11. Recursos y Herramientas

**Documentación Esencial**

- [Mapa de Herramientas Open Source de Polkadot](polkadot-development-tools.md): Hemos creado un mapa de todas las herramientas open source principales en Polkadot.
- [Guía Básica de Smart Contracts de Polkadot](101-smart-contracts-polkadot.md): Si quieres empezar desde cero y necesitas documentación más detallada sobre smart contracts de Polkadot, como un 101 para principiantes, te sugerimos revisar esta guía.


**Entornos de Desarrollo:**

- [Remix IDE](https://docs.polkadot.com/develop/smart-contracts/dev-environments/remix/)
- [Guía de Hardhat](https://docs.polkadot.com/develop/smart-contracts/dev-environments/hardhat/)

**Librerías:**

- [Integración Ethers.js](https://docs.polkadot.com/develop/smart-contracts/libraries/ethers-js/)
- [Integración Web3.js](https://docs.polkadot.com/develop/smart-contracts/libraries/web3-js/)

**Referencias Detalladas:**

- **Guías de Escritura:** Usa `writing-guidelines.md` al crear documentación
- **Configuración de Contexto Agentes:** `Agents.md`
- **Detalles de Red:** `docs/seed-content/configs.md`
- **Visión General de Herramientas:** `docs/polkadot-development-tools.md`

**Tutoriales en Video:**

- [Workshop de Despliegue de Contratos](https://youtu.be/TGgpG1jPxeE)
- [Smart Contracts en Polkadot](https://www.youtube.com/watch?v=GPuTt10dxKI)

## Comienza con Kitdot

Usa `kitdot@latest init -y` para configuración apropiada del proyecto con configuraciones de red verificadas. Templates alternativos disponibles.

Estás construyendo en Polkadot usando herramientas familiares de Ethereum. Enfócate en funcionalidad que funcione sobre código perfecto.