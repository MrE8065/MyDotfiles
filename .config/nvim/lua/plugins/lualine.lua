return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'pywal',
                component_separators = '',
                section_separators = { left = '', right = '' },
                component_separators = {'', ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = false,
                refresh = {
                    statusline = 100,
                    tabline = 100,
                    winbar = 100,
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch'},
                lualine_c = {},
                lualine_x = {'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                  {
                    'buffers',
                    show_filename_only = true,
                    hide_filename_extensions = false,
                    show_modified_status = true,
                    
                    mode = 2,
                    
                    max_length = vim.o.columns * 80/100,
                    filetype_names = {
                      TelescopePrompt = 'Telescope',
                      dashboard = 'Dashboard',
                      fzf = 'FZF',
                      alpha = 'Alpha'
                    },
                    
                    use_mode_colors = false,

                    buffers_colors = {
                      active = 'lualine_{section}_normal',
                      inactive = 'lualine_{section}_inactive'
                    },
                    
                    symbols = {
                      modified = ' ●',
                      alternate_file = '#',
                      directory = '',
                    }
                  }
                },
                lualine_x = {
                  {
                    'tabs',
                    mode = 0,
                    max_length = vim.o.columns / 3,
                  }
                },
                lualine_y = {},
                lualine_z = {},
            },
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }	end,
}


