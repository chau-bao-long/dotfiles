-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local opts = { noremap=true, silent=true }

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
    
    -- Key mapping options
    local opts = { buffer = bufnr, silent = true, noremap = true }
    
    -- LSP key mappings
    vim.keymap.set('n', 'gD', function() require("telescope.builtin").lsp_implementations() end, opts)
    vim.keymap.set('n', 'gd', function() require("telescope.builtin").lsp_definitions() end, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>sh', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'ge', function() require("telescope.builtin").lsp_references() end, opts)
    
    -- Formatting mappings (updated API)
    vim.keymap.set('n', '<space>fm', function() vim.lsp.buf.format({ async = true }) end, opts)
    vim.keymap.set('v', '<space>fl', function() vim.lsp.buf.format({ async = true }) end, opts)
  end,
})

local debounce_duration = 200

-- Python LSP
-- npm install -g pyright
vim.lsp.enable('pyright')
vim.lsp.config('pyright', {
  on_attach = on_attach,
  flags = { debounce_text_changes = debounce_duration },
  capabilities = capabilities,
})

-- PHP LSP
-- npm install -g intelephense
vim.lsp.enable('intelephense')
vim.lsp.config('intelephense', {
  on_attach = on_attach,
  flags = { debounce_text_changes = debounce_duration },
  capabilities = capabilities,
})

-- Typescript LSP
-- npm install -g typescript typescript-language-server
vim.lsp.enable('ts_ls')
vim.lsp.config('ts_ls', {
  on_attach = on_attach,
  flags = { debounce_text_changes = debounce_duration },
  capabilities = capabilities,
  init_options = {
    preferences = {
      importModuleSpecifierPreference = "relative"
    }
  }
})

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
vim.lsp.enable('diagnosticls')
vim.lsp.config('diagnosticls', {
  on_attach = on_attach,
  filetypes = vim.tbl_keys(filetypes),
  init_options = {
    filetypes = filetypes,
    linters = linters,
    formatters = formatters,
    formatFiletypes = formatFiletypes
  },
  flags = { debounce_text_changes = debounce_duration },
})

-- Bash LSP
-- npm i -g bash-language-server
vim.lsp.enable('bashls')
vim.lsp.config('bashls', {
  on_attach = on_attach,
  filetypes = { "sh", "zsh" },
  flags = { debounce_text_changes = debounce_duration },
})

-- Yaml LSP
-- yarn global add yaml-language-server
vim.lsp.enable('yamlls')
vim.lsp.config('yamlls', {
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
  capabilities = capabilities,
})

-- Go lang LSP
-- GO111MODULE=on go get golang.org/x/tools/gopls@latest
vim.lsp.enable('gopls')
vim.lsp.config('gopls', {
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
  capabilities = capabilities,
})

-- Ruby LSP
-- gem install --user-install solargraph
vim.lsp.enable('solargraph')
vim.lsp.config('solargraph', {
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
  capabilities = capabilities,
})

-- Vimscript LSP
-- npm install -g vim-language-server
vim.lsp.enable('vimls')
vim.lsp.config('vimls', {
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
  capabilities = capabilities,
})
