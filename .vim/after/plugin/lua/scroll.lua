neoscroll = require('neoscroll')
neoscroll.setup({
  -- Default easing function used in any animation where
  -- the `easing` argument has not been explicitly supplied
  easing = "quadratic"
})
local keymap = {
  -- Use the "sine" easing function
  ["<C-k>"] = function() neoscroll.ctrl_u({ duration = 120; easing = 'sine' }) end;
  ["<C-j>"] = function() neoscroll.ctrl_d({ duration = 120; easing = 'sine' }) end;
  -- When no value is passed the `easing` option supplied in `setup()` is used
  ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor=false; duration = 50 }) end;
  ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor=false; duration = 50 }) end;
}
local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
    vim.keymap.set(modes, key, func)
end
