local M = {}

function M.mapping()
  local config = require("lighthouse").config
  local colors = config.colors

  local mapping = {
    SyntasticErrorSign = { fg = colors.black       , bg = colors.red },
    SyntasticWarningSign = { fg = colors.black       , bg = colors.yellow },
    SyntasticStyleErrorSign = { fg = colors.red },
    SyntasticStyleWarningSign = { fg = colors.yellow },
  }

  require("lighthouse.hlgroups").link_hlgroups(mapping, {
  })

  return mapping
end

return M
