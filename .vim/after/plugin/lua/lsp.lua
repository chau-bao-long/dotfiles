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
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<cr>', opts)
  buf_set_keymap('n', 'Gd', ':Lspsaga preview_definition<cr>', opts)
  buf_set_keymap('n', 'K', ':Lspsaga hover_doc<cr>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  buf_set_keymap('n', '<space>sh', ':Lspsaga signature_help<cr>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  buf_set_keymap('n', '<space>rn', ':Lspsaga rename<cr>', opts)
  buf_set_keymap('n', '<space>ca', ':Lspsaga code_action<cr>', opts)
  buf_set_keymap('v', '<space>ca', ':<c-u>Lspsaga range_code_action<cr>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gh', ':Lspsaga lsp_finder<cr>', opts)
  buf_set_keymap('n', '<leader>e', ':Lspsaga show_line_diagnostics<cr>', opts)
  buf_set_keymap('n', '[s', ':Lspsaga diagnostic_jump_next<cr>', opts)
  buf_set_keymap('n', ']s', ':Lspsaga diagnostic_jump_prev<cr>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', opts)
  buf_set_keymap("n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
  buf_set_keymap("v", "<space>fl", "<cmd>lua vim.lsp.buf.range_formatting()<cr>", opts)
end

-- npm install -g pyright
require'lspconfig'.pyright.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}

-- npm install -g intelephense
require'lspconfig'.intelephense.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}

-- npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        on_attach(client)
    end
}

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
    }
}

-- brew install hashicorp/tap/terraform-ls
require'lspconfig'.terraformls.setup{
  on_attach = on_attach,
  filetypes = { "terraform", 'tf' },
  root_dir = require("lspconfig/util").root_pattern(".terraform", ".git")
}

-- npm i -g bash-language-server
require'lspconfig'.bashls.setup{
  on_attach = on_attach,
  filetypes = { "sh", "zsh" },
}

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
}

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
}

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
}

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
}

-- npm i -g vscode-langservers-extracted
require'lspconfig'.jsonls.setup {
    on_attach = on_attach,
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
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
    vsplit = "s",
    split = "i",
    quit = "<esc>",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>", -- quit can be a table
  },
  code_action_keys = {
    quit = "<esc>",
    exec = "o",
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<cr>", -- quit can be a table
  },
  definition_preview_icon = "  ",
  border_style = "single", -- or double
  rename_prompt_prefix = '➤',
})
