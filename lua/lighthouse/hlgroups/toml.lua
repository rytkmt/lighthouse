local M = {}

function M.mapping()
  local config = require("lighthouse").config
  local colors = config.colors

  local mapping = {
    tomlString = { link = "_String" },
    tomlComment = { link = "_Comment" },
    tomlTableArray = { fg = colors.l_blue },
    tomlLabel = { fg = colors.purple },
    tomlFloat = { link = "_Value" },
    tomlInteger = { link = "_Value" },
  }

  require("lighthouse.hlgroups").link_hlgroups(mapping, {
    _Unknown = {
      "tomlEscape", "tomlLineEscape", "tomlBoolean", "tomlDate", "tomlTable", "tomlTodo",
    }
  })

  return mapping
end

return M
