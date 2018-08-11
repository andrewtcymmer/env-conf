# env-conf
Just a little repository to contain my development environment configuration.  

# Installing #
Clone the repository anywhere you like using the following command:  

    git clone --recursive https://github.com/andrewtcymmer/env-conf.git

On \*nix systems, run:

    ./sync.zsh
    
Any existing files are renamed with the `.bak` extension. It is up to you to merge or remove these as you see fit.  

# Post-install notes #
This script is not perfect. There are some known post-installation issues to address:

 - `.ssh/config` does not work as a symlink. To get around it, `# mv ~/.ssh/config.bak ~/.ssh/config`

# Testing #
This project uses a home-rolled zsh test suite (credit given to a poster on stack overflow for the general idea in the source code). To run the tests:  

    ./test.zsh
