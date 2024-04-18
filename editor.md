## Configure Vim

Add [this custom configuration](.vimrc) into `~/.vimrc`

## Install NeoVim
    
```sh
sudo apt-get install neovim
```

### Configure NeoVim Using `.vimrc`

```sh
mkdir -p ~/.config/nvim
echo -e "set runtimepath^=~/.vim runtimepath+=~/.vim/after\nlet &packpath = &runtimepath\nsource ~/.vimrc" > ~/.config/nvim/init.vim
```