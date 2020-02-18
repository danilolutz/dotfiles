# dotfiles

## How to install

```bash
git clone --bare git@github.com:danilolutz/dotfiles.git $HOME/.dotfiles
alias dfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dfiles checkout master
```
