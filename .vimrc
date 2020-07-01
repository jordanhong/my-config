" My Vim Configuration 
""""""""""""""
"  Vim "
""""""""""""""

set nocompatible              " be iMproved, required
filetype plugin on            " load plugin according to filetype

""""""""""""""
"  Plugins "
""""""""""""""
"" Vim-plug Installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" Install Plugins 
call plug#begin('~/.vim/plugged')

""" NerdTree file manager
Plug 'preservim/nerdtree'
""" Vim-latex
Plug 'vim-latex/vim-latex'
""" UltiSnip Engine
Plug 'SirVer/ultisnips'
""" Markdown Preview
Plug 'JamshedVesuna/vim-markdown-preview'
""" Verilog Plugin
"Plug 'vhda/verilog_systemverilog.vim'
""" Gruvbox
"Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox'

""" Gruvbox Material
Plug 'jordanhong/gruvbox-material'
""" Wenyan Support
Plug 'voldikss/vim-wenyan'

""" Ctrl-p (fuzzy search)
Plug 'ctrlpvim/ctrlp.vim'

""" Vim Airline
Plug 'vim-airline/vim-airline'


call plug#end()

"" Plug-in Settings

""" NerdTree
nmap <c-f> :NERDTreeToggle<CR>

""" Vim-latex
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=batchmode $*'
let g:Tex_DefaultTargetFormat = 'pdf'
" Mac uses Skim, Ubuntu uses Zathura
" let g:Tex_ViewRule_pdf = 'open -a Skim' "for Mac
let g:Tex_ViewRule_pdf = 'zathura'
let g:tex_flavor = 'latex' 
let g:Tex_Menus = 1
let g:Tex_SmartKeyQuote=0

""" Ulti-snips
" Trigger configuration. 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical" "Split ultisnipedit veritcally

""" Markdown Preview
let g:vim_markdown_preview_github=1

""" Gruvbox
"let g:gruvbox_italic=1
"autocmd vimenter * colorscheme gruvbox "autoload gruvbox scheme
"set background=dark " Setting dark mode
"let g:gruvbox_guisp_fallback='fg' "highlight search (bg) or use different font
"
""" Gruvbox Material
if has('termguicolors')
  set termguicolors
endif

" For dark version.
set background=dark
colorscheme gruvbox-material

let g:gruvbox_material_enable_bold = 1
" Use the color palette of the original gruvbox.
"let g:gruvbox_material_palette = 'mix'

""""""""""""""
"  General Settings  "
"""""""""""""" 
"" Status Bar
""" Show command
"Show what command is being typed
:set showcmd

"" Syntax
""" Indentation
"Set smart indent
:set smartindent
:set autoindent

""" Syntax Highlight
:syntax on

""" Configure tab spaces
:set tabstop=4
:set shiftwidth=4
:set expandtab

""" Writing
" Enable latex and markdown files
autocmd FileType tex,markdown set spell 
" Set word wrapping (not working yet): prevent words from splitting off a line
:set wrap

"" File navigation
""" Folding 
" Enable fold by syntax for C
autocmd FileType c set foldmethod=syntax
" Enable fold by indent
":set foldmethod=indent

""" Searching
" Set highlight search
:set hls
" Clears highlight of search when Enter.
" remap enter after search to clear highlight, then clears command.
nnoremap <silent> <cr> :noh<CR> 

""" Line number
"Toggle number at ctrl-l
nmap <c-l> :set invnumber<CR>
""" Tags
map <C-\> :bel vert winc ]<CR>

" HOW TO USE TAGS:
    "Ctrl+] - go to definition
    "Ctrl+T - Jump back from the definition.
    "Ctrl+O - Jump to last place; Ctrl+I to reverse
    "Ctrl+W Ctrl+] - Open the definition in a horizontal split
    "Ctrl+\ - Open the definition in a vertical to the right (self-defined)

    "Ctrl+W } : Opens a preview window with the location of the tag definition. The cursor does not change its position, so tag stack is not updated.
    "Ctrl+W Z : Close preview window.
    "Ctrl+W V : Split current window in two, keeping the cursor position.

"So, you can use <c-w>}if you want to quickly check the tag declaration, followed by <c-w>z to close it. But if you want to navigate, then you can simply use <c-w>v to create a split followed by the standard <c-] to navigate in the tags. When you're done with it, you can simply close the window with <c-w>c.



""""""""""""""""""""""""
"  Vimrc Organization  "
""""""""""""""""""""""""
"" Autofolding .vimrc
" see http://vimcasts.org/episodes/writing-a-custom-fold-expression/
""" defines a foldlevel for each line of code
function! VimFolds(lnum)
  let s:thisline = getline(a:lnum)
  if match(s:thisline, '^"" ') >= 0
    return '>2'
  endif
  if match(s:thisline, '^""" ') >= 0
    return '>3'
  endif
  let s:two_following_lines = 0
  if line(a:lnum) + 2 <= line('$')
    let s:line_1_after = getline(a:lnum+1)
    let s:line_2_after = getline(a:lnum+2)
    let s:two_following_lines = 1
  endif
  if !s:two_following_lines
      return '='
    endif
  else
    if (match(s:thisline, '^"""""') >= 0) &&
       \ (match(s:line_1_after, '^"  ') >= 0) &&
       \ (match(s:line_2_after, '^""""') >= 0)
      return '>1'
    else
      return '='
    endif
  endif
endfunction

""" defines a foldtext
function! VimFoldText()
  " handle special case of normal comment first
  let s:info = '('.string(v:foldend-v:foldstart).' l)'
  if v:foldlevel == 1
    let s:line = ' ◇ '.getline(v:foldstart+1)[3:-2]
  elseif v:foldlevel == 2
    let s:line = '   ●  '.getline(v:foldstart)[3:]
  elseif v:foldlevel == 3
    let s:line = '     ▪ '.getline(v:foldstart)[4:]
  endif
  if strwidth(s:line) > 80 - len(s:info) - 3
    return s:line[:79-len(s:info)-3+len(s:line)-strwidth(s:line)].'...'.s:info
  else
    return s:line.repeat(' ', 80 - strwidth(s:line) - len(s:info)).s:info
  endif
endfunction

""" set foldsettings automatically for vim files
augroup fold_vimrc
  autocmd!
  autocmd FileType vim
                   \ setlocal foldmethod=expr |
                   \ setlocal foldexpr=VimFolds(v:lnum) |
                   \ setlocal foldtext=VimFoldText() |
     "              \ set foldcolumn=2 foldminlines=2
augroup END
