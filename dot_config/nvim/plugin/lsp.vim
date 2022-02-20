" lua << EOF
" local lspconfig = require("lspconfig")
" local util = require('lspconfig/util')

" local path = util.path

" local function get_python_path(workspace)
"   -- https://github.com/neovim/nvim-lspconfig/issues/500

"   -- Use activated virtualenv.
"   if vim.env.VIRTUAL_ENV then
"     return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
"   end
"   -- Find and use virtualenv from poetry in workspace directory.
"    local match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
"   if match ~= '' then
"     local venv = vim.fn.trim(vim.fn.system('poetry env info -p'))
"     print("Using: ", venv)
"     return path.join(venv, 'bin', 'python')
"   end
"   -- Fallback to system Python.
"   local final = path.join(vim.fn.trim(vim.fn.system('asdf where python')), 'bin', 'python')
"   print("Using: ", final)
"   return final
" end

" local on_attach = function(client)
"   if client.resolved_capabilities.document_formatting then
"     vim.cmd [[augroup Format]]
"     vim.cmd [[autocmd! * <buffer>]]
"     vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()]]
"     vim.cmd [[augroup END]]
"   end
" end

" local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

" -- https://github.com/mattn/efm-langserver
" -- config at .config/efm-langserver/config.yaml
" lspconfig.efm.setup {
"     capabilities = capabilities,
"     cmd = { "efm-langserver" },
"     on_attach = on_attach,
"     init_options = { documentFormatting = true },
"     root_dir = vim.loop.cwd,
"   }


" lspconfig.pyright.setup {
"   on_init = function(client)
"     client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
"   end,
"   }


" --lspconfig.pylsp.setup {
" --  capabilities = capabilities,
" --  cmd = { 'path/to/venv/bin/pylsp' },
" --  on_init = function(client)
" --    client.config.settings.pylsp.plugins.jedi.environment = get_python_path(client.config.root_dir)
" --  end,
" --  settings = {
" --    pylsp = {
" --      plugins = {
" --        pylint = {enabled = true, executable = "path/to/venv/bin/pylint"}
" --        }
" --      }
" --    }
" --  }

" lspconfig.hls.setup{}
" EOF

" nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> grn <cmd>lua vim.lsp.buf.rename()<CR>
" nnoremap <silent> gh <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gca <cmd>lua vim.lsp.buf.code_action()<CR>
" nnoremap <silent> gf <cmd>lua vim.lsp.buf.formatting()<CR>
