local nvim_lsp = require('lspconfig')
local protocol = require("vim.lsp.protocol")


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>sh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[s', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']s', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local servers = { "intelephense", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end


-- CONFIGURES ICONS NEXT TO COMPLETION ITEMS FOR LSP
-- HOW CAN WE ADD BUFFER ICONS?
-- inspo from onsails/lspkind-nvim
protocol.CompletionItemKind = {
  " Text", -- = 1
  "ƒ Method", -- = 2;
  "ƒ Function", -- = 3; or 
  " Constructor", -- = 4;
  "ƒ Field", -- = 5;
  " Variable", -- = 6;
  " Class", -- = 7;
  "ﰮ Interface", -- = 8;
  " Module", -- = 9;
  " Property", -- = 10;
  " Unit", -- = 11;
  " Value", -- = 12;
  "了Enum", -- = 13;
  " Keyword", -- = 14;
  "﬌ Snippet", -- = 15;
  " Color", -- = 16;
  " File", -- = 17;
  " Reference", -- = 18;
  " Folder", -- = 19;
  " EnumMember", -- = 20;
  " Constant", -- = 21;
  " Struct", -- = 22;
  "ﯓ Event", -- = 23;
  " Operator", -- = 24;
  " TypeParameter", -- = 25;
}


-- Config autocomplete
vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = {
      menu = " [PATH] ",
      priority = 40,
    },
    buffer = { kind = "  ", menu = " [BUFFER] ", priority = 20 },
    calc = { kind = "  " },
    tabnine = {
      max_num_results = 10,
      priority = 9,
      sort = false,
      show_prediction_strength = true,
      max_line = 1000,
    },
    nvim_lsp = { kind = "  ", menu = " [LSP] ", priority = 10 },
    nvim_lua = { kind = "  ", menu = " [LUA] ", priority = 10 },
    tags = false,
    vim_dadbod_completion = true,
    snippets_nvim = { kind = "  " },
    ultisnips = { kind = "  ", menu = " [SNIP] ", priority = 9 },
    treesitter = { kind = "  ", menu = " [TREESITTER] ", priority = 10 },
    emoji = { kind = " ﲃ ", filetypes = { "markdown", "text" } },
    tmux = {
      all_panes = true,
    },
    gql_schema = true,
  };
}

map('i', '<c-space>', 'compe#complete()', {expr = true, noremap = true, silent = true})
map('n', '<c-space>', 'viwA', {noremap = true})
map('i', '<cr>', [[compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))]], {expr = true, noremap = true, silent = true})
map('i', '<tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {expr = true, noremap = true})
map('i', '<s-tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {expr = true, noremap = true})

require("nvim-autopairs.completion.compe").setup({
  map_cr = true,
  map_complete = true,
})
