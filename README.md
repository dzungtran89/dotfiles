Keynotes
========

For installation, please see [INSTALL.md](./readme/INSTALL.md)

### Cli version manager [asdf](https://asdf-vm.com/)

```sh
asdf plugin add tmux
asdf plugin add neovim
asdf plugin add python
asdf plugin add nodejs
asdf plugin add rust
asdf plugin add ruby
asdf plugin add golang
asdf plugin add postgres
```
Dependencies can be found at each plugin's repo

### [zsh](./zsh/.zshrc)

- [pure prompt](https://github.com/sindresorhus/pure)
- [zsh-z](https://github.com/agkozak/zsh-z)

### tmux

- [.tmux.conf](./tmux/.tmux.conf)
- [.tmux.conf.min](./tmux/.tmux.conf.min)
    Extend the above `.tmux.conf`
- prefix: `C-a`

### neovim

keymap       | note                                                                          |
-------------|-------------------------------------------------------------------------------|
`<SPACE>`    | mapleader                                                                     |
`,`          | maplocalleader                                                                |
**Session**  |
`<leader>qo` | Open session                                                                  |
`<leader>qw` | Save session                                                                  |
**Files**    |
`cd`         | Change cwd                                                                    |
`<leader>ef` | Get all files of cwd                                                          |
`<leader>;`  | Sidebar explorer                                                              |
`<leader>ew` | Get window list                                                               |
`<leader>bb` | Get buffer list                                                               |
`<leader>/`  | Search engine by [ripgrep](https://github.com/BurntSushi/ripgrep) + [ack.vim](https://github.com/mileszs/ack.vim)|
**Misc**     |
`LSP`        | [coc.nvim](https://github.com/neoclide/coc.nvim) and its amazing addons       |
`C-j`        | Pick snippet in `insert` mode                                                 |
`<leader>ga` | :Git                                                                          |
**Note**     |
`<leader>ww` | Open the wiki index file                                                      |

### vim

[A minimal config](./.vimrc)

🙏 Credits
=========

- (neo)vim community
- tmux community
- zsh community

Known Issues
============

Please see [here](./readme/KNOWN_ISSUES.md)
