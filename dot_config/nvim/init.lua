-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- ファイルフォーマットの設定
vim.opt.fileformats = { "unix", "dos" }
vim.opt.fileformat = "unix"
-- システムクリップボードを使う
vim.opt.clipboard = "unnamedplus"
-- リモート (SSH) セッションのときだけ OSC 52 でクリップボードを同期する。
-- ローカルではネイティブのクリップボードツール (xclip/wl-copy/pbcopy) を自動検出させる
-- (OSC 52 は端末によっては貼り付けに非対応なため)。
if vim.env.SSH_TTY or vim.env.SSH_CONNECTION then
  vim.g.clipboard = "osc52"
end
