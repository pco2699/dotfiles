-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- ファイルフォーマットの設定
vim.opt.fileformats = { "unix", "dos" }
vim.opt.fileformat = "unix"

vim.g.clipboard = {
  name = "WslClipboard",
  copy = {
    ["+"] = "clip.exe",
    ["*"] = "clip.exe",
  },
  paste = {
    ["+"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ["*"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = 0,
}
