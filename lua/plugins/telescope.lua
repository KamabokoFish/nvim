
return {

  {
    'nvim-telescope/telescope.nvim', 
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()

      local builtin = require('telescope.builtin')

      require('telescope').setup({
        defaults = {
          preview = {
            -- 巨大なProjectで固まることがあるためtreesitterを無効に
            -- @refer https://github.com/nvim-telescope/telescope.nvim/issues/1379
            treesitter = true,
          },
          sorting_strategy = "ascending",
          -- layout_strategy = 'vertical',
          layout_config = { height = 0.9 },
          -- 画像類を検索対象に含めない(検索が重くなる)
          file_ignore_patterns = {
            "^.git/",
            "^node_modules/",
            "%.jpg",
            "%.jpeg",
            "%.png",
            "%.pdf",
            "%.gif",
            "%.svg",
            "%.avif",
            "%.gitkeep",
          },
          wrap_results = true, -- 検索結果を折り返す
        },
        extensions = {
          coc = {
            prefer_locations = false,   -- always use Telescope locations to preview definitions/declarations/implementations etc
          }, 
        }
      })

      require('telescope').load_extension("frecency") --frecency search
      require('telescope').load_extension("coc")      -- coc integration

      -- file search
      vim.keymap.set('n', '<leader>f',
        function()
          builtin.find_files({
            no_ignore = false,
            hidden = true
          })
        end)

      -- -- Grep
      vim.keymap.set('n', '<leader>r',
        function()
          builtin.live_grep({
            no_ignore = false,
            hidden = true
          })
        end)

      -- buffer-fuzzy-find
      vim.keymap.set('n', '<leader>v',
        function()
          builtin.current_buffer_fuzzy_find({
            no_ignore = false,
            hidden = true
          })
        end)

      -- buffer-list
      vim.keymap.set('n', '<leader>b',
        function()
          builtin.buffers({
            no_ignore = false,
            hidden = true
          })
        end)

      -- git branches picker
      vim.keymap.set('n', '<leader>gg',
        function()
          builtin.git_branches({
            no_ignore = false,
            hidden = true
          })
        end)

      ---- Telescope-coc
      --定義ジャンプ
      vim.keymap.set("n", "gd", "<cmd>Telescope coc definitions<cr>", { noremap = true, silent = true })
      -- 型定義ジャンプ
      vim.keymap.set("n", "gy", "<cmd>Telescope coc type_definitions<cr>", { noremap = true, silent = true })
      -- diagnostics
      vim.keymap.set("n", "<leader>ga", "<cmd>Telescope coc diagnostics<cr>", {noremap = true, silent = true })
      -- reference
      vim.keymap.set("n", "<leader>gr", "<cmd>Telescope coc references<cr>", {noremap = true, silent = true })
      --頻度検索
      vim.keymap.set("n", "<leader>l", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", {noremap = true, silent = true})
    end

  },

  {'fannheyward/telescope-coc.nvim'},

  {'nvim-telescope/telescope-frecency.nvim'},

}