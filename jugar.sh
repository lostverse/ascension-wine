#!/bin/bash

# --- CONFIGURACIÓN ---
# Cambia esta ruta por la ruta REAL de tu carpeta de Ascension
# Ejemplo: /mnt/sdb1/Games/Ascension  o  $HOME/Games/Ascension
RUTA_WINEPREFIX="/mnt/sdb1/Games/Ascension" 
# ---------------------

# Verificar si la ruta existe
if [ ! -d "$RUTA_WINEPREFIX" ]; then
    echo "ERROR: La ruta '$RUTA_WINEPREFIX' no existe."
    echo "Por favor, edita el script 'jugar.sh' y corrige la variable RUTA_WINEPREFIX."
    exit 1
fi

echo "Iniciando Ascension WoW..."

# Exportar variables necesarias
export WINEPREFIX="$RUTA_WINEPREFIX"
export ELECTRON_DISABLE_SANDBOX=1

# Ruta al ejecutable (Asumiendo instalación en Program Files (x86))
EJECUTABLE="$RUTA_WINEPREFIX/drive_c/Program Files (x86)/Ascension Launcher/Ascension Launcher.exe"

# Verificar si el ejecutable existe
if [ ! -f "$EJECUTABLE" ]; then
    echo "ERROR: No se encontró el launcher en: $EJECUTABLE"
    echo "¿Lo instalaste en 'Program Files' en vez de 'Program Files (x86)'?"
    exit 1
fi

# ¡A jugar!
cd "$RUTA_WINEPREFIX/drive_c/Program Files (x86)/Ascension Launcher"
wine "Ascension Launcher.exe"   
