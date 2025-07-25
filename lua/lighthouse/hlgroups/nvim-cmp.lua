local M = {}

function M.mapping()
  local config = require("lighthouse").config
  local colors = config.colors

  local mapping = {
    CmpItemAbbr = { fg = colors.white },
    CmpItemAbbrMatch = { fg = colors.l_red },
    CmpItemKind = { fg = colors.green },
    CmpItemKindSnippet = { fg = colors.purple },
    CmpItemMenu = { fg = colors.l_purple }
  }

  require("lighthouse.hlgroups").link_hlgroups(mapping, {
    Pmenu = {
    }
  })

  return mapping
end

return M
