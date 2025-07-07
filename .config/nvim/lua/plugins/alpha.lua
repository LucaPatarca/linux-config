return {
    {
        "goolord/alpha-nvim",
        lazy = true,
        event = "VimEnter",
        cmd = "Alpha",
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")
            local icons = require("utils").icons
            local utils = require("utils")
            local datetime = os.date(" %H:%M. ")
            local num_plugins_loaded = require("lazy").stats().loaded

            dashboard.section.header.val = require("utils.alpha-headers")

            dashboard.section.buttons.val = {
              dashboard.button("f", icons.ui.file .. "  New file", "<cmd>enew<CR>"),
              dashboard.button(
                "r",
                icons.ui.project_folder .. "  Recent Projects",
                "<cmd>SessionManager load_session<cr>"
              ),
              dashboard.button(
                "s",
                icons.ui.open_folder .. "  Explorer",
                "<cmd>Neotree action=show position=float action=focus<cr>"
              ),
              dashboard.button(
                "c",
                icons.ui.config .. "  Neovim config",
                "<cmd>e ~/.config/nvim/ | cd %:p:h<cr>"
              ),
              dashboard.button("q", icons.ui.close .. "  Quit NVIM", ":qa<CR>"),
            }

            local footer = {
              type = "text",
              val = { "⚡" .. num_plugins_loaded .. " plugins loaded." },
              opts = { position = "center", hl = "Comment" },
            }

            local bottom_section = {
              type = "text",
              val = "Hi "
                .. utils.get_user()
                .. ","
                .. " It's"
                .. datetime
                .. "How are you doing today?",
              opts = {
                position = "center",
              },
            }

            local section = {
              header = dashboard.section.header,
              bottom_section = bottom_section,
              buttons = dashboard.section.buttons,
              footer = footer,
            }

            local opts = {
              layout = {
                { type = "padding", val = 8 },
                section.header,
                { type = "padding", val = 2 },
                section.buttons,
                { type = "padding", val = 1 },
                section.bottom_section,
                { type = "padding", val = 1 },
                section.footer,
              },
            }

            alpha.setup(opts)
        end
    },
}
