# Guía de Desarrollo para Hackathons de Polkadot

_Para Desarrolladores Nuevos en Web3_

## 1. Inicio Rápido con Kitdot

### Para Quién Es Esta Guía

Desarrolladores con sólidas habilidades de programación pero sin experiencia en Web3/Polkadot.

### Objetivo Principal

Desplegar smart contracts funcionales en la testnet de Polkadot y construir un frontend funcional dentro de los tiempos de un hackathon.

### Inicia Tu Proyecto con Kitdot

**Recomendado**: Usa Kitdot para una configuración adecuada de red y configuración de proyecto:

```bash
npx kitdot install -y
```

o

```bash
npm install -g kitdot
kitdot init my-polkadot-project
cd my-polkadot-project
```

**¿Por qué Kitdot?** Asegura configuraciones de red adecuadas, dependencias correctas y configuraciones probadas en batalla. Evita dolores de cabeza de configuración y comienza a construir inmediatamente.

**¿Proyecto Existente?** Comienza desde cero con Kitdot y copia tus archivos. Esto previene conflictos de configuración y problemas de conexión de red.

## 2. Librerías de Contratos Pre-construidos

### Aprovecha el Código Existente

Antes de construir desde cero, explora estas librerías de contratos probadas en batalla:

**Contratos de Thirdweb**

- **Repositorio:** [thirdweb-dev/contracts](https://github.com/thirdweb-dev/contracts/tree/main/contracts)
- **Mejor para:** NFTs, tokens, marketplaces, governance
- **Ventaja:** Implementaciones listas para producción, optimizadas en gas
- **Nota:** Puede necesitar optimización de tamaño para el límite de 100KB de Polkadot

**Contratos de OpenZeppelin**

- **Repositorio:** [OpenZeppelin/openzeppelin-contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)
- **Mejor para:** Implementaciones estándar (ERC20, ERC721, ERC1155)
- **Ventaja:** Estándar de la industria, bien auditado
- **Nota:** A menudo demasiado pesado para Polkadot - úsalo como referencia para implementaciones mínimas

**Alternativa Optimizada para Polkadot**

- **Repositorio:** [papermoonio/openzeppelin-contracts-polkadot](https://github.com/papermoonio/openzeppelin-contracts-polkadot)
- **Mejor para:** Versiones optimizadas en tamaño para Polkadot
- **Ventaja:** Ya adaptado para la restricción de 100KB

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

### Ruta 2: Configuración Manual de Hardhat (No Recomendado)

**Usa Kitdot en su lugar** para configuración automatizada, pero si debes configurar manualmente:

```bash
# Mejor: Usa Kitdot init en su lugar
mkdir hackathon-project && cd hackathon-project
npm init -y
npm install --save-dev @parity/hardhat-polkadot solc@0.8.28
npm install --force @nomicfoundation/hardhat-toolbox
npx hardhat-polkadot init
```

**Kitdot maneja esto automáticamente** con configuraciones de red apropiadas.

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

## 5. Integración Frontend

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

- **Kitdot (Recomendado):** `kitdot init -y` - Templates configurados con configuraciones de red apropiadas
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

- **Guía de Desarrollo LLM:** Usa `llms-writing-guidelines.md` al crear documentación
- **Configuración Completa:** `docs/seed-content/llms_checklist.md`
- **Detalles de Red:** `docs/seed-content/configs.md`
- **Visión General de Herramientas:** `docs/polkadot-development-tools.md`

**Tutoriales en Video:**

- [Workshop de Despliegue de Contratos](https://youtu.be/TGgpG1jPxeE)
- [Smart Contracts en Polkadot](https://www.youtube.com/watch?v=GPuTt10dxKI)

## Comienza con Kitdot

Usa `kitdot init -y` para configuración apropiada del proyecto con configuraciones de red verificadas. Templates alternativos disponibles.

Estás construyendo en Polkadot usando herramientas familiares de Ethereum. Enfócate en funcionalidad que funcione sobre código perfecto.