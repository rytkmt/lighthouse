local M = {}

function M.mapping()
  local config = require("lighthouse").config
  local colors = config.colors

  local mapping = {
    TelescopeSelection = { fg = colors.white, bg = colors.vd_gray, style = colors.underline },
    TelescopeSelectionCaret = { fg = colors.yellow, bg = colors.vd_gray, style = colors.underline },
    TelescopePreviewLine = { style = colors.underline },
    TelescopeBorder = { fg = "#f3f3ff" }
  }

  require("lighthouse.hlgroups").link_hlgroups(mapping, {
  })

  return mapping
end

return M
