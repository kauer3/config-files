--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "lunar"
lvim.transparent_window = true
vim.o.ch = 0
vim.o.ls = 0
-- vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.titlestring = " => %<%F"
vim.opt.clipboard = "unnamed,unnamedplus" -- allows neovim to access the system clipboard
vim.opt.colorcolumn = "99999"             -- fixes indentline for now
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.fileencoding = "utf-8"            -- the encoding written to a file
vim.opt.foldmethod = "manual"             -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr = ""                     -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
-- vim.opt.guifont = "monospace:h17"         -- the font used in graphical neovim applications
vim.opt.hidden = true                     -- required to keep multiple buffers and open multiple buffers
vim.opt.hlsearch = true                   -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                 -- ignore case in search patterns
vim.opt.mouse = "a"                       -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                    -- pop up menu height
vim.opt.showmode = false                  -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2                   -- always show tabs
vim.opt.smartcase = true                  -- smart case
vim.opt.smartindent = true                -- make indenting smarter again
vim.opt.termguicolors = true              -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 100                  -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 300                  -- faster completion
vim.opt.writebackup = false               -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.opt.expandtab = true                  -- convert tabs to spaces
vim.opt.shiftwidth = 2                    -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2                       -- insert 2 spaces for a tab
vim.opt.cursorline = true                 -- highlight the current line
vim.opt.number = true                     -- set numbered lines
vim.opt.relativenumber = true             -- set relative numbered lines
vim.opt.numberwidth = 2                   -- set number column width to 2 {default 4}
vim.opt.signcolumn = "no"                 -- always show the sign column otherwise it would shift the text each time
vim.opt.wrap = false                      -- display lines as one long line
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 15
vim.opt.foldlevelstart = 2

-- Hide norg/md special characters
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"

-- Set wrap & prevent line breaks on words
-- TODO look for a way to set only for neorg
vim.opt.wrap = true
vim.opt.linebreak = true


-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
lvim.keys.insert_mode["jj"] = "<ESC>"
-- lvim.keys.normal_mode["<CR>"] = "i<CR><ESC>"
lvim.keys.normal_mode["<Tab>"] = ">>"
lvim.keys.normal_mode["<S-Tab>"] = "<<"
lvim.keys.normal_mode["<Up>"] = "gk"
lvim.keys.normal_mode["<Down>"] = "gj"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
lvim.keys.normal_mode["<M-e>"] = "<cmd>NvimTreeToggle<CR>"
-- lvim.keys.normal_mode["<Space>e"] = ""
lvim.lsp.diagnostics.virtual_text = false
-- lvim.keys.normal_mode["<leader>nh"] = -- disable highlight

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.terminal.active = true
lvim.builtin.cmp.sources = { { name = 'orgmode' } }

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      vim.api.nvim_set_keymap("n", "<leader>hw", ":HopWord<CR>", { silent = true })
      vim.api.nvim_set_keymap("n", "<leader>hl", ":HopLine<CR>", { silent = true })
      vim.api.nvim_set_keymap("n", "<leader>hc", ":HopChar1<CR>", { silent = true })
      vim.api.nvim_set_keymap("n", "<leader>/", ":HopPattern<CR>", { silent = true })
    end
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "wellle/targets.vim" },
  {
    "inkarkat/vim-ReplaceWithRegister",
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>r", "<Plug>ReplaceWithRegisterOperator", { silent = true })
      vim.api.nvim_set_keymap("n", "<leader>rr", "<Plug>ReplaceWithRegisterLine", { silent = true })
      -- vim.api.nvim_set_keymap("v", "<leader>r", "<Plug>ReplaceWithRegisterVisual", { silent = true })
    end
  },
  { "prettier/vim-prettier",        run = "yarn install" },
  { "editorconfig/editorconfig-vim" },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  {
    "nvim-neorg/neorg",
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.norg.concealer"] = {
            config = {
              icon_preset = "diamond"
            }
          },                       -- Adds pretty icons to your documents
          ["core.norg.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                general = "~/notes/general",
                classes = "~/notes/classes",
              },
              default_workspace = "classes"
            },
          },
        },
      }
    end,
    run = ":Neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim",
  }
  -- {
  --   "nvim-orgmode/orgmode",
  --   config = function()
  --     require('orgmode').setup_ts_grammar()
  --     require 'nvim-treesitter.configs'.setup {
  --       -- If TS highlights are not enabled at all, or disabled via ``disable`` prop, highlighting will fallback to default Vim syntax highlighting
  --       highlight = {
  --         enable = true,
  --         disable = { 'org' },                           -- Remove this to use TS highlighter for some of the highlights (Experimental)
  --         additional_vim_regex_highlighting = { 'org' }, -- Required since TS highlighter doesn't support all syntax features (conceal)
  --       },
  --       ensure_installed = { 'org' },                    -- Or run :TSUpdate org
  --     }
  --     require("orgmode").setup({
  --       org_agenda_files = { '~/Dropbox/org/*', '~/my-orgs/**/*' },
  --       org_default_notes_file = '~/Dropbox/org/refile.org',
  --     })
  --   end,
  -- }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "ColorScheme", "*", "hi MsgSeparator ctermbg=none guibg=none" },
--   { "ColorScheme", "*", "hi LineNr ctermbg=none guibg=none" },
--   { "ColorScheme", "*", "hi NonText ctermbg=none guibg=none" },
--   { "ColorScheme", "*", "hi EndOfBuffer ctermbg=none guibg=none" },
--   { "ColorScheme", "*", "hi NvimTreeVertSplit ctermbg=none guibg=none" },
--   -- { "ColorScheme", "*", "hi CursorLine ctermbg=none guibg=none" },
-- }
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
