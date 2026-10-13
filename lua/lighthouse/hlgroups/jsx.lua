
local M = {}

function M.mapping()
  local config = require("lighthouse").config
  local colors = config.colors

  local mapping = {
    
  }
  mapping["@tag.builtin.javascript"] = { fg = colors.l_orange }
  mapping["@tag.attribute.javascript"] = { fg = colors.green }
  mapping["@tag.delimiter.javascript"] = { fg = colors.l_blue }
  mapping["@tag.javascript"] = { fg = colors.l_red }
  mapping["@punctuation.special.javascript"] = { fg = colors.l_red }

  require("lighthouse.hlgroups").link_hlgroups(mapping, {
  })

  return mapping
end

return M
