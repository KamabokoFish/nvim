-- Coding Support

return {

  {
    'windwp/nvim-autopairs',
    opts = {
      disable_filetype = { "TelescopePrompt" , "vim" },
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

  {'haya14busa/vim-asterisk'},

  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    config = function()
      require('ibl').setup {
        indent = { char = "┊" },
        scope = { enabled = false },
        exclude = { filetypes = {"jade","pug"} }
      }
    end
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup{
        padding = true,
        sticky = false,
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end
  },

  {
    'norcalli/nvim-colorizer.lua',
    opts = {
    'css';
    'scss';
    }
  },

  {'kylechui/nvim-surround'},

  {'simeji/winresizer'},

}