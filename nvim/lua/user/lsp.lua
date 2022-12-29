local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'rust_analyzer',
  'pyright',
  'jdtls',
  'clangd',
})

-- Maybe enable this depending on the settings
-- local cmp = require('cmp')
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--   ['<S-tab>'] = cmp.mapping.select_prev_item(cmp_select),
--   ['tab']     = cmp.mapping.select_next_item(cmp_select),
--   ['<C-y>']   = cmp.mapping.confirm({ select = true }),
--   ['<C
-- })

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false }
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "[d", function() vim.lsp.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.lsp.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.references() end, opts)
end)

lsp.setup()
