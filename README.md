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
