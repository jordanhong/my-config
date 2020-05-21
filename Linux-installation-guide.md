# Linux Installation Guide

I use a Lenovo B50-70 Notebook running Ubuntu 20.04 LTS.


## Configuring bash terminal

### Installations
1. Update the package manager: `sudo apt-get update`
2. Install VIM: ``sudo apt-get install vim``. 
3. Install Latex: ``sudo apt-get install texlive-full``
4. Install GRIP (Github flavoured Markdown; GitHub Readme Instant Preview): ``sudo apt-get install grip``

### Configure profile

The [.bashrc](.bashrc) file contains default configurations. I made a few changes:

1. Changed display colour for username <br\>
    1. Uncomment ``force_color_prompt=yes``
    2. Changed colour to brown: ``[\033[0;33m\]\u@\h\``
2. Set alias ``open`` in lieu of ``xdg-open``. 


## Configure Vim

For Vim (powerful text editor), see [Vim-config-guide](Vim-config-guide.md)
