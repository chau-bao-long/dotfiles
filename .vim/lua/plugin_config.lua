-- Snippet config
require("cmp_nvim_ultisnips").setup {
  filetype_source = "ultisnips_default",
  show_snippets = "all",
  documentation = function(snippet)
  return snippet.description
  end
}
