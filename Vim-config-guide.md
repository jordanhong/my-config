# Vim Configuration Guide

For simplicity: just place the `.vimrc` in the `~/`.

## Configuring .vimrc
One can configure the relevant vim plugins by specifying in the `~/.vimrc` file. This is extremely helpful as one can just source this .vimrc file to customize the VIM text editor. Here I will go through the less obvious configuration commands. 


### Vim plugin manager

I use the plug-in manager vim-plug.  
1. The installation can be done entirely in .vimrc with the following code:

        
        if empty(glob('~/.vim/autoload/plug.vim'))
          silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
          autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif


2. Quick start: ``:PlugStatus`` shows current plugins; `:PlugInstall` installs the plugins as per specified in `.vimrc`; `:Plugclean` un-installs plugins deleted in `.vimrc`
3. Adding plug-ins go in between: ``call plug#begin('~/.vim/plugged')`` and ``call plug#end()``


### My Plugins

1. Nerd Tree (Plug 'preservim/nerdtree')\
   Quick start: I have re-mapped the toggle command (`:NerdTreeToggle` to `ctrl-f`. This toggles the menu on the side displaying the file structures of the current directory.


2. Latex-suite for Vim (`vim-latex/vim-latex`).\ 
    Quick start: 
    - to compile- ``\ll``; to open up pdf- ``\lv``.
    - help function: `:h latex-suite.txt`

    **Important**: 
        For OS, I use the Skim Pdf reader: ``let g:Tex_ViewRule_pdf = 'open -a Skim'``
        For Linux, I use Zathura: ``let g:Tex_ViewRule_pdf = 'zathura'``





2. Ultisnip- Snippet Managers (``'SirVer/ultisnips'``)\
    Quick start: to configure specific snippets, launch ``:UltiSnipsEdit`` when the relavent file (e.g. `.py`, `.tex`) is opened.

3. Vim-markdown preview(Plug 'JamshedVesuna/vim-markdown-preview')\
    Prerequisites: install grip (Github flavoured Markdown)<br/> 
    Quick Start: <C-p> to launch markdown preview.
 
 
### Vim Quick Notes:

#### Vim Patterns

1. The `Set` pattern: using `:set` to control specfic functions:<br/>
    **Formula**: <br/>
    1. `set foo`: "enable the option (foo)
    2. `set nofoo`: "disable it
    3. `set foo!`: "toggle the option
    4. `set foo?`:"get option's current value 
    
    **Examples**
    1. Display line number: `:set number`; `:set nonumber` to turn off.
    
    
### Vim Commands

1. Enable spell check: `:setlocal spell spelllang=en_us`; to disable: `:set nospell`
2. Find a file: `:find myfile.extension`
3. Leave current session: `ctrl-z`; re-open at terminal: `fg`
4. Re-use last visual select: `gv`
6. Copy to system clip board: `"*y` 
7. Toggle case of character under cursor pr all visually-selected characters: `~` 
8. `ctrl-O` to jump back to the previous (older) location. `ctrl-I` (same as Tab) to jump forward to the next (newer) location.




