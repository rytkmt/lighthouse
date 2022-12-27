local M = {}

function M.setup()
  local config = require("lighthouse").config
  config.colors = {
    black     = "#191928", -- col0
    vd_gray   = "#293037", -- col1
    d_gray    = "#515960", -- col2
    m_gray    = "#a4a4b2", -- col3
    l_gray    = "#747480", -- col4
    white     = "#d8d8e8", -- col5
    purple    = "#7f63a8", -- col6
    l_purple  = "#8284ba", -- col7
    blue      = "#5a6ca0", -- col8
    l_blue    = "#a2bae8", -- col9
    jade      = "#98c8c8", -- col10
    green     = "#788f9f", -- col11
    l_green   = "#a8ba9f", -- col12
    yellow    = "#f6d380", -- col13
    orange    = "#DCA561", -- col14
    l_orange  = "#D0CBAD",
    red       = "#d48585", -- col15
    none      = "NONE",
    bold      = "bold",
    underline = "underline",
    italic    = "italic",
    reverse   = "reverse",
    bold_italic = "bold,italic",
    bold_underline = "bold,underline",
  }
end

return M
