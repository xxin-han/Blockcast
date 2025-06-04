#!/bin/bash
set -e

# Warna
ORANGE='\033[38;5;208m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Fungsi banner center text (optional)
center_text() {
  term_width=$(tput cols)
  text="$1"
  text_len=${#text}
  padding=$(( (term_width - text_len) / 2 ))
  printf "%*s%s\n" $padding "" "$text"
}

# Fungsi logging
LOGFILE="script.log"
echo_log() {
    echo -e "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOGFILE"
}

# Clear layar
clear

# Banner art
echo -e "${ORANGE}"
echo "                                                                                                         "
echo "                    XXXXXXX       XXXXXXX  iiii                         999999999          888888888     "
echo "                    X:::::X       X:::::X i::::i                      99:::::::::99      88:::::::::88   "
echo "                    X:::::X       X:::::X  iiii                     99:::::::::::::99  88:::::::::::::88 "
echo "                    X::::::X     X::::::X                          9::::::99999::::::98::::::88888::::::8"
echo "xxxxxxx      xxxxxxxXXX:::::X   X:::::XXXiiiiiii nnnn  nnnnnnnn    9:::::9     9:::::98:::::8     8:::::8"
echo " x:::::x    x:::::x    X:::::X X:::::X   i:::::i n:::nn::::::::nn  9:::::9     9:::::98:::::8     8:::::8"
echo "  x:::::x  x:::::x      X:::::X:::::X     i::::i n::::::::::::::nn  9:::::99999::::::9 8:::::88888:::::8 "
echo "   x:::::xx:::::x        X:::::::::X      i::::i nn:::::::::::::::n  99::::::::::::::9  8:::::::::::::8  "
echo "    x::::::::::x         X:::::::::X      i::::i   n:::::nnnn:::::n    99999::::::::9  8:::::88888:::::8 "
echo "     x::::::::x         X:::::X:::::X     i::::i   n::::n    n::::n         9::::::9  8:::::8     8:::::8"
echo "     x::::::::x        X:::::X X:::::X    i::::i   n::::n    n::::n        9::::::9   8:::::8     8:::::8"
echo "    x::::::::::x    XXX:::::X   X:::::XXX i::::i   n::::n    n::::n       9::::::9    8:::::8     8:::::8"
echo "   x:::::xx:::::x   X::::::X     X::::::Xi::::::i  n::::n    n::::n      9::::::9     8::::::88888::::::8"
echo "  x:::::x  x:::::x  X:::::X       X:::::Xi::::::i  n::::n    n::::n     9::::::9       88:::::::::::::88 "
echo " x:::::x    x:::::x X:::::X       X:::::Xi::::::i  n::::n    n::::n    9::::::9          88:::::::::88   "
echo "xxxxxxx      xxxxxxxXXXXXXX       XXXXXXXiiiiiiii  nnnnnn    nnnnnn   99999999             888888888     "
echo "                                                                                                         "
echo -e "${NC}"

echo -e "${YELLOW}🚀 Welcome to the xXin98 Setup Script!${NC}"
echo -e "${CYAN}🐦 Follow us on Twitter: @xXin98 ${NC}"

sleep 5

echo_log "🕒 Script started at $(date '+%H:%M:%S')..."

echo_log "📦 Updating and upgrading the system..."
sudo apt update && sudo apt upgrade -y

echo_log "🌍 Installing Curl..."
sudo apt install -y curl

echo_log "🌍 Setting up Node.js repository..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -

echo_log "🛠️ Installing Node.js..."
sudo apt install -y nodejs

echo_log "⚙️ Installing software-properties-common..."
sudo apt install software-properties-common -y

echo_log "🐍 Adding deadsnakes repository for Python..."
sudo add-apt-repository ppa:deadsnakes/ppa -y

echo_log "🔄 Updating package list after adding repository..."
sudo apt update

echo_log "🐍 Installing Python 3.12 and venv..."
sudo apt install -y python3.12 python3.12-venv

echo_log "🔧 Setting Python 3.12 as default..."
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.12 1
sudo update-alternatives --set python /usr/bin/python3.12

echo_log "🐳 Installing dependencies for Docker..."
sudo apt install -y apt-transport-https ca-certificates software-properties-common

echo_log "🔑 Adding Docker GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo_log "📥 Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo_log "🔄 Updating package list after adding Docker repository..."
sudo apt update

echo_log "🐳 Installing Docker..."
sudo apt install -y docker-ce docker-ce-cli containerd.io

echo_log "🐳 Installing Docker Compose..."
sudo apt install -y docker-compose

echo_log "✅ Verifying Docker installation..."
docker --version

echo_log "✅ Verifying Docker Compose installation..."
docker-compose --version

echo_log "🌿 Installing Git..."
sudo apt install -y git

echo_log "✅ Verifying Git installation..."
git --version

echo_log "🖥️ Installing Screen..."
sudo apt install -y screen

echo_log "✅ Verifying Screen installation..."
screen --version

echo_log "🖥️ Installing Tmux..."
sudo apt install -y tmux

echo_log "✅ Verifying Tmux installation..."
tmux -V

echo_log "🚀 Installing Go..."
sudo apt install -y golang-go

echo_log "✅ Verifying Go installation..."
go version

echo_log "🔗 Installing RUST..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

echo_log "✅ Verifying Rust installation..."
rustc --version

echo_log "Installing risczero (rzup)..."
curl -L https://risczero.com/install | bash
source "$HOME/.cargo/env"

echo_log "✅ Verifying RZup installation..."
rzup --version

echo_log "✅ Installing Seq..."
sudo apt install -y coreutils
seq --version

echo_log "✅ Installing Jq..."
sudo apt install -y jq

echo_log "✅ Installing Bc..."
sudo apt install -y bc

echo_log "✅ Installing Htop..."
sudo apt install -y htop

echo_log "✅ Installing PV..."
sudo apt install -y pv

echo_log "All processes completed at $(date '+%H:%M:%S')! System is ready to use! 🚀"
