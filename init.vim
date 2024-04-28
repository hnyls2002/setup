" Local configuration for Neovim

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
let g:copilot_filetypes = {
	\'markdown': v:true,
	\}


if exists('g:vscode')
	" disable copilot when nvim is backend of VSCode
	let g:copilot_enabled = 0
else
    " ordinary Neovim
endif