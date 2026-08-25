# 🐧 Ascension WoW en Linux Mint (Guía Definitiva 2026) 

# 💡 Aclarar debes poner tus rutas de tu sistema. 💡

📋 Guía completa y probada para instalar y ejecutar **Ascension WoW** en **Linux Mint** (y derivados de Ubuntu) utilizando **Wine 11**. Esta solución aborda específicamente los errores críticos: **Error 132**, **Pantalla Negra** y **Carga Infinita**.

> **Fecha de validación:** Agosto 2026  
> **Sistema probado:** Linux Mint 22 (Zena)  
> **Versión de Wine:** 11.x (Stable)

---
## 🛠️ Requisitos Previos
- **Sistema Operativo:** Linux Mint 21.x o 22.x (Ubuntu 22.04/24.04).
- **Arquitectura:** x86_64.
- **Permisos:** Acceso `sudo` para instalar paquetes.
- **Espacio en disco:** Mínimo 50 GB libres (se recomienda SSD, pero funciona en HDD).

---  
# 💡 PARA PROCEDER NECESITAS LEER 💡 
# 1.📜 [Instalación de Wine 11.x](Wine2026.txt) 
# 2.📜 [Instalación y configuración de Ascension](Ascension2026.txt) 
# 3.📜 [Script de inicio de ejemplo](jugar.sh)

---
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

---
---
## ⚠️ Aviso Legal y Descargo de Responsabilidad

Esta guía es un proyecto **comunitario y no oficial**. No está afiliada, endosada ni mantenida por **Ascension.gg**, **Blizzard Entertainment** o **WineHQ**.

- **Uso bajo tu propia responsabilidad:** La instalación de software de terceros y la modificación de prefijos de Wine conllevan riesgos. El autor no se hace responsable de daños a tu sistema, pérdida de datos o problemas con tu cuenta de juego.
- **Sin garantía:** Esta guía funciona en el momento de su publicación (Agosto 2026) en Linux Mint. Actualizaciones futuras del juego, de Wine o de tu distribución podrían romper la funcionalidad.
- **Propiedad Intelectual:** World of Warcraft y sus activos son propiedad de Blizzard Entertainment. Ascension es un proyecto privado independiente. Esta guía solo facilita la ejecución del cliente oficial en Linux.

*Si algo sale mal, ¡toca leer los logs y aprender! 🐧🛠️*   
