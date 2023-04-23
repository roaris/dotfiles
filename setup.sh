if [ $(uname) != "Darwin" ]; then
    echo "Not macOS!"
    exit 1
fi

zsh ./macos/setup.sh
zsh ./zsh/setup.sh
zsh ./vscode/setup.sh
