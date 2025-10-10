-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- ファイルフォーマットの設定
vim.opt.fileformats = { "unix", "dos" }
vim.opt.fileformat = "unix"
-- システムクリップボードを使う
vim.opt.clipboard = "unnamedplus"
