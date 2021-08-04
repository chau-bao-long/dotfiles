require('nvim-autopairs').setup{
  disable_filetype = { "TelescopePrompt" , "vim" },
  enable_check_bracket_line = false,
}

local npairs = require('nvim-autopairs')
_G.MUtils= {}

MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    return npairs.esc("<cr>")
  else
    return npairs.autopairs_cr()
  end
end

map('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
