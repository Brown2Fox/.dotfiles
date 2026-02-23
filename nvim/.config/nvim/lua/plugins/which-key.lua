-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `opts` key (recommended), the configuration runs
-- after the plugin has been loaded as `require(MODULE).setup(opts)`.

local function get_mode(modeStr)
  local res = {}

  for c in modeStr:gmatch '.' do
    table.insert(res, c)
  end
end

return {
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function()
    local wk = require 'which-key'
    wk.add {
      { '<leader>', group = 'Leader...' },
      { '<leader>f', group = 'File...' }, -- group
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find File', mode = get_mode 'n' },
      { '<leader>fn', desc = 'New File' },
      { '<leader>f1', hidden = true }, -- hide this keymap
      -- { '<c-w>', hidden = true },
      { '<c-w>c', desc = 'Close window' },
      { '<leader>w', proxy = '<c-w>', group = 'Windows...' }, -- proxy to window mappings
    }
  end, -- config
  opts = {
    -- delay between pressing a key and opening which-key (milliseconds)
    -- this setting is independent of vim.o.timeoutlen
    delay = 0,
    plugins = {
      presets = {
        windows = false, -- default bindings on <c-w>
      },
    },
    icons = {
      breadcrumb = '>', -- symbol used in the command line area that shows your active key combo
      separator = '?', -- symbol used between a key and it's label
      group = '+ ', -- symbol prepended to a group
      mappings = vim.g.have_nerd_font,
      -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
      -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        C = '<C-…> ',
        M = '<M-…> ',
        D = '<D-…> ',
        S = '<S-…> ',
        CR = '<CR> ',
        Esc = '<Esc> ',
        ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ',
        NL = '<NL> ',
        BS = '<BS> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      }, -- keys
    }, -- icons

    -- Document existing key chains
    --   spec = {
    --     { '<leader>s', group = '[S]earch' },
    --     { '<leader>t', group = '[T]oggle' },
    --     { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    --   },
  }, -- opts
} -- return
