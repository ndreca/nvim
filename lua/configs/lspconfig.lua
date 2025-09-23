require("nvchad.configs.lspconfig").defaults()

local nvlsp = require("nvchad.configs.lspconfig")
local on_attach = nvlsp.on_attach
local on_init = nvlsp.on_init
local capabilities = nvlsp.capabilities

local servers = { "html", "cssls", "sourcekit", "ts_ls" }

for _, name in ipairs(servers) do
  vim.lsp.config[name] = vim.tbl_deep_extend("force", vim.lsp.config[name] or {}, {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
end

vim.lsp.config.sourcekit = vim.tbl_deep_extend("force", vim.lsp.config.sourcekit or {}, {
  root_markers = { "compile_commands.json", ".git" },
})

vim.lsp.enable(servers)
