-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/ion/.cache/nvim/packer_hererocks/2.1.1763318511/share/lua/5.1/?.lua;/home/ion/.cache/nvim/packer_hererocks/2.1.1763318511/share/lua/5.1/?/init.lua;/home/ion/.cache/nvim/packer_hererocks/2.1.1763318511/lib/luarocks/rocks-5.1/?.lua;/home/ion/.cache/nvim/packer_hererocks/2.1.1763318511/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ion/.cache/nvim/packer_hererocks/2.1.1763318511/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Arduino-Nvim"] = {
    config = { "\27LJ\2\n~\0\0\3\0\5\0\b6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0>autocmd BufRead,BufNewFile *.ino,*.c set filetype=arduino\bcmd\bvim\17Arduino-Nvim\frequire\0" },
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/Arduino-Nvim",
    url = "https://github.com/yuukiflow/Arduino-Nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["dashboard-nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ion/.local/share/nvim/site/pack/packer/opt/dashboard-nvim",
    url = "https://github.com/nvimdev/dashboard-nvim"
  },
  harpoon = {
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["inlay-hint.nvim"] = {
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/inlay-hint.nvim",
    url = "https://github.com/felpafel/inlay-hint.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\nî\1\0\0\b\0\b\0/6\0\0\0009\0\1\0009\0\2\0B\0\1\0026\1\0\0009\1\1\0019\1\3\1\18\3\0\0'\4\4\0&\3\4\3)\4\0\0)\5\1\0B\1\4\2\21\2\1\0)\3\0\0\1\3\2\0X\2\1€L\0\2\0\18\2\0\0\6\2\5\0X\3\24€U\3\23€6\3\0\0009\3\1\0039\3\6\3\18\5\2\0'\6\a\0B\3\3\2\18\2\3\0006\3\0\0009\3\1\0039\3\3\3\18\5\2\0'\6\4\0&\5\6\5)\6\0\0)\a\1\0B\3\4\2\18\1\3\0\21\3\1\0)\4\0\0\1\4\3\0X\3è\127L\2\2\0X\3æ\127+\3\0\0L\3\2\0\a:h\16fnamemodify\6/\v/*.ino\tglob\vgetcwd\afn\bvimÖ\4\1\0\t\0\23\0013'\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2\18\4\0\0B\2\2\2\t\2\0\0X\2\r€6\2\5\0\18\4\0\0B\2\2\2\15\0\2\0X\3\b€6\3\6\0\18\5\2\0B\3\2\3\15\0\3\0X\5\3€\15\0\4\0X\5\1€\18\1\4\0006\2\a\0'\4\b\0B\2\2\0029\2\t\0029\2\n\0025\4\17\0005\5\v\0006\6\2\0009\6\3\0069\6\f\6'\b\r\0B\6\2\2>\6\5\0056\6\2\0009\6\3\0069\6\14\6'\b\15\0B\6\2\2\14\0\6\0X\a\1€'\6\16\0>\6\a\5=\5\18\0045\5\19\0=\5\20\0043\5\21\0=\5\22\4B\2\2\1K\0\1\0\rroot_dir\0\14filetypes\1\4\0\0\farduino\bcpp\6c\bcmd\1\0\3\rroot_dir\0\14filetypes\0\bcmd\0\20/usr/bin/clangd\vclangd\fexepath&$HOME/.arduino15/arduino-cli.yaml\vexpand\1\n\0\0\28arduino-language-server\t-cli\16arduino-cli\16-cli-config\0\f-clangd\0\n-fqbn\24esp32:esp32:esp32s3\nsetup\28arduino_language_server\14lspconfig\frequire\npcall\rloadfile\17filereadable\afn\bvim\1\0\2\nboard\24esp32:esp32:esp32s3\tport\17/dev/ttyACM0\24.arduino_config.lua\2ý\1\1\0\5\0\v\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\5\0005\3\4\0=\3\6\0025\3\b\0003\4\a\0=\4\t\3=\3\n\2B\0\2\1K\0\1\0\rhandlers\28arduino_language_server\1\0\1\28arduino_language_server\0\0\21ensure_installed\1\0\2\rhandlers\0\21ensure_installed\0\1\2\0\0\28arduino_language_server\20mason-lspconfig\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/mason-org/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/mason-org/mason.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  rustaceanvim = {
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/rustaceanvim",
    url = "https://github.com/mrcjkb/rustaceanvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  vague = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\22colorscheme vague\bcmd\bvim\0" },
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/vague",
    url = "https://github.com/vague-theme/vague.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["wf.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\awf\frequire\0" },
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/wf.nvim",
    url = "https://github.com/Cassin01/wf.nvim"
  },
  ["yazi.nvim"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\25open_for_directories\2\nsetup\tyazi\frequire\0" },
    loaded = true,
    path = "/home/ion/.local/share/nvim/site/pack/packer/start/yazi.nvim",
    url = "https://github.com/mikavilpas/yazi.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vague
time([[Config for vague]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\22colorscheme vague\bcmd\bvim\0", "config", "vague")
time([[Config for vague]], false)
-- Config for: Arduino-Nvim
time([[Config for Arduino-Nvim]], true)
try_loadstring("\27LJ\2\n~\0\0\3\0\5\0\b6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0>autocmd BufRead,BufNewFile *.ino,*.c set filetype=arduino\bcmd\bvim\17Arduino-Nvim\frequire\0", "config", "Arduino-Nvim")
time([[Config for Arduino-Nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: yazi.nvim
time([[Config for yazi.nvim]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\25open_for_directories\2\nsetup\tyazi\frequire\0", "config", "yazi.nvim")
time([[Config for yazi.nvim]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)
try_loadstring("\27LJ\2\nî\1\0\0\b\0\b\0/6\0\0\0009\0\1\0009\0\2\0B\0\1\0026\1\0\0009\1\1\0019\1\3\1\18\3\0\0'\4\4\0&\3\4\3)\4\0\0)\5\1\0B\1\4\2\21\2\1\0)\3\0\0\1\3\2\0X\2\1€L\0\2\0\18\2\0\0\6\2\5\0X\3\24€U\3\23€6\3\0\0009\3\1\0039\3\6\3\18\5\2\0'\6\a\0B\3\3\2\18\2\3\0006\3\0\0009\3\1\0039\3\3\3\18\5\2\0'\6\4\0&\5\6\5)\6\0\0)\a\1\0B\3\4\2\18\1\3\0\21\3\1\0)\4\0\0\1\4\3\0X\3è\127L\2\2\0X\3æ\127+\3\0\0L\3\2\0\a:h\16fnamemodify\6/\v/*.ino\tglob\vgetcwd\afn\bvimÖ\4\1\0\t\0\23\0013'\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2\18\4\0\0B\2\2\2\t\2\0\0X\2\r€6\2\5\0\18\4\0\0B\2\2\2\15\0\2\0X\3\b€6\3\6\0\18\5\2\0B\3\2\3\15\0\3\0X\5\3€\15\0\4\0X\5\1€\18\1\4\0006\2\a\0'\4\b\0B\2\2\0029\2\t\0029\2\n\0025\4\17\0005\5\v\0006\6\2\0009\6\3\0069\6\f\6'\b\r\0B\6\2\2>\6\5\0056\6\2\0009\6\3\0069\6\14\6'\b\15\0B\6\2\2\14\0\6\0X\a\1€'\6\16\0>\6\a\5=\5\18\0045\5\19\0=\5\20\0043\5\21\0=\5\22\4B\2\2\1K\0\1\0\rroot_dir\0\14filetypes\1\4\0\0\farduino\bcpp\6c\bcmd\1\0\3\rroot_dir\0\14filetypes\0\bcmd\0\20/usr/bin/clangd\vclangd\fexepath&$HOME/.arduino15/arduino-cli.yaml\vexpand\1\n\0\0\28arduino-language-server\t-cli\16arduino-cli\16-cli-config\0\f-clangd\0\n-fqbn\24esp32:esp32:esp32s3\nsetup\28arduino_language_server\14lspconfig\frequire\npcall\rloadfile\17filereadable\afn\bvim\1\0\2\nboard\24esp32:esp32:esp32s3\tport\17/dev/ttyACM0\24.arduino_config.lua\2ý\1\1\0\5\0\v\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\5\0005\3\4\0=\3\6\0025\3\b\0003\4\a\0=\4\t\3=\3\n\2B\0\2\1K\0\1\0\rhandlers\28arduino_language_server\1\0\1\28arduino_language_server\0\0\21ensure_installed\1\0\2\rhandlers\0\21ensure_installed\0\1\2\0\0\28arduino_language_server\20mason-lspconfig\nsetup\nmason\frequire\0", "config", "mason-lspconfig.nvim")
time([[Config for mason-lspconfig.nvim]], false)
-- Config for: wf.nvim
time([[Config for wf.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\awf\frequire\0", "config", "wf.nvim")
time([[Config for wf.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'dashboard-nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
