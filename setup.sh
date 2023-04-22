if [ $(uname) != "Darwin" ]; then
    echo "Not macOS!"
    exit 1
fi

if [ -e /usr/local/bin/brew ]; then
    echo "Homebrew is already installed"
else
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" # https://brew.sh/index_ja
fi

echo "Installing Applications..."

while read line
do
    brew install $line
done < ./brew/brew

while read line
do
    echo $line
done < ./brew/brew_cask

ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
