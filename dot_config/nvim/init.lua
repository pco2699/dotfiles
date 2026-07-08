-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- ファイルフォーマットの設定
vim.opt.fileformats = { "unix", "dos" }
vim.opt.fileformat = "unix"
-- システムクリップボードを使う
vim.opt.clipboard = "unnamedplus"
-- WSL では xclip/wl-copy が使えないので win32yank.exe 経由で Windows のクリップボードを使う。
if vim.env.WSL_DISTRO_NAME then
  vim.g.clipboard = {
    name = "win32yank",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
-- リモート (SSH) セッションのときだけ OSC 52 でクリップボードを同期する。
-- ローカルではネイティブのクリップボードツール (xclip/wl-copy/pbcopy) を自動検出させる
-- (OSC 52 は端末によっては貼り付けに非対応なため)。
elseif vim.env.SSH_TTY or vim.env.SSH_CONNECTION then
  vim.g.clipboard = "osc52"
end
