Opinions are minimal and noted.

# Installs

*Configuration will be handled in the next section. Feel free to ignore complaints for tools regarding .bashrc or
.bash_profile, we'll handle those in the following section.*

1. Install any lingering updates. (Apple menu -> App Store -> Update)
2. Open Terminal (command+space, "terminal", enter) and begin installing a basic dev environment:
   1. General dev utils: ``xcode-select --install``
      - The command line option is all you need, it gives you build tools such as make, gcc, etc
      - The full xcode install is also not bad, as you can use the iOS Simulator that it comes with
        to test sites in mobile Safari. (Mobile Safari is different from Desktop Safari.)
   2. [Homebrew](https://brew.sh/) (package management): ``/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"``
      - *Strong opinion:* don't use MacPorts or similar. MacPorts was the only option 5-6 years ago, but
        Homebrew is stable for the past 3-4 years, is far less invasive, and it's easier to see what's
        going on under the hood.
      - *Everything* for Homebrew is installed under ``/usr/local`` which is a "mirror" of the higher level
        directory structure. So, binaries are in ``/usr/local/bin`` and config files are in ``/usr/local/etc``.
        Easy to find what you need, easy to remove if something goes haywire, and easy to not overwrite system
        files.
   3. Update the BASH shell (OSX comes with an older version):
      1. Install: ``brew install bash``
      2. Set as an option for use: ``echo "/usr/local/bin/bash" | sudo tee -a /etc/shells``
      3. Change shell: ``chsh -s /usr/local/bin/bash``
   4. Install dev tools (OSX comes with older versions):
      - Python 2.x: ``brew install python``
      - git: ``brew install git``
      - nginx: ``brew install nginx`` (web server)
      - fabric: ``pip install fabric`` (used for server interaction)
      - src highlight: ``brew install source-highlight`` (*opion:* highlights source code in terminal windows, nice to have)
      - virtualenvwrapper: ``pip install virtualenvwrapper`` (*opinion:* this makes working with Python virtual
        environments much easier, though it's not required; this doc assumes you use it)
      - aws CLI: ``pip install awscli`` (other tools exist, but this is the most complete)
      - [Node Version Manager (nvm)](https://github.com/creationix/nvm): ``curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash``
      - [Postgres App](http://postgresapp.com), just install and run, PATH will be set in the next section
        (*opinion:* easier than working with brew's version)
      - [P4Merge](https://www.perforce.com/downloads/visual-merge-tool), a diff util (*opinion:* much better than
        doing merges in text files or with OSX's FileMerge util, takes into account 3-way merges, not just 2-way)
      - your editor of choice ([Sublime Text](https://www.sublimetext.com/) is a good starting point)

### Configuration

1. SSH / GIT
   - You'll need to generate a public/private keypair for SSH:
     1. ``ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`` just accept the defaults, there's no real need
        to use a password on this (if you do use a password, look into
        [using the ssh-agent](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)
        to reduce password prompts)
     2. Add your public key to your GitHub account. Copy it to your clipboard with ``pbcopy < ~/.ssh/id_rsa.pub``
   - Some tools (notably Fabric) require you have an SSH config file, even if empty. Create one with: ``touch ~/.ssh/config``
   - Set up a ``~/.gitconfig``. You can find mine's [here](https://gist.github.com/kyle-johnson/1b215850141a73861b9e901fba65dff0) which includes sections for using P4Merge as your mergetool.
2. Bash
   - ``~/.bash_profile``
     - Just make this load .bashrc so we can ignore it.
     - ``curl https://gist.githubusercontent.com/kyle-johnson/d1562b2bdb99b58e135430d0f15d8d00/raw/8af5c8d7e7888102ccdda068520af0446f8a2ac5/bash_profile -o ~/.bash_profile``
   - ``~/.bashrc``
     - This includes some sane defaults around where to look for programs, some tool setup, and a decent command prompt.
       (Not highly opinionated, read the comments and change as you like just be careful with PATHs.)
     - ``curl https://gist.githubusercontent.com/kyle-johnson/c6a38cf3f016ecbef2d779ab2a70605c/raw/43923eb53ceb3780115200786927f9d3c7aadf47/bashrc -o ~/.bashrc``
   - ``~/.inputrc``
     - Defaults to make working in Bash much nicer. Mainly better tab completion of commands/files and more. Nothing very
       opinionated here, but you can go crazy if, say, you prefer vi movement commands over Bash's emacs-style defaults.
     - ``curl https://gist.githubusercontent.com/kyle-johnson/bed4639abcfa59eb489e5003ab19c357/raw/6a7b4463f7c424f75a1bb739c0c284108428104b/inputrc -o ~/.inputrc``
   - Completions (referenced in .bashrc)
     - ``mkdir ~/.completion``
     - git (completes branchnames): ``curl https://gist.githubusercontent.com/kyle-johnson/fbc97d0fe63219165bad5d72182ff2f7/raw/9a56610f32f13a79b24ed0b198dfa8b36f9bcb6f/git-completion -o ~/.completion/git.bash``
     - ssh (completes server names from ~/.ssh/config): ``curl https://gist.githubusercontent.com/kyle-johnson/49f704a518c96e0323627bb48b947378/raw/7c1a63bb990f9ef6986c53562eb183edbab4ca33/ssh-completion -o ~/.completion/ssh.bash``
     - Want more? https://github.com/scop/bash-completion/tree/master/completions
   - Open a new Terminal window for all these changes to take effect.
3. OS X (Sierra), copy/paste all of these commands to the terminal
   - [Not opinion, do these](https://gist.github.com/kyle-johnson/ad0da964c29d075ce95821b2fc4944c8) (turn off old/dead features)
   - [Lite opinion, *strongly* recommend](https://gist.github.com/kyle-johnson/47ed53eec42a72482ac8a322954ea20f) (makes development life easier in many cases)
   - Want more? https://github.com/joshukraine/mac-bootstrap/blob/master/install/macos-defaults
