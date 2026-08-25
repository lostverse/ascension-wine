# 🐧 Ascension WoW en Linux Mint (Guía Definitiva 2026)

Guía completa y probada para instalar y ejecutar **Ascension WoW** en **Linux Mint** (y derivados de Ubuntu) utilizando **Wine 11**. Esta solución aborda específicamente los errores críticos: **Error 132**, **Pantalla Negra** y **Carga Infinita**.

> **Fecha de validación:** Agosto 2026  
> **Sistema probado:** Linux Mint 21/22 (Wilma)  
> **Versión de Wine:** 11.x (Stable)

---

## 📋 Índice
1. [Requisitos Previos](#-requisitos-previos)
2. [Paso 1: Instalación de Wine 11](#-paso-1-instalación-de-wine-11)
3. [Paso 2: Configuración del Entorno y Dependencias](#-paso-2-configuración-del-entorno-y-dependencias)
4. [Paso 3: Instalación del Juego (Crítico)](#-paso-3-instalación-del-juego-crítico)
5. [Paso 4: Correcciones Finales y Ejecución](#-paso-4-correcciones-finales-y-ejecución)
6. [Solución de Problemas](#-solución-de-problemas)
7. [Notas Importantes](#-notas-importantes)

---

## 🛠️ Requisitos Previos
- **Sistema Operativo:** Linux Mint 21.x o 22.x (Ubuntu 22.04/24.04).
- **Arquitectura:** x86_64.
- **Permisos:** Acceso `sudo` para instalar paquetes.
- **Espacio en disco:** Mínimo 50 GB libres (se recomienda SSD, pero funciona en HDD).

---

## 🍷 Paso 1: Instalación de Wine 11

Para evitar conflictos con versiones antiguas, instalaremos Wine directamente desde el repositorio oficial de WineHQ.

```bash
# 1. Activar arquitectura de 32 bits (Obligatorio)
sudo dpkg --add-architecture i386

# 2. Añadir la clave del repositorio
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key

# 3. Añadir el repositorio (Usamos 'noble' para Mint 22/Ubuntu 24.04)
# Nota: Si usas Mint 21, y da error, cambia 'noble' por 'jammy' en la URL siguiente.
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources

# 4. Actualizar e instalar Wine 11 Stable
sudo apt update
sudo apt install --install-recommends winehq-stable -y

# 5. Instalar herramientas adicionales
sudo apt install winetricks mono-complete -y

# 6. Verificar instalación (Debería mostrar wine-11.x)
wine --version

⚙️ Paso 2: Configuración del Entorno y Dependencias
Crearemos un prefijo limpio de 64 bits e instalaremos las librerías gráficas y de runtime necesarias.

# Define la ruta donde instalarás el juego (¡CAMBIA ESTO POR TU RUTA!)
export WINEPREFIX=$HOME/Games/Ascension
# O si está en otro disco: export WINEPREFIX=/mnt/sdb1/Games/Ascension

# 1. Forzar arquitectura del prefijo a 64 bits e inicializar
export WINEARCH=win64
winecfg
# (Acepta la ventana emergente de creación del prefijo)

# 2. Instalar dependencias críticas (Fuentes, C++, DXVK)
winetricks corefonts
winetricks -q vcrun2015
winetricks --force vcrun2022
winetricks dxvk

🎮 Paso 3: Instalación del Juego (Crítico)
Este paso es vital para evitar el error de "Carga Infinita".

Descarga el instalador oficial desde Ascension.gg.
Ejecuta el instalador:
wine Ascension-Setup.exe

IMPORTANTE: Cuando el instalador pregunte la ruta de instalación, DEBES cambiarla manualmente a: C:\Program Files (x86)\Ascension Launcher
⚠️ No uses C:\Program Files (a secas). El juego es de 32 bits y fallará si se instala en la carpeta de 64 bits.
🚀 Paso 4: Correcciones Finales y Ejecución
Antes de lanzar el juego por primera vez, aplicamos los parches de registro y variables de entorno.

# Asegúrate de tener la ruta correcta
export WINEPREFIX=$HOME/Games/Ascension  # Ajusta tu ruta

# 1. Desactivar la DLL conflictiva (divxtac) que cierra el launcher
wine reg add 'HKCU\Software\Wine\DllOverrides' /v divxtac /t REG_SZ /d disabled /f

# 2. Desactivar Sandbox de Electron (Evita pantalla negra)
export ELECTRON_DISABLE_SANDBOX=1

# 3. Lanzar el juego
cd "$WINEPREFIX/drive_c/Program Files (x86)/Ascension Launcher"
wine "Ascension Launcher.exe"

🆘 Solución de Problemas
Error / Síntoma	Causa Probable	Solución
ERROR #132 (0xC0000005)	Falta DXVK o prefijo corrupto	Ejecuta winetricks dxvk y asegúrate de haber hecho wineboot -u tras instalar Wine 11.
Pantalla Negra al abrir	Sandbox de Electron bloqueado	Exporta ELECTRON_DISABLE_SANDBOX=1 antes de ejecutar.
Carga Infinita (Barra llena)	Juego en carpeta incorrecta	El juego está en Program Files. Muévelo o reinstálalo en Program Files (x86).
Launcher no abre / Cierra	DLL divxtac conflictiva	Ejecuta el comando wine reg add ... del Paso 4.
Error de red / WSALookup	Configuración de red Wine	Suele ser inocuo. Si bloquea, reinicia el router o verifica tu DNS.

💡 Notas Importantes
Idioma: El cliente se instala en Inglés por defecto. Para cambiar a Español:
Abre el Launcher.
Ve a la pestaña Addons > Mods and Locales.
Marca Spanish y guarda cambios (se descargará un parche). Nota: Si el mod de español da error, es un problema temporal del servidor de Ascension.
Rendimiento en HDD: La primera entrada al mundo puede tardar varios minutos (5-10 min) mientras se compilan los shaders. Las siguientes veces será rápido. Se recomienda encarecidamente un SSD.
Servidor PTR: Si quieres probar el reino de pruebas, instálalo en una carpeta diferente (WINEPREFIX distinto) para no mezclar configuraciones.
Mantenimiento: No actualices Wine a versiones "Devel" o "Staging" a menos que sea necesario. La versión Stable 11.x es la más probada.
📜 Licencia y Créditos
Esta guía es una recopilación comunitaria para facilitar la instalación de Ascension WoW en Linux.

Basado en la experiencia de usuarios de Linux Mint y la documentación de WineHQ.
Agradecimientos a la comunidad de r/ascensionproject y r/linux_gaming.
¡Disfruta de Azeroth en Linux! ⚔️🐧
