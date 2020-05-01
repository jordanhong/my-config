# My-config

This is the repository where I store a copy of my own configurations, mostly Vim and Unix based stuff.

## My Philosopy
My standards for a developer environment is:

1. Clean.
2. Light-weight, easy to install and re-install.
3. Configurable to my own liking.

Therefore, if something is Vim-built-in and relatively easy to pick up, I will use the vim version instead of external plug-ins. I try to keep my set-up as clean as possible. 

## My Setup

1. Installer: Home brew: <https://brew.sh/>
2. Vim version:  
    Instead of Mac OS X built-in vim from terminal, I installed MacVim (mvim) using homebrew. This is more maintained and I have the freedom of adding supports (e.g. python3, for snippets.)
    Procedure:
    1. Download macvim from homebrew: ``brew install mvim``
    2. Point vim command to macvim:`` alias vim='/path/to/MacVim.app/Contents/MacOS/Vim'``


3. Install BasicTex (light-weighted MacTex): ``brew cask install basictex``
4. Install GRIP (Github flavoured Markdown; GitHub Readme Instant Preview): ``homebrew install grip``
5. Configure VIM plugins(in `~/.vimrc`):
    1. Install plugin manager:
        ```
        if empty(glob('~/.vim/autoload/plug.vim'))
          silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
          autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif
        ```
        Quick start: ``PlugStatus`` shows current plugins; `PlugInstall` installs the plugins as per specified in `.vimrc`; `Plugclean` un-installs plugins deleted in `.vimrc`
    2. Adding plug-ins go in between: ``call plug#begin('~/.vim/plugged')`` and ``call plug#end()``
    3. Install Latex-Suite (aka. vim-latex):``Plug 'vim-latex/vim-latex'``
        Configure Tex compiler and open using Skim pdf viewer.
        ```        
        let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=batchmode $*'
        let g:Tex_DefaultTargetFormat = 'pdf'
        let g:Tex_ViewRule_pdf = 'open -a Skim'
        ```
        Quick start: to compile- ``\ll``; to open up pdf- ``\lv``.
    
    4. Install Snippets: ``Plug 'SirVer/ultisnips'``
       Configure Snippets by setting tabs as trigger:
       ```
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<c-b>"
        let g:UltiSnipsJumpBackwardTrigger="<c-z>"
       ```
        Edit Snippet bank by opening up vertical split:
        ```
        let g:UltiSnipsEditSplit="vertical"
        ```
        Quick start: to configure specific snippets, launch ``:UltiSnipsEdit`` when the relavent file (e.g. `.py`, `.tex`) is opened.

    5. Install vim-markdown preview: 
        ```
        Plug 'JamshedVesuna/vim-markdown-preview'
        let vim_markdown_preview_github=1
        ```
        Quick Start: <C-p> to launch Safari to show preview.
 
 
 
