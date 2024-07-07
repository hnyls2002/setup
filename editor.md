## Configure Vim

Add [this custom configuration](.vimrc) into `~/.vimrc`

## Install NeoVim
    
```sh
sudo apt-get install neovim
```

### Configure NeoVim Using `.vimrc`

[`init.vim`](init.vim) for local neovim and vscode-neovim backend.


For server end neovim:

```sh
mkdir -p ~/.config/nvim
echo -e "set runtimepath^=~/.vim runtimepath+=~/.vim/after\nlet &packpath = &runtimepath\nsource ~/.vimrc" > ~/.config/nvim/init.vim
```

### Install copilot for neovim([install Nodejs first](./nodejs.md))


Ref: https://github.com/github/copilot.vim

```sh
git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim
```

Then in neovim:

```
:Copilot setup
```