# First, update apt
sudo apt update

# Apt installs: ZSH, Git, Curl
sudo apt install zsh git curl

# Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Snap installs: VLC, Discord
sudo snap install vlc discord

# Manual installs

# Brave Web Browser, copied from https://brave.com/linux/#linux
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# Streamio (might have to select an updated version)
curl https://dl.strem.io/shell-linux/v4.4.137/stremio_4.4.137-1_amd64.deb --output stremio.deb
# will most likely fail, this is ok
set +e
sudo dpkg -i stremio.deb
set -e
# here we fix the dependencies
sudo apt -f install
rm -f stremio.deb
