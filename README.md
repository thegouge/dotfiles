# Alex's Dotfiles

In order to clone this repo and setup a new machine for git/github, just run this in your terminal:
```
sh -c "$(curl -sS https://raw.githubusercontent.com/thegouge/dotfiles/refs/heads/main/bash/bash-scripts/system-init/init-git.sh)"
```

# Linking Neovim to Godot

## 1. In Text Editor>External

Tick Use External Editor

Set Execution Path to your neovim binary

Set Execution Parameters to `--server /tmp/godot.pipe --remote-send "<esc>:n {file}<CR>:call cursor({line},{col})<CR>"`

Note: you can set the path to the pipe to anything you want. I set it in tmp for convenience.

## 2. In Networking>Language Server

Check the language server port, by default in Godot 4.2 it's 6005

Tick Show Native Symbols in Editor

## 3. In Networking>Debug Adapter and NOT "Debugging"

Check the port, by default in Godot 4.2 it's 6006

Tick Synchronize Breakpoints

# Neovim Config

## 1. Install nvim-lspconfig and nvim-dap using your preferred package manager

Configure GDScript lsp like this. Make sure the port you set is the same as in the editor for language server.

```
require("lspconfig")["gdscript"].setup({
    name = "godot",
    cmd = vim.lsp.rpc.connect("127.0.0.1", "6005"),
})
```

## 3. Configure nvim-dap like this. Check the port again

```
local dap = require("dap")
dap.adapters.godot = {
	type = "server",
	host = "127.0.0.1",
	port = 6006,
}

dap.configurations.gdscript = {
	{
		type = "godot",
		request = "launch",
		name = "Launch scene",
		project = "${workspaceFolder}",
		launch_scene = true,
	},
}
```

## 4. Configure file format settings

Make `/after/ftplugin/gdscript.lua`:

```
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = false -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.o.commentstring = "# %s" -- add comment support
```

# Starting Neovim

In order for Godot to redirect neovim to the scripts when you click them in the editor, you will always have to start neovim with these arguments.

You can create a custom bash script that you set to your path. I created a script called gdvim that I use when I develop with godot.

```
nvim --listen /tmp/godot.pipe
```
