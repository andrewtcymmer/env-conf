# env-conf
Just a little repository to contain my development environment configuration.  

# Installing #
Clone the repository anywhere you like using the following command:  

    git clone --recursive https://github.com/andrewtcymmer/env-conf.git

On \*nix systems, run:

    ./sync.zsh
    
Any existing files are renamed with the `.bak` extension. It is up to you to merge or remove these as you see fit.  

# Post-install notes
The sync script updates your .ssh/config file with an entry for public GitHub. As a small but extra safety measure, the name of the key file must be replaced manually after syncing. 

# Testing #
This project uses a home-rolled zsh test suite (credit given to a poster on stack overflow for the general idea in the source code). To run the tests:  

    ./test.zsh

# Other packages to install
## Powerline fonts 
On Debian, I did not get immediate results by installing the `fonts-powerline` package through `apt-get`. Instead I did this:  

 - `git clone https://github.com/powerline/fonts.git ~/Projects/`
 - Follow instructions to run `install.sh` on their readme
 - Edit the `.xinitrc` to add a line to look in the `~/.local/share/fonts` folder
 - Update `.Xresources` `URxvt*regularFont` with a powerline font
 - Log out and back in (on i3, cmd+shift+e)
 - On mac, set the font in Terminal.app [see here](https://github.com/powerline/fonts/issues/185)

## RVM (Ruby Version Manager)
Get the GPG keys, then install via curl. See the general instructions at `https://rvm.io/rvm/install`. To obtain the keys from behind a firewall, specify port `80` as noted in the command below:  

    gpg --keyserver hkp://keys.gnupg.net:80 --recv-keys <paste keys>

Beware that RVM will blindly create dotfiles for bash and zsh. The zsh dotfiles in this repo already have the necessary changes made to them.  

## NVM (NodeJS Version Manager)
Get and run the installer script to install the `.nvm` directory to your home.  
The script will complain that it could not find a shell profile to add the `$NVM_HOME` dir to. Ignore this since it is already added to the .zshrc in this repo.

