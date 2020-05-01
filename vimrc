
set nocompatible              " be iMproved, required

"Install 
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')

" Nerd tree Plug in for filemanager
Plug 'preservim/nerdtree'

" vim-latex plugin
Plug 'vim-latex/vim-latex'

" CoC Use release branch
Plug 'neoclide/coc.nvim', {'branch': 'release'}


"Trying Snippets
"
" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



call plug#end()

let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=batchmode $*'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'open -a Skim'

" -------------------------------------------------------------
"  Non Plug stuff
"
"
" Enable Syntax highlight
:syntax on

" Setup tabs spaces
:set tabstop=4
:set shiftwidth=4
:set expandtab



