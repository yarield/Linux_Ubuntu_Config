set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Dar permisos de ejecución a todos los scripts del proyecto
chmod -R u+x "$SCRIPT_DIR"

green()  { printf '\033[1;32m%s\033[0m\n' "$1"; }
yellow() { printf '\033[1;33m%s\033[0m\n' "$1"; }
red()    { printf '\033[1;31m%s\033[0m\n' "$1"; }

# ──────────────────────────────────────────────
# 1. Packages
# ──────────────────────────────────────────────
green green ">>> Instalando paquetes y aplicaciones"
"$SCRIPT_DIR/packages/install-packages.sh"
green "    Paquetes y aplicaciones instalados"

# ──────────────────────────────────────────────
# 2. Telemetría
# ──────────────────────────────────────────────

# green ">>> Desactivando telemetría"
# "$SCRIPT_DIR/telemetry/disable-telemetry.sh"
# green "    Telemetría desactivada"


# ──────────────────────────────────────────────
green ""
green "Configuración restaurada. Abre una nueva terminal para aplicar los cambios de bash."