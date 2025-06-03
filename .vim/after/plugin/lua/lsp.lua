-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local opts = { noremap=true, silent=true }

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Do nothing if cannot get buffer number
  if bufnr == nil then return end

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>sh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>fm', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>fl', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
end

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
