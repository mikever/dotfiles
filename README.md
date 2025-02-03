# Setting up NVIM Environment

## Plugin Manager

[lazy.nvim](https://github.com/folke/lazy.nvim)

## Font

[0xProto Nerd Font](https://www.nerdfonts.com/font-downloads)

## Core Utils

### options.lua

Sets the following (among other things):

- `netrw` liststyle to a tree style
- `relativenumber` for line numbering
- tabs and indentation
- search settings
- term color settings

## Usage Tips

### Save and Reload Sessions

Close nvim and open it back later with the session you were working with reloaded.

`<leader>ws` - save workspace
`<leader>wr` - reload workspace

### Split Windows

Create TMUX window splits; maximize a split window.

`<leader>sh` - split horizontally
`<leader>sv` - split vertically
`<leader>sm` - mazimize/minimize split
`<leader>sx` - close split

### Incremental Selection

Select node or parent nodes using TreeSitter.

`<C-space>` - select node

Continue pressing ctrl-space to select parent nodes.

### TODO Comments

`<leader>ft` - find all TODO comments

### Surround

Need surrounding brackets or quotation marks (or tags)?

`S<char>` - surround a selected node with a character (in Visual Mode).
`ds<char>` - delete surrounding character (in Normal Mode).

For HTML tags, use the character `t`.

`S<t>` - surround a selected node with an HTML tag (in Visual Mode).
`ds<t>` - delete surrounding HTML tag (in Normal Mode).
`cs<t>` - change surrounding HTML tag (in Normal Mode).

### LSP References

`gR` - show references for selected node
`gd` - go to definition of node
`gt` - go to type definition of node
`<leader>rn` - rename all instances of node
`K` - display info about node, such as type info
