![img](https://pbs.twimg.com/media/G63b5J9aEAA3k57?format=png&name=900x900)

Welcome to my opinionated/lightweight neovim config. 

I built this over the last month and have been daily driving it.
This repo mainly acts as a place for me to back up my changes but might as well give them to y'all too.

Primarily this is based on the [0 to LSP](https://www.youtube.com/watch?v=w7i4amO_zaE) video by [ThePrimeagen](https://www.youtube.com/@ThePrimeagen) Go sub btw he's almost to a million. I then spiced it up to fit my growing needs.

If you like it, give me a follow on X [@ionthedev](https://x.com/ionthedev)

#### System dependencies
[Yazi](https://github.com/sxyazi/yazi)
[ESP-IDF](https://docs.espressif.com/projects/esp-idf/en/stable/esp32s3/get-started/index.html#introduction) <-- You should only need this if you're cracked

## Keymaps

#### Leader Key
- Leader: Space (" ")

#### File Navigation & Search
- <leader>ff - Telescope find files
- <leader>fg - Telescope live grep
- <leader>fb - Telescope buffers
- <leader>fh - Telescope help tags
- <leader>ps - Telescope grep string (prompts for search term)
- <leader>ec - Telescope find files in nvim config directory. Think `Enter Config`
- <leader>ef - Open Yazi file browser in current directory. Think `Enter Files`

#### Terminal & Tools
- <leader>et - Open floating terminal in current directory. Think `Enter Terminal`
- <C-f> - Open tmux sessionizer

#### Harpoon (Quick File Navigation)
- <leader>a - Add file to Harpoon list
- <C-e> - Toggle Harpoon quick menu
- <C-h> - Go to Harpoon file #1
- <C-t> - Go to Harpoon file #2
- <C-n> - Go to Harpoon file #3
- <C-s> - Go to Harpoon file #4
- <C-S-P> - Previous Harpoon buffer
- <C-S-N> - Next Harpoon buffer

#### rduino Commands
- <leader>ac - Arduino check/compile
- <leader>au - Arduino upload
- <leader>ar - Arduino upload with reset
- <leader>am - Arduino serial monitor
- <leader>as - Arduino status
- <leader>al - Arduino library manager
- <leader>ag - Arduino GUI
- <leader>ap - Arduino select port
- <leader>ab - Arduino select board

#### LSP & Code Actions
- <leader>f - Format current buffer with LSP

#### Quickfix & Location Lists
- <C-k> - Next quickfix item (centered)
- <C-j> - Previous quickfix item (centered)
- <leader>k - Next location list item (centered)
- <leader>j - Previous location list item (centered)

#### Text Editing & Manipulation
- <leader>s - Substitute current word globally (with confirmation)
- <leader>x - Make current file executable
- <leader>y - Copy to system clipboard (visual and normal mode)
- <leader>Y - Copy line to system clipboard
- <leader>d - Delete to black hole register (visual and normal mode)
- <leader>p - Paste from black hole register (visual mode)

#### Visual Mode Line Movement
- J (visual) - Move selected lines down
- K (visual) - Move selected lines up

#### Navigation & Scrolling
- J (normal) - Join current line with next (preserves cursor position)
- <C-d> - Page down (centered)
- <C-u> - Page up (centered)
- n - Next search result (centered)
- N - Previous search result (centered)

#### Utility & Misc
- <leader><leader> - Source current file
- <leader>vpp - Edit packer config file
- <C-c> (insert mode) - Escape to normal mode
- Q - Disabled (no-op)
wf.nvim (Which Key Framework)
- <Space>wr - wf.nvim register
- <Space>wbo - wf.nvim bookmark (nvim config, zshrc)
- <Space>wbu - wf.nvim buffer
- ' - wf.nvim mark
- <Leader> - wf.nvim which-key menu
