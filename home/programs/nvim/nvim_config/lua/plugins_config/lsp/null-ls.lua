local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    --null_ls.builtins.formatting.stylua,
    --null_ls.builtins.diagnostics.eslint,
    --null_ls.builtins.completion.spell,

    -- Python
    --null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.flake8,
  },
  diagnostics_format = "#{m} (#{s})",
  fallback_severity = vim.diagnostic.severity.INFO
})