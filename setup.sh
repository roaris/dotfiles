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
    brew install "$line"
done < ./brew/brew

while read line
do
    brew install --cask "$line"
done < ./brew/brew_cask

ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc

ln -fs ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

echo "Installing VSCode Extensions..."

if [ -e /usr/local/bin/code ]; then
    while read line
    do
        code --install-extension $line
    done < ./vscode/extensions
else
    echo "Install the code command from the command palette to add your extensions."
fi

ln -fs ~/dotfiles/iterm2/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
