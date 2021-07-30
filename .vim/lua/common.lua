-- Global function
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
    return ...
end

-- Common module
local M = {}

-- Expand or collapse visual area
-- [resize_type] expand/collapse
function M.resize_visual_area(resize_type)
  local delta = resize_type == "expand" and 1 or -1
  vim.fn.setpos("'<", {vim.fn.bufnr(), vim.fn.getpos("'<")[2] - delta, 0})
  vim.fn.setpos("'>", {vim.fn.bufnr(), vim.fn.getpos("'>")[2] + delta, 9999})
  vim.api.nvim_command("normal! gv")
end

return M
