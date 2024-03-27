local mode_map = {
  ['NORMAL'] = '󰋜',
  ['O-PENDING'] = '󰋜?',
  ['INSERT'] = '󰏫',
  ['VISUAL'] = '󰈈',
  ['V-BLOCK'] = '󰈈',
  ['V-LINE'] = '󰈈',
  ['V-REPLACE'] = '󰈈',
  ['REPLACE'] = '󰛔',
  ['COMMAND'] = '',
  ['SHELL'] = '',
  ['TERMINAL'] = '',
  ['EX'] = 'X',
  ['S-BLOCK'] = 'SB',
  ['S-LINE'] = 'SL',
  ['SELECT'] = 'S',
  ['CONFIRM'] = 'Y?',
  ['MORE'] = 'M',
}

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '',
        section_separators = { left = "", right = '' },
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
        lualine_c = {'branch'},
        lualine_a = {{
            'mode', fmt = function(s) return mode_map[s] or s end,
            padding={right=3, left=2}
        },
        {'filetype', icon_only = true, colored = false, separator = '', padding={right=0, left=1}}, 'filename'

        },
        lualine_b = {},
        lualine_y = {},
        lualine_x = {},
        lualine_z = {{'location'}, {'progress', padding={right=2, left=0}} }
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

