set -x

# First, update apt ------------------------------
sudo add-apt-repository universe
sudo apt update

# Apt installs -----------------------------------
sudo apt install \
  autoconf \
  build-essential \
  chrome-gnome-shell \
  curl \
  diodon \
  docker-compose \
  git \
  gnome-tweak-tool \
  grub-customizer \
  gzip \
  inkscape \
  libtool \
  neofetch \
  pkg-config \
  postgresql \
  python3 \
  python3-apt \
  python3-dev \
  python3-distutils \
  steam \
  vim \
  wget \
  zenity \
  zsh \
  
# Gnome Shell Extensions to install:
# - https://extensions.gnome.org/extension/517/caffeine/
# - https://extensions.gnome.org/extension/906/sound-output-device-chooser/

# Oh My ZSH --------------------------------------
set +x
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
set -x

# Snap installs ----------------------------------
sudo snap install \
  discord \
  gimp \
  krita \
  opera \
  spotify \
  vlc \
  
sudo snap install --classic \
  slack \
  sublime-text \
  
# Manual installs --------------------------------
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.zshrc
nvm install v16.13.2

# Stremio
export STREMIO_VERSION="4.4.137"
export STREMIO_DEB="stremio_$STREMIO_VERSION-1_amd64.deb"
wget https://dl.strem.io/shell-linux/v$STREMIO_VERSION/$STREMIO_DEB

# Minecraft
export MINECRAFT_DEB="Minecraft.deb"
wget https://launcher.mojang.com/download/$MINECRAFT_DEB

# Zoom
export ZOOM_DEB="zoom_amd64.deb"
wget https://zoom.us/client/latest/$ZOOM_DEB

sudo apt install \
  ./$STREMIO_DEB \
  ./$MINECRAFT_DEB \
  ./$ZOOM_DEB \
  
rm -f \
  $STREMIO_DEB \
  $MINECRAFT_DEB \
  $ZOOM_DEB \

# Jetbrains Toolbox
export JETBRAINS_TOOLBOX_VERSION="1.21.9712"
export JETBRAINS_TOOLBOX="jetbrains-toolbox-$JETBRAINS_TOOLBOX_VERSION"

wget https://download.jetbrains.com/toolbox/$JETBRAINS_TOOLBOX.tar.gz
tar -xvzf $JETBRAINS_TOOLBOX.tar.gz
./$JETBRAINS_TOOLBOX/jetbrains-toolbox
rm -f $JETBRAINS_TOOLBOX.tar.gz
rm -r $JETBRAINS_TOOLBOX

set +x
