-- basic setting
require('base')
-- deprecated warningを抑止
vim.deprecate = function() end

-- Lazy.nvim
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", -- latest stable release
--     lazypath,
--   })
-- end
-- vim.opt.rtp:prepend(lazypath)

-- require("lazy").setup({
--   spec = {
--     -- import your plugins
--     { import = "plugins" },
--     { import = "plugins.lsp" }
--   },
--   performance = {
--     rtp = {
--       disabled_plugins = {
--         "netrw",
--         "netrwPlugin",
--         "netrwSettings",
--         "netrwFileHandlers",
--       },
--     },
--   },
-- })
