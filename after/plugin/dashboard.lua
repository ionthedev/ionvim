-- Wait for plugin to be available
vim.defer_fn(function()
  local ok, db = pcall(require, 'dashboard')
  if not ok then
    vim.notify('Dashboard plugin not found, skipping configuration', vim.log.levels.WARN)
    return
  end

  -- Function to read header from file
  local function read_header_file()
    local header_file = vim.fn.expand('~/.config/nvim/dashboard_header.txt')
    if vim.fn.filereadable(header_file) == 1 then
      local lines = vim.fn.readfile(header_file)
      return lines
    else
      -- Default header if file doesn't exist
      return {
        '',
        '███████╗██╗  ██╗ █████╗ ████████╗██╗ ██████╗██╗  ██╗',
        '██╔════╝╚██╗██╔╝██╔══██╗╚══██╔══╝██║██╔════╝██║ ██╔╝',
        '█████╗   ╚███╔╝ ███████║   ██║   ██║██║     █████╔╝ ',
        '██╔══╝   ██╔██╗ ██╔══██║   ██║   ██║██║     ██╔═██╗ ',
        '██║     ██╔╝ ██╗██║  ██║   ██║   ██║╚██████╗██║  ██╗',
        '╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝╚═╝  ╚═╝',
        '',
        '🚀 Welcome to Neovim 🚀',
        '',
      }
    end
  end

  -- Function to read footer from file
  local function read_footer_file()
    local footer_file = vim.fn.expand('~/.config/nvim/dashboard_footer.txt')
    if vim.fn.filereadable(footer_file) == 1 then
      local lines = vim.fn.readfile(footer_file)
      return lines
    else
      -- Default footer if file doesn't exist
      return {
        'Press any key to continue...'
      }
    end
  end

  db.setup({
    theme = 'hyper',
    config = {
      header = read_header_file(),
      week_header = {
        enable = false,
      },
      shortcut = {
        {
          desc = '󰊳 Update',
          group = '@property',
          action = 'PackerSync',
          key = 'u'
        },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' Projects',
          group = 'DiagnosticHint',
          action = 'Telescope find_files cwd=',
          key = 'p',
        },
        {
          desc = ' Config',
          group = 'Number',
          action = 'Telescope find_files cwd=' .. vim.fn.expand('~/.config/nvim'),
          key = 'c',
        },
      },
      project = {
        enable = true,
        limit = 8,
        icon = '📁',
        label = 'Recent Projects:',
        action = 'Telescope find_files cwd='
      },
      mru = {
        enable = true,
        limit = 10,
        icon = '📄',
        label = 'Recent Files:',
        cwd_only = false
      },
      footer = read_footer_file(),
    },
    hide = {
      statusline = true,
      tabline = true,
      winbar = true,
    },
  })
end, 100) -- Delay by 100ms to ensure plugin is loaded