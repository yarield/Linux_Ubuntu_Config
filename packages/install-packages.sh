set -ueo pipefail
 
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

green()  { printf '\033[1;32m%s\033[0m\n' "$1"; }
yellow() { printf '\033[1;33m%s\033[0m\n' "$1"; } 

require_sudo (){
    if ! sudo -v; then 
        yellow "    sudo es necesario para instalar paquetes"
        exit 1
    fi

    green "     sudo ya esta instalado en esta maquina"
}

ubuntu_codename() {
    . /etc/os-release
    printf '%s\n' "${UBUNTU_CODENAME:-${VERSION_CODENAME:-}}"
} 

nyancat() {
    sudo apt install nyancat
    green "     nyancat se ha instalado correctamente"
}

arch(){
    dpkg --print-architecture
}
main (){ 
    require_sudo
    ubuntu_codename
    arch
    nyancat
}

main "$@"