return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      clangd = function(_, _)
        require("lspconfig").clangd.setup({
          settings = {
            arguments = { "--enable-config" },
          },
        })
      end,
    },
  },
}
