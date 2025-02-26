## Install ZSH

https://gist.github.com/ZhaofengWu/f345652e994e3b68c309352a7610460f


Run the following script:

```bash
#!/bin/bash

set -e

# OPTIONAL: zsh will not install without ncurses. IF your machine doesn't have ncurses, you need to install it first.
export CXXFLAGS=" -fPIC" CFLAGS=" -fPIC" CPPFLAGS="-I${HOME}/include" LDFLAGS="-L${HOME}/lib"
wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.2.tar.gz
tar -xzvf ncurses-6.2.tar.gz
cd ncurses-6.2
./configure --prefix=$HOME --enable-shared
make
make install
cd .. && rm ncurses-6.2.tar.gz && rm -r ncurses-6.2

# install zsh itself
wget -O zsh.tar.xz https://sourceforge.net/projects/zsh/files/latest/download
mkdir zsh && unxz zsh.tar.xz && tar -xvf zsh.tar -C zsh --strip-components 1
cd zsh
./configure --prefix=$HOME
make
make install
cd .. && rm zsh.tar && rm -r zsh
echo -e "export SHELL=~/bin/zsh\nexec ~/bin/zsh -l" >> ~/.bash_profile # or chsh

# OPTIONAL: install oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

Set in the `.bashrc`

```bash
echo "exec zsh" >> ~/.bashrc
```