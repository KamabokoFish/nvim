
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.number = true
vim.wo.number = true
vim.wo.relativenumber = false
vim.opt.mouse = 'a'
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true -- 検索直後に画面が変遷する
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.laststatus = 3 -- 分割時にstatusineを一つだけにする
vim.opt.scrolloff = 10
vim.opt.shell = 'fish'
vim.opt.inccommand = 'split'
vim.opt.smarttab = true
vim.opt.breakindent = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 0

vim.opt.wrap = true
vim.opt.helplang = 'ja'
vim.opt.updatetime = 300
vim.opt.showtabline = 1 -- barbar.nvimを用いる場合、値を1に設定しておかないと起動時に一瞬空のBufferがちらつく
vim.opt.clipboard = 'unnamedplus'
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.wrap = true


-- 不可視文字を表示(colorscheme用)
-- markdown用の初期設定を無効にする(これ設定しないとprettierでフォーマットしたときがややこしい)
vim.cmd([[
set listchars=tab:»-,nbsp:%,eol:↲
]])

vim.g.markdown_recommended_style = 0
vim.opt.list = false

-- Leader Key
vim.g.mapleader = ','

local keymap = vim.keymap

-- 新規タブ
keymap.set("n", "te", ":tabedit")
-- keymap.set("n", "<tab>", ":tabnext<Return>", opts)
-- keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- 画面分割
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- アクティブウィンドウの移動
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sl', '<C-w>l')

-- 折返し時に論理行ではなく物理行で移動する
keymap.set('n', 'j', 'gj')
keymap.set('n', 'k', 'gk')

-- Emacs風
keymap.set('i', '<C-f>', '<Right>')
-- jjでEscする
keymap.set('i', 'jj', '<Esc>')

-- 保存のショートカット
keymap.set('n', '<C-t>', ':w<CR>')

-- 設定ファイルを開く
keymap.set('n', '<F1>', ':edit $MYVIMRC<CR>')

-- -- -- ハイライトを全て非表示にする
keymap.set('n', '<leader><ESC>', ':noh<CR>')
