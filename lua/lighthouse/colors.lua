local M = {}

function M.setup()
  local config = require("lighthouse").config
  config.colors = {
    black     = "#191928", -- col0
    vd_gray   = "#293239", -- col1
    d_gray    = "#515960", -- col2
    m_gray    = "#a4a4b2", -- col3
    l_gray    = "#747480", -- col4
    white     = "#e4dee8", -- col5
    purple    = "#605a94", -- col6
    l_purple  = "#888abf", -- col7
    blue      = "#5868a6", -- col8
    l_blue    = "#819cdf", -- col9
    jade      = "#98c0c8", -- col10
    green     = "#728a7f", -- col11
    l_green   = "#b4be96", -- col12
    yellow    = "#ead080", -- col13
    orange    = "#cfa686", -- col14
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
