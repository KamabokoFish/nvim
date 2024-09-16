-- Coding Support

return {

  -- coc.nvimの補完と相性が悪い(相性の良い代替としてcoc-pairsがある)
  -- nvim-autopairsを使う場合は、Enter(<CR>)での補完決定は設定しないほうがよい
  {
    'windwp/nvim-autopairs',
    opts = {
      disable_filetype = { "TelescopePrompt", "vim" },
    },
  },

  {
    'windwp/nvim-ts-autotag',
  },

  {
    'kevinhwang91/nvim-hlslens',
    opts = {
      calm_down = false,
      -- nearest_only = true,
    }
  },

  { 'haya14busa/vim-asterisk' },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    config = function()
      require('ibl').setup {
        indent = { char = "┊" },
        scope = { enabled = false },
        exclude = { filetypes = { "jade", "pug" } }
      }
    end
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        padding = true,
        sticky = false,
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end
  },

  {
    'norcalli/nvim-colorizer.lua',
    opts = {
      'css',
      'scss',
    }
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Lazy.nvimで使う場合、必ず呼び出さないとキーマップが適用されない
        -- Refer:https://github.com/kylechui/nvim-surround/issues/202#issuecomment-1412547606
        -- Configuration here, or leave empty to use defaults
      })
    end
  },

  { 'simeji/winresizer' },

}
