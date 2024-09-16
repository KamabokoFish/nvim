return {
  {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
      -- Some servers have issues with backup files, see #649
      vim.opt.writebackup = false
      -- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
      -- delays and poor user experience
      vim.opt.updatetime = 300

      -- Always show the signcolumn, otherwise it would shift the text each time
      -- diagnostics appeared/became resolved
      -- base.luaのほうに記載
      -- vim.opt.signcolumn = "yes"

      local keyset = vim.keymap.set

      -- Autocomplete
      function _G.check_back_space()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
      end

      -- Use Tab for trigger completion with characters ahead and navigate
      local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

      keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
        opts)
      keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

      -- Make <CR> to accept selected completion item or notify coc.nvim to format
      -- <C-g>u breaks current undo, please make your own choice
      -- これ、nvim-autopairsを入れてると抵触して機能しない
      -- coc.nvimの補完と相性が悪い(相性の良い代替としてcoc-pairsがある)
      -- nvim-autopairsを使う場合は、Enter(<CR>)での補完決定は設定しないほうがよい
      -- デフォルトはCtrl-yで決定
      -- keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

      -- Use <c-j> to trigger snippets
      -- keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
      -- Use <c-space> to trigger completion
      keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })

      -- GoTo code navigation
      -- 現在はtelescope-cocで代替
      -- keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
      -- keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
      -- keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
      -- keyset("n", "gr", "<Plug>(coc-references)", {silent = true})


      -- Use K to show documentation in preview window
      function _G.show_docs()
        local cw = vim.fn.expand('<cword>')
        if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
          vim.api.nvim_command('h ' .. cw)
        elseif vim.api.nvim_eval('coc#rpc#ready()') then
          vim.fn.CocActionAsync('doHover')
        else
          vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
        end
      end

      keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })

      -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
      vim.api.nvim_create_augroup("CocGroup", {})
      vim.api.nvim_create_autocmd("CursorHold", {
        group = "CocGroup",
        command = "silent call CocActionAsync('highlight')",
        desc = "Highlight symbol under cursor on CursorHold"
      })

      -- Setup formatexpr specified filetype(s)
      vim.api.nvim_create_autocmd("FileType", {
        group = "CocGroup",
        pattern = "typescript,json",
        command = "setl formatexpr=CocAction('formatSelected')",
        desc = "Setup formatexpr specified filetype(s)."
      })

      -- Update signature help on jump placeholder
      vim.api.nvim_create_autocmd("User", {
        group = "CocGroup",
        pattern = "CocJumpPlaceholder",
        command = "call CocActionAsync('showSignatureHelp')",
        desc = "Update signature help on jump placeholder"
      })

      -- Apply codeAction to the selected region
      -- Example: `<leader>aap` for current paragraph

      local opts = { silent = true, nowait = true }

      -- Symbol renaming
      keyset("n", "rn", "<Plug>(coc-rename)", { silent = true })
      keyset("n", "rma", "<Plug>(coc-codeaction-selected)j", opts)
      -- Run the Code Lens actions on the current line
      keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)
      -- Use `[g` and `]g` to navigate diagnostics
      -- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
      keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
      keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

      -- Remap <C-f> and <C-b> to scroll float windows/popups
      ---@diagnostic disable-next-line: redefined-local
      local opts = { silent = true, nowait = true, expr = true }
      keyset("i", "<C-d>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : ""', opts)
      keyset("i", "<C-u>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : ""', opts)
      keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
      keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
      -- keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
      -- keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

      -- " Add `:Fold` command to fold current buffer
      vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })

      -- Add `:OR` command for organize imports of the current buffer
      vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

      -- Add (Neo)Vim's native statusline support
      -- NOTE: Please see `:h coc-status` for integrations with external plugins that
      -- provide custom statusline: lightline.vim, vim-airline
      vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

      -- Coc.nvimの組み込みFormatter
      -- Language Serverを用いたFormat
      vim.api.nvim_create_user_command("Format", "call CocAction('format')", {}) --コマンドを登録
      keyset("n", "zn", ":Format<cr>", { silent = false })

      -- prettier(coc-prettier)
      -- MEMO:coc-prettierでグローバルのprettierを使おうとすると、毎回ポップアップがでてしまう
      -- 2023/02/02現在はvim-prettierを使用(vim-prettier.rc.luaを参照)

      -- keyset("n","<leader>mm",":<C-u>CocCommand prettier.forceFormatDocument<cr>")

      -- Daily Use Coc-Extensions
      vim.g.coc_global_extensions = { 'coc-html', 'coc-emmet', 'coc-json', 'coc-css', 'coc-yaml', 'coc-yank',
        'coc-vimlsp',
        'coc-tsserver', 'coc-eslint', 'coc-rust-analyzer', 'coc-sumneko-lua', '@yaegassy/coc-tailwindcss3',
        '@yaegassy/coc-astro',
        'coc-clangd', 'coc-docker', 'coc-snippets' }
    end
  },
  -- coc-snipet用
  -- { 'mlaursen/vim-react-snippets' },

  {
    'dsznajder/vscode-es7-javascript-react-snippets',
    build = 'yarn install --frozen-lockfile && yarn compile'
  }

}
