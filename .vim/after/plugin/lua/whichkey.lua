require'which-key'.setup({
  preset = "helix",
  delay = function(ctx)
    if string.find(ctx.keys, "^<Space>") or ctx.keys == "\\" then
      return 200
    else
      return 800
    end
  end,
  spec = {
    -- non-group
    { "<s-k>", ":lua require'common'.resize_visual_area('collapse')<cr>", mode = "v" },
    { "<s-j>", ":lua require'common'.resize_visual_area('expand')<cr>", mode = "v" },
    { "<space><space>", "<cmd>CommonActions<cr>", desc = "Show common actions" },
    { "<space>se", "<cmd>DatabaseActions<cr>", desc = "Show database actions" },
    { "<space>k", "<cmd>FileTypeActions<cr>", desc = "Show actions base on file type" },
    { "s", "<Plug>Sneak_s" },
    { "S", "<Plug>Sneak_S" },
    { "f", "<Plug>Sneak_f" },
    { "F", "<Plug>Sneak_F" },
    { "t", "<Plug>Sneak_t" },
    { "T", "<Plug>Sneak_T" },
    { "<silent>gl", ":BufferLineCycleNext<CR>" },
    { "<silent>gh", ":BufferLineCyclePrev<CR>" },
    { "<space>ea", "<Plug>(EasyAlign)", mode = "x" },
    { "<space>ea", "<Plug>(EasyAlign)" },
    { "<space>sl", ":SidewaysJumpRight<cr>", noremap = true },
    { "<space>sh", ":SidewaysJumpLeft<cr>", noremap = true },
    { "<space>sL", ":SidewaysRight<cr>", noremap = true },
    { "<space>sH", ":SidewaysLeft<cr>", noremap = true },
    { "<space>st", ":DBSelectTable<cr>", noremap = true },
    { "<space>sd", ":DBDescribeTables<cr>", noremap = true },
    { "<space>jk", ":AnyJump<CR>", noremap = true },
    { "<space>jl", ":AnyJumpLastResults<CR>", noremap = true },
    { "<space>jc", ":AnyJumpVisual<CR>", noremap = true, mode = "x" },
    { "ss", "<Plug>VSurround", mode = "x" },
    { "ss", "<Plug>Csurround" },
    { "ds", "<Plug>Dsurround" },
    { "<space>ra", "y:CtrlSF <c-r>0<cr>", desc = "Find & Replace text in all files", noremap = true, mode = "v" },
        
    -- ai integration
    { "<space>a", group = "AI integration" },
    { "<space>ae", "<cmd>CodeCompanionActions<cr>", desc = "Show AI actions", noremap = true, silent = true, mode = { "n", "v" } },
    { "<space>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toogle AI chat", noremap = true, silent = true, mode = { "n", "v" } },
    { "<space>aa", "<cmd>CodeCompanionChat Add<cr>", desc = "Add file to AI chat", noremap = true, silent = true, mode = { "v" } },
    { "<space>aa", ":!vectorcode vectorise %:p<cr>", desc = "Add file to VectorCode", noremap = true, silent = true, mode = { "n" } },
    { "<space>ar", ":VectorCode register<cr>", desc = "Register buffer to VectorCode", noremap = true, silent = true, mode = { "n" } },
    { "<space>au", ":VectorCode unregister<cr>", desc = "Unregister buffer from VectorCode", noremap = true, silent = true, mode = { "n" } },

    -- float terminal
    { "<space>y", ":FloatermToggle!<cr>", noremap = true },
    { "<space>;", ":FloatermNew<cr>", noremap = true },
    { "<space>t", group = "float termimal" },
    { "<space>te", ":FloatermNew quickrun<cr>", noremap = true },
    { "<space>tp", ":FloatermNew quickpass<cr>", noremap = true },
    { "<space>tr", ":FloatermNew ranger<cr>", noremap = true },
    { "<space>tn", ":FloatermNew nnn<cr>", noremap = true },
    { "<space>tg", ":FloatermNew lazygit<cr>", noremap = true },
    { "<space>td", ":FloatermNew lazydocker<cr>", noremap = true },
    { "<space>th", ":FloatermNew htop<cr>", noremap = true },
    { "<space>ty", ":FloatermNew ytop<cr>", noremap = true },
    { "<space>tcn", ":FloatermNew node<cr>", noremap = true },
    { "<space>tcp", ":FloatermNew python<cr>", noremap = true },
    { "<space>tch", ":FloatermNew kubectl exec -it $(kubectl get pod -l app.kubernetes.io/name=web -o=jsonpath='{$.items[:1].metadata.name}') -- php artisan tinker<cr>", noremap = true },
    { "<space>tck", ":FloatermNew kotlin<cr>", noremap = true },
    { "<space>tks", ":FloatermNew watch kubectl get pod -owide -A<cr>", noremap = true },

    -- note taking
    { "<space>n", group = "note" },
    { "<space>no", ":ObsidianOpen<cr>", desc = "Open macos app" },
    { "<space>ne", ":ObsidianQuickSwitch<cr>",  desc = "Open a note" },
    { "<space>nw", ":ObsidianWorkspace<cr>",  desc = "Change note workspace" },
    { "<space>ns", ":ObsidianSearch<cr>",  desc = "Search in notes" },
    { "<space>nl", ":ObsidianTOC<cr>",  desc = "Find header in a note" },
    { "<space>nr", ":ObsidianRename<cr>",  desc = "Rename a note" },
    { "<space>nn", ":ObsidianNew<cr>",  desc = "Create a new note" },

    -- git
    { "<space>g", group = "git" },
    { "<space>gl", ":Gclog -n 100<cr>", desc = "Show recent 100 git logs", noremap = true },
    { "<space>gL", ":Gclog<cr>", desc = "Show git logs ", noremap = true },
    { "<space>g0l", ":0Gclog -n 100<cr>", desc = "Show current file recent 100 git logs", noremap = true },
    { "<space>g0L", ":0Gclog<cr>", desc = "Show current file git logs", noremap = true },
    { "<space>gD", ":Gvdiffsplit!<cr>", desc = "Conflict merge git diff", noremap = true },
    { "<space>gpr", ":Ggrep ", desc = "Git grep", noremap = true },
    { "<space>gr", ":Gread! ", desc = "Git read", noremap = true },
    { "<space>gw", ":Gwrite<cr>", desc = "Git write", noremap = true },
    { "<space>gba", ":Git blame<cr>", desc = "Git blame all lines", noremap = true },
    { "<space>gbr", ":GBrowse<cr>", desc = "Open git file on web browser", noremap = true },
    { "<space>ge", ":Gedit ", desc = "Git edit", noremap = true },
    { "<space>gpu", ":Gpush<cr>", desc = "Git push", noremap = true },
    { "<space>gpf", ":Gpush -f<cr>", desc = "Git push force", noremap = true },
    { "<space>gfo", ":Gfetch origin<cr>", desc = "Git fetch origin", noremap = true },
    { "<space>gpl", ":Gpull<cr>", desc = "Git pull", noremap = true },
    { "<space>go", ":DiffviewOpen<cr>", desc = "Open git diff explore", noremap = true },
    { "<space>gO", ":DiffviewOpen HEAD", desc = "Open git HEAD diff explore", noremap = true },
    { "<space>gc", ":DiffviewClose<cr>", desc = "Close git diff explore", noremap = true },
    { "<space>gd", package.loaded.gitsigns.diffthis, desc = "Compare git diff current file", noremap = true },
    { "<space>gbl", function() package.loaded.gitsigns.blame_line{full=true} end, desc = "Git blame a line", noremap = true },
    { "<space>gs", function() package.loaded.gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, desc = "Stage git hunk", noremap = true, mode = "v" },
    { "<space>gr", function() package.loaded.gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, desc = "Reset git hunk", noremap = true, mode = "v" },

    { "]c", function()
      if vim.wo.diff then return ']c' end
      local gs = package.loaded.gitsigns
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, desc = "Next change in file" },

    { "[c", function()
      if vim.wo.diff then return '[c' end
      local gs = package.loaded.gitsigns
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, desc = "Previous change in file" },

    -- tree
    { "<space>5", "<cmd>UndotreeToggle<cr>", desc = "Toggle undo tree", noremap = true },
    { "<space>h", "<cmd>NvimTreeFindFile<cr>", desc = "Open file explorer", noremap = true },
    { "<space>H", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer", noremap = true },

    -- fuzzy search
    { "Q", ":Rg <c-r><c-w><cr>", desc = "Ripgrep search", noremap = true },
    { "Q", "y:Rg <c-r>0<cr>", desc = "Ripgrep search", noremap = true, mode ="x" },
    { "<space>q", ":Rg<cr>", desc = "Ripgrep search", noremap = true },
  }
})
