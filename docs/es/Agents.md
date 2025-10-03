# Agents

## DESCRIPCIÓN GENERAL

Este documento proporciona información completa para desplegar smart contracts en Polkadot Hub TestNet (Paseo) usando Claude Code. Incluye configuraciones verificadas, problemas comunes, soluciones y estrategias de optimización.

**CRÍTICO: Siempre inicializa nuevos proyectos con `kitdot@latest init` para una configuración adecuada de red y gestión de dependencias.**

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

### Paso 1: Inicializar Proyecto con kitdot@latest (Recomendado)

```bash
npm install -g kitdot@latest
kitdot init tu-proyecto
cd tu-proyecto
```

**Configuración Manual Alternativa:**

```bash
mkdir tu-proyecto
cd tu-proyecto
npm init -y
```

**¿Por qué kitdot@latest?** Configura automáticamente las configuraciones de red adecuadas, dependencias y estructura del proyecto. Elimina errores comunes de configuración.

### Paso 2: Instalar Dependencias

**Si usas kitdot@latest:** Las dependencias se instalan automáticamente.

**Instalación manual:**

```bash
npm install --save-dev @parity/hardhat-polkadot solc@0.8.28
npm install --force @nomicfoundation/hardhat-toolbox
npm install dotenv
```

### Paso 3: Inicializar Plugin de Polkadot

**Si usas kitdot@latest:** Ya está configurado.

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

**Si usas kitdot@latest:** El archivo de configuración ya está creado con las configuraciones apropiadas.

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

### Problemas de Transacciones Frontend (Problemas de Estimación de Gas/Legacy)

**CRÍTICO PARA AGENTES:** Las aplicaciones frontend frecuentemente encuentran problemas de estimación de gas al enviar transacciones a redes de Polkadot. Siempre implementa estas estrategias:

#### Método 1: Estimación de Gas Legacy con Buffer

```javascript
// Usa estimación de gas legacy con buffer de seguridad
const gasLimit = await provider.estimateGas({
  to: contractAddress,
  data: contractInterface.encodeFunctionData("functionName", [args]),
});

// Agrega buffer de 10-20% para seguridad
const adjustedGasLimit = gasLimit.mul(120).div(100);

// Envía transacción con gas explícito y tipo legacy
const tx = await contract.functionName(args, {
  gasLimit: adjustedGasLimit,
  type: 0, // Usa tipo de transacción legacy
});
```

#### Método 2: Límites de Gas Fijos

```javascript
// Usa límites de gas fijos para operaciones predecibles
const tx = await contract.functionName(args, {
  gasLimit: 100000, // Ajusta basado en complejidad de función
  type: 0, // Tipo de transacción legacy
  gasPrice: ethers.utils.parseUnits("20", "gwei"), // Opcional: establecer precio de gas
});
```

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

## DESPLIEGUE EN POLKADOT CLOUD (APILLON)

### Configuración de Cuenta Apillon y UUID del Sitio Web

**CRÍTICO PARA AGENTES:** Al desplegar aplicaciones frontend en Polkadot Cloud, sigue estos pasos:

#### Paso 1: Crear Cuenta Apillon

**INSTRUIR AL USUARIO PARA:**

1. **Visitar Consola Apillon:** https://app.apillon.io
2. **Registrar Cuenta:** Usar email y crear contraseña segura
3. **Verificar Email:** Completar proceso de verificación de email
4. **Conectar Wallet:** Vincular tu wallet Polkadot/Substrate para pagos
5. **Generar Credenciales API:**
   - Ir a **Settings** → **API Keys**
   - Hacer clic en **Create New API Key**
   - Nombrarlo (ej. "Proyecto Hackathon")
   - Copiar **API Key** y **API Secret** inmediatamente
   - Almacenar de forma segura - API Secret solo se muestra una vez

#### Paso 2: Crear Proyecto de Sitio Web

**INSTRUIR AL USUARIO PARA:**

1. **Navegar a Sección Hosting:** En consola Apillon
2. **Crear Nuevo Sitio Web:** Hacer clic en botón "New Website"
3. **Configurar Proyecto:**
   ```
   Project Name: [Nombre de Tu Proyecto]
   Environment: Production
   Domain: [Dominio personalizado opcional]
   ```
4. **Copiar UUID del Sitio Web:** Después de la creación, copiar el UUID generado (formato: `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`)
5. **Proporcionar UUID al Agente:** Compartir el UUID del Sitio Web para que el agente pueda configurar el despliegue

#### Paso 3: Obtener UUID del Sitio Web para Despliegue

```bash
# Ejemplo formato UUID
WEBSITE_UUID="12345678-1234-5678-9abc-123456789def"
```

### Configuración MCP para Hosting en Polkadot Cloud

**Configuración del Protocolo de Contexto de Modelo (MCP):**

#### Paso 1: Configuración del Servidor MCP

**CRÍTICO PARA AGENTES:** Configura tu cliente MCP para usar el servidor MCP de Apillon.

##### Para Claude Desktop:

Agrega esto a tu archivo de configuración MCP:

```json
{
  "mcpServers": {
    "apillon-mcp-server": {
      "command": "npx",
      "args": ["-y", "@apillon/mcp-server"],
      "env": {
        "APILLON_API_KEY": "<APILLON_API_KEY>",
        "APILLON_API_SECRET": "<APILLON_API_SECRET>"
      }
    },
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/Users/tu-usuario/Desktop"
      ]
    }
  }
}
```

**Pasos de Configuración Claude Desktop:**

1. **Localizar archivo config MCP:** Usualmente en `~/Library/Application Support/Claude/claude_desktop_config.json` (macOS)
2. **Agregar servidor Apillon:** Insertar la configuración de arriba
3. **Reemplazar placeholders:** Actualizar `<APILLON_API_KEY>` y `<APILLON_API_SECRET>` con valores reales
4. **Actualizar ruta filesystem:** Cambiar `/Users/tu-usuario/Desktop` a tu directorio de proyecto
5. **Reiniciar Claude Desktop:** Requerido para que cambios MCP surtan efecto

##### Para Cursor IDE:

**Configuración MCP en Cursor:**

1. **Instalar extensión MCP:** En Cursor, ir a Extensions y buscar "Model Context Protocol"
2. **Abrir configuraciones Cursor:** `Cmd/Ctrl + ,` → Buscar "MCP"
3. **Agregar configuración servidor:**

```json
{
  "mcp.servers": {
    "apillon-mcp-server": {
      "command": "npx",
      "args": ["-y", "@apillon/mcp-server"],
      "env": {
        "APILLON_API_KEY": "<APILLON_API_KEY>",
        "APILLON_API_SECRET": "<APILLON_API_SECRET>"
      }
    }
  }
}
```

**Pasos de Configuración Cursor:**

1. **Abrir settings.json:** `Cmd/Ctrl + Shift + P` → "Preferences: Open Settings (JSON)"
2. **Agregar configuración MCP:** Insertar la configuración de arriba
3. **Reemplazar placeholders:** Actualizar credenciales API
4. **Reiniciar Cursor:** Requerido para que cambios MCP surtan efecto
5. **Verificar conexión:** Verificar estado MCP en paleta de comandos de Cursor

#### Paso 2: Instalar CLI de Apillon (Método Alternativo)

```bash
npm install -g @apillon/cli
```

#### Paso 3: Configurar Autenticación

```bash
# Iniciar sesión en Apillon
apillon login

# Verificar autenticación
apillon whoami
```

#### Paso 4: Configurar MCP para Despliegue Automatizado

Crear `.apillon.json` en raíz del proyecto:

```json
{
  "websites": [
    {
      "uuid": "TU_UUID_SITIO_WEB_AQUI",
      "name": "Nombre de Tu Proyecto",
      "source": "./dist",
      "environment": "production"
    }
  ]
}
```

#### Paso 5: Script de Despliegue MCP

```bash
#!/bin/bash
# deploy-to-polkadot-cloud.sh

# Construir el proyecto
npm run build

# Desplegar a Apillon
apillon hosting deploy \
  --uuid $WEBSITE_UUID \
  --source ./dist \
  --environment production

# Verificar despliegue
apillon hosting info --uuid $WEBSITE_UUID
```

#### Paso 6: Variables de Entorno

```bash
# Establecer en tu entorno
export APILLON_API_KEY="tu_api_key_aqui"
export WEBSITE_UUID="tu_uuid_sitio_web_aqui"
```

### Mejores Prácticas para Agentes

1. **Configurar MCP primero:** Configurar servidor MCP de Apillon en tu IDE (Claude Desktop o Cursor) antes de comenzar el despliegue.
2. **Usar siempre CLI de Apillon más reciente:** `npm install -g @apillon/cli@latest`
3. **Credenciales seguras:** Almacenar API keys y UUIDs como variables de entorno, nunca en código
4. **Guiar al usuario en configuración de cuenta:** Instruir claramente a usuarios sobre creación de cuenta Apillon y generación de API key
5. **Verificar despliegues:** Verificar siempre estado de despliegue después de subida
6. **Usar entorno producción:** Para entregas finales de hackathon
7. **Monitorear costos:** Apillon usa modelo pago por uso
8. **Probar localmente primero:** Siempre probar builds antes de desplegar
9. **Reiniciar tu IDE:** Después de cambios de configuración MCP (Claude Desktop o Cursor)
10. **Verificar conexión MCP:** Verificar que servidor MCP de Apillon esté conectado correctamente antes del despliegue

## DIRECTRICES DE ESCRITURA PARA LLMs

Al crear documentación o ayudar a desarrolladores:

- [ ] **Consulta writing-guidelines.md para estándares de documentación**
- [ ] Usa voz activa: "Despliega el contrato" no "El contrato debería ser desplegado"
- [ ] Lidera con resultados, no con proceso
- [ ] Corta calificativos: "muy", "bastante", "más bien"
- [ ] Elige palabras simples sobre complejas
- [ ] Establece conclusiones primero, explica si es necesario

## CHECKLIST DE RESOLUCIÓN DE PROBLEMAS

**Primero: Intenta kitdot@latest init con proyecto nuevo y copia código existente**

Cuando el despliegue falla, verifica:

- [ ] Usado kitdot@latest init para configuración apropiada (recomendado)
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
