local map = vim.keymap.set

-- Go to definition (<F2>)
map("n", "<F2>", "<cmd> lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true } )
map("i", "<F2>", "<cmd> lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true } )

-- Next highlighted errors (Shifth + <F2>)
map("n", "<F14>", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true } )
map("i", "<F14>", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true } )

-- Previous highlighted errors (Shifth + <F2>)
map("n", "<F26>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true } )
map("i", "<F26>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true } )

-- Add/Remove line or block comment (Ctrl + /)
map("n", "<C-t>", require('whitespace-nvim').trim, { noremap = true, silent = true } )

-- Comments
map("n", "<C-k>","<Plug>(comment_toggle_linewise_current)", { noremap = true, silent = true })
map("v", "<C-k>","<Plug>(comment_toggle_linewise_visual)", { noremap = true, silent = true })

-- Rename
map("n", "<C-r>", "<cmd>lua require('renamer').rename()<cr>", { noremap = true, silent = true } )

-- Open NeoTree (F4)
map("n", "<F4>", "<cmd>Neotree toggle<cr>", { noremap = true, silent = true } )

-- Lazy (SPACE + l)
map("n", "<leader>l", "<cmd>Lazy<cr>", { noremap = true, silent = true })

-- Mason (SPACE + cm)
map("n", "<leader>cm", "<cmd>Mason<cr>", { noremap = true, silent = true })

-- Trouble
-- Document diagnostics
map("n", "<F3>", "<cmd>TroubleToggle document_diagnostics<cr>", { noremap = true, silent = true })
-- Workspace diagnostics

-- Save file (CTRL + S)
map("n", "<C-s>", "<cmd>w<cr><esc>",  { noremap = true, silent = true })
map("i", "<C-s>", "<cmd>w<cr><esc>",  { noremap = true, silent = true })

-- Indent
map("v", "<", "<gv",  { noremap = true, silent = true })
map("v", ">", ">gv",  { noremap = true, silent = true })

-- Telescope
map("n", "<C-f>", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
map("n", "<leader>:", "<cmd>Telescope command_history<cr>", { noremap = true, silent = true })
map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { noremap = true, silent = true })
map("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>", { noremap = true, silent = true })

-- Terminal
map("n", "<F5>","<cmd>ToggleTerm<cr>", { noremap = true, silent = true })

