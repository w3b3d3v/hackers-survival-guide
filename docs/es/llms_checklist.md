# Guía de Despliegue de Smart Contracts con Claude Code - TestNet Paseo

## DESCRIPCIÓN GENERAL

Este documento proporciona información completa para desplegar smart contracts en Polkadot Hub TestNet (Paseo) usando Claude Code. Incluye configuraciones verificadas, problemas comunes, soluciones y estrategias de optimización.

**CRÍTICO: Siempre inicializa nuevos proyectos con `kitdot init` para una configuración adecuada de red y gestión de dependencias.**

## INFORMACIÓN DE RED

### Detalles de Paseo TestNet

- **Nombre de Red**: Polkadot Hub TestNet
- **Chain ID**: 420420422 (0x1911f0a6 en hex)
- **URL RPC**: https://testnet-passet-hub-eth-rpc.polkadot.io
- **Explorador de Bloques**: https://blockscout-passet-hub.parity-testnet.parity.io
- **Moneda**: PAS
- **Faucet**: https://faucet.polkadot.io/?parachain=1111
- **Estado**: Vista Previa de PolkaVM (etapa de desarrollo temprano)

### Características Clave

- **Compatibilidad EVM**: Despliegue de smart contracts compatible con Ethereum
- **PolkaVM**: Requiere configuración específica para compatibilidad
- **Límite de Bytecode**: ~100KB tamaño máximo de contrato
- **Modelo de Gas**: Mecánica de gas estándar de EVM
- **Advertencia de Versión de Node**: Funciona con Node.js v21+ a pesar de las advertencias

## DEPENDENCIAS REQUERIDAS

### Dependencias Principales

```bash
npm install --save-dev @parity/hardhat-polkadot solc@0.8.28
npm install --force @nomicfoundation/hardhat-toolbox
npm install dotenv
```

### Requisitos de Package.json

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

**CRÍTICO**: Usa la bandera `--force` al instalar hardhat-toolbox para resolver conflictos de dependencias.

## CONFIGURACIÓN DE HARDHAT

### hardhat.config.js Completo y Funcional

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

### Requisitos de Configuración

1. **Debe usar formato string para versión de Solidity**: `solidity: "0.8.28"`
2. **Debe incluir configuración resolc**: Requerido para compatibilidad con PolkaVM
3. **Debe establecer polkavm: true**: En todas las configuraciones de red
4. **Debe usar hardhat vars**: Para gestión de claves privadas
5. **Nombre de red**: Usar `passetHub` (no paseo u otros nombres)

## PROCESO DE CONFIGURACIÓN

### Paso 1: Inicializar Proyecto con kitdot (Recomendado)

```bash
npm install -g kitdot
kitdot init tu-proyecto
cd tu-proyecto
```

**Configuración Manual Alternativa:**

```bash
mkdir tu-proyecto
cd tu-proyecto
npm init -y
```

**¿Por qué kitdot?** Configura automáticamente las configuraciones de red adecuadas, dependencias y estructura del proyecto. Elimina errores comunes de configuración.

### Paso 2: Instalar Dependencias

**Si usas kitdot:** Las dependencias se instalan automáticamente.

**Instalación manual:**

```bash
npm install --save-dev @parity/hardhat-polkadot solc@0.8.28
npm install --force @nomicfoundation/hardhat-toolbox
npm install dotenv
```

### Paso 3: Inicializar Plugin de Polkadot

**Si usas kitdot:** Ya está configurado.

**Configuración manual:**

```bash
npx hardhat-polkadot init
```

### Paso 4: Configurar Clave Privada

```bash
npx hardhat vars set PRIVATE_KEY
# Ingresa tu clave privada cuando se solicite (sin prefijo 0x)
```

### Paso 5: Obtener Tokens de Prueba

1. Visita https://faucet.polkadot.io/?parachain=1111
2. Ingresa la dirección de tu billetera
3. Solicita tokens PAS
4. Verifica el saldo en tu billetera o explorador de bloques

### Paso 6: Crear Configuración de Hardhat

**Si usas kitdot:** El archivo de configuración ya está creado con las configuraciones apropiadas.

**Configuración manual:** Copia la configuración exacta de arriba en `hardhat.config.js`

## DESARROLLO DE CONTRATOS

### Requisitos de Versión de Solidity

- **Versión Requerida**: ^0.8.28
- **Objetivo EVM**: paris (por defecto)
- **Optimizador**: Habilitado por defecto

### Ejemplo de Contrato Simple

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

### Limitaciones de Tamaño de Contrato

- **Bytecode Máximo**: ~100KB
- **Impacto de OpenZeppelin**: Las importaciones estándar a menudo exceden el límite
- **Optimización Requerida**: Eliminar dependencias innecesarias

## PROCESO DE DESPLIEGUE

### Usando Hardhat Ignition (Recomendado)

#### Paso 1: Crear Módulo de Ignition

```javascript
// ignition/modules/TuModulo.js
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("TuModulo", (m) => {
  const contract = m.contract("TuContrato", [
    // argumentos del constructor
  ]);
  return { contract };
});
```

#### Paso 2: Compilar Contratos

```bash
npx hardhat compile
# Debería mostrar: "Successfully compiled X Solidity files"
```

#### Paso 3: Desplegar a Paseo

```bash
npx hardhat ignition deploy ./ignition/modules/TuModulo.js --network passetHub
# Confirma con 'y' cuando se solicite
```

### Estados de Despliegue

- **Estado Limpio**: `rm -rf ignition/deployments/` para empezar de nuevo
- **Reanudar**: Ignition reanuda automáticamente despliegues interrumpidos
- **Rastrear Transacciones**: Usa el explorador de bloques para rastrear transacciones fallidas

## ERRORES COMUNES Y SOLUCIONES

### 1. Error "CodeRejected"

**Error**: `Failed to instantiate contract: Module(ModuleError { index: 60, error: [27, 0, 0, 0], message: Some("CodeRejected") })`

**Causas**:

- Falta configuración PolkaVM
- Configuraciones de red incorrectas
- Falta configuración resolc

**Soluciones**:

- Asegurar `polkavm: true` en configuración de red
- Agregar bloque de configuración resolc
- Usar formato exacto de hardhat.config.js de arriba

### 2. Error "initcode is too big"

**Error**: `initcode is too big: 125282` (o número similar)

**Causa**: El bytecode del contrato excede el límite de ~100KB

**Soluciones**:

- Eliminar dependencias de OpenZeppelin
- Usar implementaciones mínimas de contratos
- Dividir contratos grandes en componentes más pequeños
- Implementar versiones ligeras personalizadas

### 3. Errores de Configuración

**Error**: `Cannot read properties of undefined (reading 'settings')`

**Solución**: Usar formato string para versión de Solidity: `solidity: "0.8.28"`

### 4. Problemas de Dependencias

**Error**: `Cannot find module 'run-container'` o similar

**Soluciones**:

- Instalar dependencias con bandera `--force`
- Limpiar node_modules y reinstalar
- Verificar compatibilidad de versión @parity/hardhat-polkadot

### 5. Problemas de Clave Privada

**Error**: `No signers found` o fallas de autenticación

**Soluciones**:

- Establecer clave privada vía `npx hardhat vars set PRIVATE_KEY`
- Asegurar que la cuenta tiene tokens PAS
- Verificar formato de clave privada (sin prefijo 0x en vars)

## OPTIMIZACIÓN DE CONTRATOS

### Eliminando Dependencias de OpenZeppelin

#### En lugar de OpenZeppelin Ownable:

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

#### En lugar de OpenZeppelin ReentrancyGuard:

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

#### Implementación Mínima ERC721:

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

## INTEGRACIÓN FRONTEND

### Configuración de Red para MetaMask

```javascript
const paseoConfig = {
  chainId: "0x1911f0a6", // 420420422 en hex
  chainName: "Polkadot Hub TestNet",
  nativeCurrency: {
    name: "PAS",
    symbol: "PAS",
    decimals: 18,
  },
  rpcUrls: ["https://testnet-passet-hub-eth-rpc.polkadot.io"],
  blockExplorerUrls: ["https://blockscout-passet-hub.parity-testnet.parity.io"],
};

// Agregar red a MetaMask
await window.ethereum.request({
  method: "wallet_addEthereumChain",
  params: [paseoConfig],
});
```

### Interacción con Contratos usando Ethers.js

```javascript
import { ethers } from "ethers";

// Conectar a Paseo
const provider = new ethers.JsonRpcProvider(
  "https://testnet-passet-hub-eth-rpc.polkadot.io"
);

// Instancia del contrato
const contract = new ethers.Contract(contractAddress, abi, signer);

// Llamar funciones
const result = await contract.someFunction();
```

## TESTING Y VERIFICACIÓN

### Verificación de Compilación

```bash
npx hardhat compile
# Salida esperada: "Successfully compiled X Solidity files"
# NO debería mostrar advertencias de tamaño de contrato para contratos <100KB
```

### Verificación de Despliegue

1. **Salida de Despliegue Exitoso**:

```
[ TuModulo ] successfully deployed 🚀

Deployed Addresses
TuModulo#TuContrato - 0x1234567890abcdef...
```

2. **Verificación en Explorador de Bloques**:

- Visita https://blockscout-passet-hub.parity-testnet.parity.io
- Busca la dirección del contrato
- Verifica la transacción de creación del contrato

3. **Prueba de Interacción con Contrato**:

```bash
npx hardhat console --network passetHub
> const Contract = await ethers.getContractFactory("TuContrato");
> const contract = Contract.attach("0x...");
> await contract.someFunction();
```

## ESTRATEGIAS DE DEBUGGING

### Verificar Conectividad de Red

```bash
curl -X POST -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"web3_clientVersion","params":[],"id":1}' \
  https://testnet-passet-hub-eth-rpc.polkadot.io
```

### Verificar Saldo de Cuenta

```bash
npx hardhat console --network passetHub
> await ethers.provider.getBalance("TU_DIRECCION")
```

### Limpieza de Build y Despliegue

```bash
npx hardhat clean
rm -rf ignition/deployments/
npx hardhat compile
npx hardhat ignition deploy ./ignition/modules/TuModulo.js --network passetHub
```

### Rastreo de Transacciones

Si el despliegue falla:

1. Revisa el explorador de bloques para transacciones de la cuenta
2. Busca transacciones fallidas con errores de gas
3. Usa `npx hardhat ignition track-tx <txHash> <deploymentId> --network passetHub`

## MEJORES PRÁCTICAS

### Flujo de Trabajo de Desarrollo

1. **Empezar Simple**: Despliega contratos básicos primero para verificar configuración
2. **Optimizar Temprano**: Verifica tamaños de contratos durante el desarrollo
3. **Probar Localmente**: Usa la red local de hardhat para pruebas iniciales
4. **Despliegue Incremental**: Despliega componentes por separado si son demasiado grandes
5. **Documentar Direcciones**: Mantén registro de todas las direcciones de contratos desplegados

### Diseño de Contratos para Paseo

1. **Minimizar Dependencias**: Evita bibliotecas pesadas
2. **Implementaciones Personalizadas**: Escribe versiones mínimas de contratos estándar
3. **Diseño Modular**: Divide funcionalidad entre múltiples contratos
4. **Optimización de Gas**: Usa estructuras de datos y algoritmos eficientes
5. **Patrones Proxy**: Considera contratos actualizables para lógica compleja

### Consideraciones de Seguridad

1. **Gestión de Claves Privadas**: Siempre usar hardhat vars, nunca hacer commit de claves
2. **Solo Red de Prueba**: Paseo es para pruebas, no para valor de producción
3. **Verificación de Código**: Verifica contratos en el explorador de bloques cuando sea posible
4. **Controles de Acceso**: Implementa sistemas apropiados de propiedad y permisos

## COMANDOS DE REFERENCIA

### Comandos Esenciales

```bash
# Configuración de proyecto
npm install --save-dev @parity/hardhat-polkadot solc@0.8.28
npm install --force @nomicfoundation/hardhat-toolbox
npx hardhat-polkadot init

# Configuración
npx hardhat vars set PRIVATE_KEY
npx hardhat vars list

# Desarrollo
npx hardhat compile
npx hardhat clean
npx hardhat test

# Despliegue
npx hardhat ignition deploy ./ignition/modules/Modulo.js --network passetHub
rm -rf ignition/deployments/  # Limpiar estado de despliegue

# Debugging
npx hardhat console --network passetHub
npx hardhat node  # Desarrollo local
```

### Variables de Entorno

```bash
# Configuración .env opcional
REPORT_GAS=true
ETHERSCAN_API_KEY=tu_clave_aqui
```

## DIRECTRICES DE ESCRITURA PARA LLMs

Al crear documentación o ayudar a desarrolladores:

- [ ] **Consulta llms-writing-guidelines.md para estándares de documentación**
- [ ] Usa voz activa: "Despliega el contrato" no "El contrato debería ser desplegado"
- [ ] Lidera con resultados, no con proceso
- [ ] Corta calificativos: "muy", "bastante", "más bien"
- [ ] Elige palabras simples sobre complejas
- [ ] Establece conclusiones primero, explica si es necesario

## CHECKLIST DE RESOLUCIÓN DE PROBLEMAS

**Primero: Intenta kitdot init con proyecto nuevo y copia código existente**

Cuando el despliegue falla, verifica:

- [ ] Usado kitdot init para configuración apropiada (recomendado)
- [ ] La configuración de Hardhat coincide con el formato exacto de arriba
- [ ] Clave privada establecida vía `npx hardhat vars set PRIVATE_KEY`
- [ ] La cuenta tiene suficientes tokens PAS
- [ ] El contrato compila sin errores
- [ ] Tamaño del contrato bajo 100KB
- [ ] Conectividad de red al endpoint RPC
- [ ] Sin dependencias de OpenZeppelin causando problemas de tamaño
- [ ] Estado de despliegue limpio si se reanuda un despliegue fallido

## LIMITACIONES Y WORKAROUNDS

### Limitaciones Actuales

- **Tamaño de Contrato**: Límite de bytecode de 100KB
- **OpenZeppelin**: La mayoría de bibliotecas son demasiado grandes
- **Estabilidad de Red**: Versión de vista previa, posible tiempo de inactividad
- **Herramientas de Debugging**: Limitadas comparado con mainnet
- **Documentación**: Escasa, soluciones impulsadas por la comunidad

### Workarounds Recomendados

- **Problemas de Tamaño**: Usar implementaciones personalizadas mínimas
- **Lógica Compleja**: Dividir entre múltiples contratos
- **Gestión de Estado**: Usar eventos para datos off-chain
- **Experiencia de Usuario**: Proporcionar mensajes de error claros
- **Testing**: Pruebas exhaustivas localmente antes del despliegue

Esta guía proporciona información completa para el despliegue exitoso de smart contracts en Paseo TestNet usando Claude Code, incluyendo todas las configuraciones críticas, problemas comunes y estrategias de optimización.