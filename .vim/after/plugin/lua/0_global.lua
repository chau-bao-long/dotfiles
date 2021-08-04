-- Global function
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
    return ...
end

_G.map = vim.api.nvim_set_keymap
