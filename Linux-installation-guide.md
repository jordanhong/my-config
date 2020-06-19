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

1. Changed display colour for username 
    1. Uncomment ``force_color_prompt=yes``
    2. Changed colour to brown: ``[\033[0;33m\]\u@\h\``
2. Set alias ``open`` in lieu of ``xdg-open``. 

### Aesthetics
1. To improve readability and aesthetics, I opted for the [Gruvbox Dark Theme for GNOME Terminals](https://github.com/metalelf0/gnome-terminal-colors).<br/> 
    **Important**: the original source code specified [black bold font](https://github.com/metalelf0/gnome-terminal-colors/blob/master/colors/gruvbox-dark/bd_color) for gruvbox darkmode. <br/> 
Change the `#000000000000` to the foreground colour `#ebebdbdbb2b2` before installing so that bolded words are still readable. 
2. (Built-in theme) I previously used *black-on-white scheme* and chose the *DeJaVu Sans Monobook* font. These can be configured in Preferences. 



## Configure Vim

For Vim (powerful text editor), see [Vim-config-guide](Vim-config-guide.md)
