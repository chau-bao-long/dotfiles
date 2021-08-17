local nvim_lsp = require('lspconfig')
local protocol = require("vim.lsp.protocol")


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', opts)
  buf_set_keymap('n', 'gp', '<cmd>Lspsaga preview_definition<cr>', opts)
  buf_set_keymap('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<cr>', opts)
  buf_set_keymap('n', '<space>sh', '<cmd>Lspsaga signature_help<cr>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>Lspsaga rename<cr>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>Lspsaga code_action<cr>', opts)
  buf_set_keymap('v', '<space>ca', '<cmd><c-u>Lspsaga range_code_action<cr>', opts)
  buf_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gr', "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)
  buf_set_keymap('n', '<leader>e', '<cmd>Lspsaga show_line_diagnostics<cr>', opts)
  buf_set_keymap('n', ']s', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
  buf_set_keymap('n', '[s', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', opts)
  buf_set_keymap("n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
  buf_set_keymap("v", "<space>fl", "<cmd>lua vim.lsp.buf.range_formatting()<cr>", opts)
end

local debounce_duration = 200

-- Python LSP
-- npm install -g pyright
require'lspconfig'.pyright.setup {
  on_attach = on_attach,
  flags = { debounce_text_changes = debounce_duration },
}

-- PHP LSP
-- npm install -g intelephense
require'lspconfig'.intelephense.setup {
  on_attach = on_attach,
  flags = { debounce_text_changes = debounce_duration },
}

-- Typescript LSP
-- npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end,
  flags = { debounce_text_changes = debounce_duration },
}

-- Diagnostic LSP
-- yarn global add diagnostic-languageserver
local filetypes = {
  typescript = "eslint",
  typescriptreact = "eslint",
}
local linters = {
  eslint = {
    sourceName = "eslint",
    command = "eslint_d",
    rootPatterns = {".eslintrc.js", "package.json"},
    debounce = 100,
    args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
    parseJson = {
      errorsRoot = "[0].messages",
      line = "line",
      column = "column",
      endLine = "endLine",
      endColumn = "endColumn",
      message = "${message} [${ruleId}]",
      security = "severity"
    },
    securities = {[2] = "error", [1] = "warning"}
  }
}
local formatters = {
  prettier = {command = "prettier", args = {"--stdin-filepath", "%filepath"}}
}
local formatFiletypes = {
  typescript = "prettier",
  typescriptreact = "prettier"
}
require'lspconfig'.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = vim.tbl_keys(filetypes),
  init_options = {
    filetypes = filetypes,
    linters = linters,
    formatters = formatters,
    formatFiletypes = formatFiletypes
  },
  flags = { debounce_text_changes = debounce_duration },
}

-- Lua LSP
-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local sumneko_root_path = '/Users/topcbl/Projects/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  on_attach = on_attach,
  flags = { debounce_text_changes = debounce_duration },
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Terraform LSP
-- brew install hashicorp/tap/terraform-ls
require'lspconfig'.terraformls.setup{
  on_attach = on_attach,
  filetypes = { "terraform", 'tf' },
  root_dir = require("lspconfig/util").root_pattern(".terraform", ".git"),
  flags = { debounce_text_changes = debounce_duration },
}

-- Bash LSP
-- npm i -g bash-language-server
require'lspconfig'.bashls.setup{
  on_attach = on_attach,
  filetypes = { "sh", "zsh" },
  flags = { debounce_text_changes = debounce_duration },
}

-- Yaml LSP
-- yarn global add yaml-language-server
require'lspconfig'.yamlls.setup{
  on_attach = on_attach,
  filetypes = { "yaml", "yml" },
  settings = {
    yaml = {
      format = {
        enable = true,
        singleQuote = false,
        bracketSpacing = true,
      },
      editor = {
        tabSize = 2,
      },
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "ci.yml",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.yml",
      },
    },
  },
  flags = { debounce_text_changes = debounce_duration },
}

-- Go lang LSP
-- GO111MODULE=on go get golang.org/x/tools/gopls@latest
require'lspconfig'.gopls.setup {
  on_attach = on_attach,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
  flags = { debounce_text_changes = debounce_duration },
}

-- Ruby LSP
-- gem install --user-install solargraph
require'lspconfig'.solargraph.setup{
  on_attach = on_attach,
  filetypes = { "ruby", "rb" },
  init_options = {
    formatting = true,
  },
  settings = {
    solargraph = {
      diagnostics = true,
    },
  },
  flags = { debounce_text_changes = debounce_duration },
}

-- Vimscript LSP
-- npm install -g vim-language-server
require'lspconfig'.vimls.setup{
  on_attach = on_attach,
  init_options = {
    diagnostic = {
      enable = true
    },
    indexes = {
      count = 3,
      gap = 100,
      projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
      runtimepath = true
    },
    iskeyword = "@,48-57,_,192-255,-#",
    runtimepath = "",
    suggest = {
      fromRuntimepath = true,
      fromVimruntime = true
    },
    vimruntime = ""
  },
  root_dir = function(fname)
    return vim.fn.getcwd()
  end,
  flags = { debounce_text_changes = debounce_duration },
}

-- Json LSP
-- npm i -g vscode-langservers-extracted
require'lspconfig'.jsonls.setup {
  on_attach = on_attach,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  },
  flags = { debounce_text_changes = debounce_duration },
}


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


-- Config auto-complete
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
      priority = 20,
    },
    buffer = { kind = "  ", menu = " [BUFFER] ", priority = 15 },
    tabnine = {
      max_num_results = 10,
      priority = 9,
      sort = false,
      show_prediction_strength = true,
      max_line = 100,
    },
    nvim_lsp = { kind = "  ", menu = " [LSP] ", priority = 10 },
    nvim_lua = { kind = "  ", menu = " [LUA] ", priority = 10 },
    tags = false,
    vim_dadbod_completion = true,
    snippets_nvim = { kind = "  " },
    ultisnips = { kind = "  ", menu = " [SNIP] ", priority = 9 },
    treesitter = { kind = "  ", menu = " [TREESITTER] ", priority = 10 },
    tmux = {
      all_panes = true,
    },
    gql_schema = true,
  };
}

-- Auto-complete mapping
map('i', '<c-space>', 'compe#complete()', {expr = true, noremap = true, silent = true})
map('n', '<c-space>', 'viwA', {noremap = true})
map('i', '<cr>', [[compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))]], {expr = true, noremap = true, silent = true})
map('i', '<tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {expr = true, noremap = true})
map('i', '<s-tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {expr = true, noremap = true})

require("nvim-autopairs.completion.compe").setup({
  map_cr = true,
  map_complete = true,
})

-- Build LSP UI
require("lspsaga").init_lsp_saga({
  code_action_icon = "💡",
  use_saga_diagnostic_sign = true,
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  dianostic_header_icon = "   ",
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = true,
  },
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  max_preview_lines = 50, -- preview lines of lsp_finder and definition preview
  finder_action_keys = {
    open = "o",
    vsplit = "v",
    split = "s",
    quit = "<esc>",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = {
    quit = "<esc>",
    exec = "<cr>",
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<cr>", -- quit can be a table
  },
  definition_preview_icon = "  ",
  border_style = "single", -- or double
  rename_prompt_prefix = '➤',
})
