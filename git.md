## Git Setup

### Generate SSH key

```sh
ssh-keygen
cat ~/.ssh/id_rsa.pub
```

### Add SSH key to GitHub

[**:link: CLICK HERE TO ADD :rocket:**](https://github.com/settings/ssh/new)

Test the SSH connection

```sh
ssh -T git@github.com
```


### Configure Git

```sh
git config --global user.name "hnyls2002"
git config --global user.email "hnyls2002@gmail.com"
git config --global core.editor "nvim"
```

View the configuration

```sh
git config --list
```


