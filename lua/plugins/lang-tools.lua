-- Language related Tools

return {
  -- Markdown
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   ft = { "markdown" },
  --   build = function() vim.fn["mkdp#util#install"]() end,
  -- },

  -- using Prettier for JS/TS
  -- {
  --   'prettier/vim-prettier',
  --   config = function()
  --     -- auto format
  --     -- vim.cmd([[
  --     --   let g:prettier#autoformat = 1
  --     --   let g:prettier#autoformat_require_pragma = 0
  --     -- ]])

  --     -- 全体
  --     vim.keymap.set("n", "zm", "  :PrettierAsync<cr>")
  --     --VisualModeで部分のみ
  --     vim.keymap.set("v", "zmr", "  :PrettierPartial<cr>")
  --   end
  -- },
  -- Document
  { 'vim-jp/vimdoc-ja' },

}
