
require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = {},
        section_separators = {},
        ignore_focus = { "NvimTree", "neo-tree" },
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
        }
    },
    sections = {
        lualine_c = {{'filetype', icon_only = true, separator = '', padding={right=0, left=1}}, 'filename', 'branch'},
        lualine_a = {{'mode', padding={right=1, left=1}}},
        lualine_b = {''},
        lualine_y = {},
        lualine_x = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
})

