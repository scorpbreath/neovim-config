require('neo-tree').setup({
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            visible = true,
            hijack_netrw = true,
            window = {
                mappings = {
                    ["R"] = function(state)
                        require("neo-tree.command").execute({ action = "close" })
                        require("neo-tree.command").execute({ action = "show", source = "filesystem" })
                    end,
                },
            },
        },
    },
    window = {
        width = 30,     -- задаёт ширину панели, можно уменьшить или увеличить
    },
})
