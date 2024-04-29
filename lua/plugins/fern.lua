
return {

  {
    'lambdalisue/fern.vim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g["fern#renderer"] = "nerdfont"

      vim.g["fern#default_hidden"]= 1

      vim.cmd([[
      augroup my-glyph-palette
        autocmd! *
        autocmd FileType fern call glyph_palette#apply()
        autocmd FileType nerdtree,startify call glyph_palette#apply()
      augroup END

      ]])

      vim.keymap.set('n','<C-n>',':Fern . -reveal=%<CR>',{silent = true,noremap = true})
    end
  }, 
  {'lambdalisue/nerdfont.vim'},
  {'lambdalisue/glyph-palette.vim'},
  {'lambdalisue/fern-renderer-nerdfont.vim'},
}