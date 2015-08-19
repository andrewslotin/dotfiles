dotfiles
========

Installation
------------

Makefile uses [GNU stow](https://www.gnu.org/software/stow/) to maintain symlinks to config
files in you `$HOME` directory. If you don't have it install it, here is how you do it in OS X
using Homebrew:

```bash
brew install stow
```

Clone repository and run `make all` to link all configuration files at once:

```bash
git clone git@github.com:andrewslotin/dotfiles.git ~/dotfiles
cd dotfiles
make all
```

`stow` preserves existing target files, so none of your existing config files will be overwritten.
To replace an existing config file either delete or rename it first.

To install only specific config layer (e.g. `bash`) run:

```bash
make bash
```

List of available layers together with a short usage message is available by running `make help`, which
is a default target.

Available config layers
-----------------------

* `bash`
* `emacs` — based on [flyingmachine/emacs-for-clojure](https://github.com/flyingmachine/emacs-for-clojure.git)
* `fzf`
* `git`
* `ruby`
* `tmux`
