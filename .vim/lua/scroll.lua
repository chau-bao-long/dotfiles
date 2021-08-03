require('neoscroll').setup{
  hide_cursor = false
}

local t = {}
t['<c-k>'] = {'scroll', {'-vim.wo.scroll', 'true', '150'}}
t['<c-j>'] = {'scroll', { 'vim.wo.scroll', 'true', '150'}}
t['<c-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '450'}}
t['<c-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450'}}
t['<c-l>'] = {'scroll', {'-0.10', 'false', '80'}}
t['<backspace>'] = {'scroll', { '0.10', 'false', '80'}}
t['zt']    = {'zt', {'150'}}
t['zz']    = {'zz', {'150'}}
t['zb']    = {'zb', {'150'}}

require('neoscroll.config').set_mappings(t)
