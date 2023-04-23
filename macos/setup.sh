if [ -e /usr/local/bin/brew ]; then
    echo "Homebrew is already installed"
else
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" # https://brew.sh/index_ja
fi

echo "Installing Applications..."

brew bundle --file './macos/Brewfile'
