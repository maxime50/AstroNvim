return {
  {
    "williamboman/mason.nvim",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
      "MasonUpdate",    -- AstroNvim extension here as well
      "MasonUpdateAll", -- AstroNvim specific
    },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_uninstalled = "✗",
          package_pending = "⟳",
        },
      },
      ensure_installed = {
        "css-lsp",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "eslint-lsp",
        "hadolint",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "marksman",
        "prettier",
        "selene",
        "shellcheck",
        "shfmt",
        "stylelint",
        "stylua",
        "svelte-language-server",
        "tailwindcss-language-server",
        "typescript-language-server",
        "vim-language-server",
        "yaml-language-server",
      },
    },
    build = ":MasonUpdate",
    config = require "plugins.configs.mason",
  },
}
