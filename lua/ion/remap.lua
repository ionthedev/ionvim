vim.g.mapleader = " "

-- wf.nvim setup
local which_key = require("wf.builtin.which_key")
local register = require("wf.builtin.register")
local bookmark = require("wf.builtin.bookmark")
local buffer = require("wf.builtin.buffer")
local mark = require("wf.builtin.mark")

vim.keymap.set(
  "n",
  "<Space>wr",
  register(),
  { noremap = true, silent = true, desc = "[wf.nvim] register" }
)

vim.keymap.set(
  "n",
  "<Space>wbo",
  bookmark({
    nvim = "~/.config/nvim",
    zsh = "~/.zshrc",
  }),
  { noremap = true, silent = true, desc = "[wf.nvim] bookmark" }
)

vim.keymap.set(
  "n",
  "<Space>wbu",
  buffer(),
  {noremap = true, silent = true, desc = "[wf.nvim] buffer"}
)

vim.keymap.set(
  "n",
  "'",
  mark(),
  { nowait = true, noremap = true, silent = true, desc = "[wf.nvim] mark"}
)

vim.keymap.set(
  "n",
  "<Leader>",
  which_key({ text_insert_in_advance = "<Leader>" }),
  { nowait = true, noremap = true, silent = true, desc = "[wf.nvim] which-key /", }
)

vim.keymap.set("n", "<leader>ef", "<cmd>Yazi<CR>") -- Opens file browser in current directory
vim.keymap.set("n", "<leader>et", "<cmd>ToggleTerm size=40 dir=. direction=float name=desktop<CR>") -- Opens terminal in current directory

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/ion/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Arduino keymaps
vim.keymap.set("n", "<leader>ac", "<cmd>InoCheck<CR>")
vim.keymap.set("n", "<leader>au", "<cmd>InoUpload<CR>")
vim.keymap.set("n", "<leader>ar", "<cmd>InoUploadReset<CR>")
vim.keymap.set("n", "<leader>am", "<cmd>InoMonitor<CR>")
vim.keymap.set("n", "<leader>as", "<cmd>InoStatus<CR>")
vim.keymap.set("n", "<leader>al", "<cmd>InoLib<CR>")
vim.keymap.set("n", "<leader>ag", "<cmd>InoGUI<CR>")
vim.keymap.set("n", "<leader>ap", "<cmd>InoSelectPort<CR>")
vim.keymap.set("n", "<leader>ab", "<cmd>InoSelectBoard<CR>")
