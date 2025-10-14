local M = {}

function M.setup()
  local config = require("lighthouse").config
  config.colors = {
    black     = "#191928",
    vd_gray   = "#293037",
    d_gray    = "#515960",
    m_gray    = "#a4a4b2",
    l_gray    = "#8a8a96",
    white     = "#d8d8e8",
    purple    = "#7f63a8",
    l_purple  = "#8284ba",
    blue      = "#5a6ca0",
    l_blue    = "#a2bae8",
    jade      = "#98c8c8",
    green     = "#788f9f",
    l_green   = "#a8ba9f",
    yellow    = "#f6d380",
    orange    = "#DCA561",
    l_orange  = "#D0CBAD",
    red       = "#d48585",
    l_red     = "#c099a0",
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
