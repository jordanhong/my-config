" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

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
" Remap 
nmap <c-f> :NERDTreeToggle<CR>


" vim-latex plugin
Plug 'vim-latex/vim-latex'
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=batchmode $*'
let g:Tex_DefaultTargetFormat = 'pdf'
"-----configure pdf application---------------------------
"Mac uses Skim, Ubuntu uses Zathura
" let g:Tex_ViewRule_pdf = 'open -a Skim'
let g:Tex_ViewRule_pdf = 'zathura'
" Required for vim to recognized latex files
let g:tex_flavor = 'latex' 
let g:Tex_Menus = 1


"UltiSnip Engine
Plug 'SirVer/ultisnips'

" Trigger configuration. 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" configure :UltiSnipsEdit to split window.
let g:UltiSnipsEditSplit="vertical"

Plug 'JamshedVesuna/vim-markdown-preview'
let vim_markdown_preview_github=1

"Style
Plug 'morhetz/gruvbox'
let g:gruvbox_italic=1
autocmd vimenter * colorscheme gruvbox
set background=dark    " Setting dark mode
set termguicolors


call plug#end()

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


" Enable folding by indent
:set foldmethod=indent


"Toggle number
nmap <c-l> :set invnumber<CR>
