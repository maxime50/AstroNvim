return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim",  enabled = vim.fn.executable "make" == 1, build = "make" },
    { "nvim-telescope/telescope-file-browser.nvim" },
  },
  cmd = "Telescope",
  opts = function()
    local actions = require "telescope.actions"
    local fb_actions = require("telescope").extensions.file_browser.actions
    local get_icon = require("astronvim.utils").get_icon
    return {
      defaults = {
        prompt_prefix = get_icon("Selected", 1),
        selection_caret = get_icon("Selected", 1),
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55 },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = { q = actions.close },
        },
      },
      extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = false,
          select_buffer = true, -- auto focus file from current buffer
          mappings = {
            -- your custom insert mode mappings
            ["i"] = {
              ["<C-w>"] = function() vim.cmd "normal vbd" end,
            },
            ["n"] = {
              -- your custom normal mode mappings
              ["n"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["l"] = actions.select_default,
              ["gh"] = fb_actions.goto_home_dir,
              ["H"] = fb_actions.toggle_hidden,
              ["v"] = fb_actions.toggle_all,
              ["p"] = fb_actions.copy,
              ["m"] = fb_actions.move,
              ["q"] = actions.close,
              ["/"] = function() vim.cmd "startinsert" end,
            },
          },
        },
      },
    }
  end,
  keys = {
    {
      "so",
      function()
        require("telescope").extensions.file_browser.file_browser {
          path = "%:p:h",
          cwd = vim.fn.expand "%:p:h",
          respect_gitignore = false,
          hidden = false,
          grouped = true,
          initial_mode = "normal",
          previewer = false,
          layout_config = { height = 30, width = 80 },
        }
      end,
    },
  },
  config = require "plugins.configs.telescope",
}
