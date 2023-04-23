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
