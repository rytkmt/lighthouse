

local M = {}

function M.mapping()
  local config = require("lighthouse").config
  local colors = config.colors

  local mapping = {
    
  }
  mapping["@tag.builtin.tsx"] = { fg = colors.l_orange }
  mapping["@tag.attribute.tsx"] = { fg = colors.green }
  mapping["@tag.delimiter.tsx"] = { fg = colors.l_blue }
  mapping["@tag.tsx"] = { fg = colors.l_red }
  mapping["@punctuation.special.tsx"] = { fg = colors.l_red }

  require("lighthouse.hlgroups").link_hlgroups(mapping, {
  })

  return mapping
end

return M
