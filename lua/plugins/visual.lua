-- visual related plugins

return {
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("everforest").setup({
        -- Your config here
        ---Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
        ---Default is "medium".
        background = "medium",
        ---How much of the background should be transparent. 2 will have more UI
        ---components be transparent (e.g. status line background)
        transparent_background_level = 1,
        ---Whether italics should be used for keywords and more.
        italics = true,
        ---Disable italic fonts for comments. Comments are in italics by default, set
        ---this to `true` to make them _not_ italic!
        disable_italic_comments = true,
        ---By default, the colour of the sign column background is the same as the as normal text
        ---background, but you can use a grey background by setting this to `"grey"`.
        ---The contrast of line numbers, indent lines, etc. Options are `"high"` or
        ---`"low"` (default).
        ---Which colour the diagnostic text should be. Options are `"grey"` or `"coloured"` (default)
        spell_foreground = false,
        ---Whether to show the EndOfBuffer highlight.
        show_eob = true,
        ---Style used to make floating windows stand out from other windows. `"bright"`
        ---makes the background of these windows lighter than |hl-Normal|, whereas
        ---`"dim"` makes it darker.
        ---
        ---Floating windows include for instance diagnostic pop-ups, scrollable
        ---documentation windows from completion engines, overlay windows from
        ---installers, etc.
        ---
        ---NB: This is only significant for dark backgrounds as the light palettes
        ---have the same colour for both values in the switch.
        float_style = "bright",
      })

      vim.cmd([[colorscheme everforest]])
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = "everforest",
          globalstatus = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' }, -- diffは必要ない気がするので削除
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "cpp", "vim", "dockerfile", "fish", "typescript", "tsx", "javascript", "json", "lua", "gitignore", "bash", "astro", "markdown", "css", "scss", "styled", "yaml", "toml", "vue", "php", "html", "vimdoc" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false, -- catpuucin用
          disable = {},
        },
        yati = {
          enable = true,
          -- Disable by languages, see `Supported languages`
          disable = { "python" },

          -- Whether to enable lazy mode (recommend to enable this if bad indent happens frequently)
          default_lazy = true,

          -- Determine the fallback method used when we cannot calculate indent by tree-sitter
          --   "auto": fallback to vim auto indent
          --   "asis": use current indent as-is
          --   "cindent": see `:h cindent()`
          -- Or a custom function return the final indent result.
          default_fallback = "auto"
        },
        indent = {
          -- 一部のファイルでインデントが変になることがある
          -- 一時的にインデントだけオフにして対応
          enable = false,
          -- disable ={"html"},
        },
        autotag = {
          enable = true,
          -- nvim-ts-autotagで奇妙な挙動になるのでfalseに
          enable_close_on_slash = false
        },
      })
    end
  },

  { 'JoosepAlviste/nvim-ts-context-commentstring' }, -- context-comment with treesitter

  { "yioneko/nvim-yati",                          version = "*" },

  -- {'digitaltoad/vim-pug'}, -- for .jade,.pug file syntax
}
