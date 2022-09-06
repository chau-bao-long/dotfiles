require('neoscroll').setup{
  hide_cursor = false
}

local t = {}
t['<c-k>'] = {'scroll', {'-vim.wo.scroll', 'true', '0'}}
t['<c-j>'] = {'scroll', { 'vim.wo.scroll', 'true', '0'}}
t['<c-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '0'}}
t['<c-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '0'}}
t['<c-l>'] = {'scroll', {'-0.10', 'false', '0'}}
t['<backspace>'] = {'scroll', { '0.10', 'false', '0'}}
t['zt']    = {'zt', {'0'}}
t['zz']    = {'zz', {'0'}}
t['zb']    = {'zb', {'0'}}

require('neoscroll.config').set_mappings(t)
