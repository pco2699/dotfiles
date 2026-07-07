-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- ファイルフォーマットの設定
vim.opt.fileformats = { "unix", "dos" }
vim.opt.fileformat = "unix"
-- システムクリップボードを使う
vim.opt.clipboard = "unnamedplus"
-- OSC 52 でクリップボードを同期する (lemonade/win32yank などの外部ツールは不要)
vim.g.clipboard = "osc52"
