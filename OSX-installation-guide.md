# OS X Installation Guide

I use a Macbook Air 2020 running macOS Catalina 10.15.3.


## Configuring Zsh terminal

The newer versions of macOS ships with zsh instead of bash terminal. I have not noted any significant changes, except that profiles are stored in **.zshrc** instead of **.bashrc**

1. Install the Package Manager: **Homebrew** from <https://brew.sh/>. Follow the instructions on the main page (paste installation command in terminal)
2. Install VIM: ``brew install mvim``. 
     
    Instead of Mac OS X built-in vim from terminal, I installed MacVim (mvim) using homebrew. This is more maintained and I have the freedom of adding supports (e.g. python3, for snippets.) You  may or may not have to link the command ``vi`` and ``vim`` to the MacVim terminal command.
3. Install Latex
     - BasicTex (light-weighted MacTex): ``brew install basictex --cask``
     - MacTex: ``brew install mactex-no-gui --cask``



## Configure Vim

For Vim (powerful text editor), see [Vim-config-guide](Vim-config-guide.md)
