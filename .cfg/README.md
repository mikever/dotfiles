# Configuration Files

Tutorial for this setup taken from here: [The Best Way to Store Your dotfiles](https://www.atlassian.com/git/tutorials/dotfiles).

## Installing dotfiles Onto a New System

I will make a script for this, but until then:

- Commit the alias to your .bashrc or .zshrc:

`alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`

- Source repository ignores the folder where we will clone it, to avoid recursion problems:

`echo ".cfg" >> .gitignore`

- Clone dotfiles into a bare repository:

`git clone --bare https://github.com/mikever/dotfiles.git $HOME/.cfg`

- Define the alias in the current shell scope:

`alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME`

- Checkout the actual content from the bare repository to your $HOME:

`config checkout`

If the last step fails with a message like:

```sh
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
		.gitignore
Please move or remove them before you can switch branches.
Aborting
```

This is because your $HOME directory might already have some stock configuration files which would be overwritten by Git.

Backup the files if you care about them. Here is a shortcut to remove those files to a backup folder:

```sh
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

- Set the flag `showUntrackedFiles` to `no` on this specific local repository:

`config config --local status.showUntrackedFiles no`

## Making a Script to do the Work For You

Create a bitbucket snippet, or something similar, and create a short url for it, so that you can call it with `curl`.

```sh
cd $HOME
git clone --bare https://bitbucket.org/<name>/cfg.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```

## Creating this Dotfiles Setup

```sh
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ -- work-tree=$HOME'
config config --local status.showUntrackedFiles no
```

This will create a folder `~/.cfg` which is a bare Git repo that will track our files. Then we create a `config` alias to use instead of the regular `git` when we are interacting with the configuration repo.

To put this into the .zshrc:

```sh
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zshrc
```

Now we can run commands like this:

```sh
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```


