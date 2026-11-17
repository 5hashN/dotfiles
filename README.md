# Dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

Each folder in this repository is a Stow package whose internal hierarchy mirrors `$HOME`:

```text
~/.dotfs/
  ├── conda/       # ~/.condarc
  ├── htop/        # ~/.config/htop/
  ├── iterm2/      # ~/.config/iterm2/
  ├── misc/        # ~/.hushlogin
  ├── nvim/        # ~/.config/nvim/
  ├── scripts/     # ~/.scripts/
  ├── starship/    # ~/.config/starship.toml
  ├── zathura/     # ~/.config/zathura/
  └── zsh/         # ~/.zshrc, ~/.zprofile, ~/.config/zsh/
```

## Quick Start on a New Machine

```zsh
# 1. Install Stow
brew install stow

# 2. Clone repository to ~/.dotfs
git clone https://github.com/5hashN/dotfiles.git ~/.dotfs
cd ~/.dotfs

# 3. Stow all packages into $HOME
stow -v -t ~ */
```

## Everyday Usage

From inside `~/.dotfs`:

```zsh
# Stow a specific package
stow -v -t ~ nvim

# Unstow / remove symlinks for a package
stow -v -D -t ~ nvim

# Re-stow / refresh links
stow -v -R -t ~ nvim

# Dry-run (simulate before linking)
stow -n -v -t ~ nvim
```
