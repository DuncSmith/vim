Install system packages

`sudo apt-get install ack-grep exuberant-ctags`

Then to initialize and setup symlinks

`rake`

Install Vim Plugins, run vim

`:PlugInstall`

Finally don't forget to generate helptags where needed. e.g. 

`vim -c "helptags vim-fugitive/dpc" -c q` 
