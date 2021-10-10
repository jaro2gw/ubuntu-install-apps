# First, update apt ------------------------------
sudo apt update

# Apt installs -----------------------------------
sudo apt install zsh git curl wget

# Oh My ZSH --------------------------------------
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Snap installs ----------------------------------
sudo snap install vlc discord

# Manual installs --------------------------------

# Brave Web Browser, copied from https://brave.com/linux/#linux
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# Streamio
# TODO replace hardcoded version with environment variable
wget https://dl.strem.io/shell-linux/v4.4.137/stremio_4.4.137-1_amd64.deb
# will most likely fail, this is ok
set +e
sudo dpkg -i stremio_4.4.137-1_amd64.deb
set -e
# here we fix the dependencies
sudo apt -f install
rm -f stremio_4.4.137-1_amd64.deb

# Jetbrains Toolbox
# TODO replace hardcoded version with environment variable
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.21.9712.tar.gz
tar -xvzf jetbrains-toolbox-1.21.9712.tar.gz
rm -f jetbrains-toolbox-1.21.9712.tar.gz
./jetbrains-toolbox-1.21.9712/jetbrains-toolbox