## [Install ZSH](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

```sh
sudo apt-get install zsh
```

### Change the default shell

```sh
chsh -s $(which zsh)
```

If `chsh` requires a password

```sh
sudo chsh -s $(which zsh) $(whoami)
```

## [Install Oh-My-ZSH](https://github.com/ohmyzsh/ohmyzsh/wiki)

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Configure Oh-My-ZSH

#### My favorite theme

```sh
ZSH_THEME="nicoulaj"
```

#### Plugins

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)
    ```sh
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```
- [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search?tab=readme-ov-file)
    ```sh
    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
- [zsh-vi-mode](https://github.com/jeffreytse/zsh-vi-mode?tab=readme-ov-file#as-an-oh-my-zsh-custom-plugin)
    ```sh
    git clone https://github.com/jeffreytse/zsh-vi-mode \
    $ZSH_CUSTOM/plugins/zsh-vi-mode
    ```
- [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting?tab=readme-ov-file#oh-my-zsh)
    ```sh
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
    ```
    
Append the following lines to `plugins=(git)` in `~/.zshrc`

```sh
plugins+=(zsh-autosuggestions)
plugins+=(fast-syntax-highlighting)
plugins+=(zsh-history-substring-search)
plugins+=(zsh-vi-mode)
 
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
export ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
```
    