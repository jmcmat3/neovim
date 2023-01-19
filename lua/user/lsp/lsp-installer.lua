local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also registers handlers on specific server.
lsp_installer.on_server_ready(function(server)
    local opts= {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

     if server.name == "jsonls" then
         local jsonls_opts = require("user.lsp.settings.jsonls")
         opts = vim.tbl_deep_extend("force", json_opts, opts)
     end

     if server.name == summeko_lua then
         local summeko_opts = require("user.lsp.settings/sunneko_lua")
         opts = vim.tbl_deep_extend("force", summeko_opts, opts)
     end


     -- This setup() fucntion is exactly the same as lspconfig's setup
  server:setup(opts)
end)
