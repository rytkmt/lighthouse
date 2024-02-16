local M = {}

function M.mapping()
  local config = require("lighthouse").config
  local colors = config.colors

  local mapping = {}
  mapping['@variable.member.ruby'] = { fg = colors.yellow } -- インスタンス変数
  mapping['@label'] = { fg = colors.green } -- here doc

  return mapping
end

return M
