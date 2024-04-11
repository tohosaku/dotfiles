rm -f ~/.bash_profile
ln -s ~/.dotfiles/bash_profile ~/.bash_profile

rm -f ~/.bashrc
ln -s ~/.dotfiles/bashrc ~/.bashrc

rm -f ~/.vimrc
ln -s ~/.dotfiles/vimrc ~/.vimrc

rm -f ~/.tmux.conf
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

rm -f ~/.gitmux.conf
ln -s ~/.dotfiles/gitmux.conf ~/.gitmux.conf

rm -rf ~/.vim
ln -s ~/.dotfiles/vim ~/.vim

rm -f ~/.tigrc
ln -s ~/.dotfiles/tigrc ~/.tigrc

rm -rf ~/.git_template
ln -s ~/.dotfiles/git_template ~/.git_template

rm -f ~/.gitconfig
ln -s ~/.dotfiles/gitconfig ~/.gitconfig

rm -rf ~/.bundle
ln -s ~/.dotfiles/bundle ~/.bundle
