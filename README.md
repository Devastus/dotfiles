# dotfiles
My personal reusable configurations and dotfiles for Linux distributions.

## Usage

1. Install required software and dependencies
2. Navigate to the root of this repo and run the install script:
`./install.sh`
3. Add `. $HOME/.bash_common` to your .bashrc or .zshrc file.
4. Enjoy!

## Software & Dependencies

- **vim** - Text editor (install gvim for clipboard support)
- **tmux** - Terminal multiplexer
- **alacritty** - Fast terminal emulator
- **w3m** - Terminal browser
- **ranger** - Terminal file manager
- **NERDFont** - A patched font with devicons (I use Ubuntu Mono)

For Arch Linux, you can simply run this command:
```sh
sudo pacman -S vim tmux alacritty w3m ranger
```
