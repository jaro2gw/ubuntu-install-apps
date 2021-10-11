# First, update apt ------------------------------
sudo apt update

# Apt installs -----------------------------------
sudo apt install zsh git curl wget libfprint-2-tod1

# Oh My ZSH --------------------------------------
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Snap installs ----------------------------------
sudo snap install vlc discord opera
sudo snap install slack --classic

# Manual installs --------------------------------

# Streamio
# TODO replace hardcoded version with environment variable
export STREMIO_VERSION="4.4.137"
export STREMIO_DEB="stremio_$STREMIO_VERSION-1_amd64.deb"
wget https://dl.strem.io/shell-linux/v$STREMIO_VERSION/$STREMIO_DEB
# will most likely fail, this is ok
set +e
sudo dpkg -i $STREMIO_DEB
set -e
# here we fix the dependencies
sudo apt -f install
rm -f $STREMIO_DEB

# Jetbrains Toolbox
export JETBRAINS_TOOLBOX_VERSION="1.21.9712"
export JETBRAINS_TOOLBOX="jetbrains-toolbox-$JETBRAINS_TOOLBOX_VERSION"

wget https://download.jetbrains.com/toolbox/$JETBRAINS_TOOLBOX.tar.gz
tar -xvzf $JETBRAINS_TOOLBOX.tar.gz
./$JETBRAINS_TOOLBOX/jetbrains-toolbox
rm -f $JETBRAINS_TOOLBOX.tar.gz
rm -r $JETBRAINS_TOOLBOX

# Fingerprint reader
export GOODIX_DEB="libfprint-2-tod1-goodix_0.0.6-0ubuntu1~somerville1_amd64.deb"

wget http://dell.archive.canonical.com/updates/pool/public/libf/libfprint-2-tod1-goodix/$GOODIX_DEB
# will most likely fail, this is ok
set +e
sudo dpkg -i $GOODIX_DEB
set -e
# here we fix the dependencies
sudo apt -f install
sudo pam-auth-update
rm -f $GOODIX_DEB
