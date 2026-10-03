return {
    enabled = true,
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter"
    },
    opts = {
        interactions = {
            chat = {
                adapter = {
                    name = "ollama",
                    model = "qwen3.8:latest",
                },
            },
            inline = {
                adapter = {
                    name = "ollama",
                    model = "qwen3.8:latest",
                },
            },
        },
        adapters = {
            ollama = function()
                return require('codecompanion.adapters').extend('ollama', {
                    schema = {
                        model = { default = "qwen3.8:latest" },
                    }
                })
            end,
        },
    },
    keys = {
      { "<leader>ac", mode = "n", function() require("codecompanion").chat() end, desc = "AI Chat" },
      { "<leader>aC", mode = "n", function() require("codecompanion").chat({ position = "window", split = true }) end, desc = "Chat (window)" },
      { "<leader>ai", mode = "v", function() require("codecompanion").inline() end, desc = "Inline (selection)" },
      { "<leader>ad", mode = "n", function() require("codecompanion").explain() end, desc = "Explain" },
      { "<leader>ah", mode = "n", function() require("codecompanion").act({ action = "humanize" }) end, desc = "Humanize" },
    },
}
