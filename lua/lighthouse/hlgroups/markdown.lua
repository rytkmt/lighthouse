local M = {}

function M.mapping()
  local config = require("lighthouse").config
  local colors = config.colors

  local mapping = {
    mkdItalic = { fg = colors.purple , style = colors.italic },
    mkdBold = { fg = colors.purple , style = colors.bold },
    mkdBoldItalic = { fg = colors.purple , style = colors.bold_italic },

    mkdInlineURL = { fg = colors.l_purple },
    mkdLinkDefTarget = { fg = colors.l_purple },
    mkdURL = { fg = colors.l_purple },

    mkdLinkDelimiter = { fg = colors.l_blue },
    mkdFootnotesDelimiter = { fg = colors.l_blue },

    mkdIDDelimiter = { fg = colors.green },
    mkdCodeDelimiter = { fg = colors.green  , style = colors.bold },
    mkdDelimiter = { fg = colors.green , style = colors.bold },
    mkdInlineCodeDelimiter = { fg = colors.green , style = colors.bold },
    markdownCodeDelimiter = { fg = colors.green },

    mkdLink = { fg = colors.yellow },
    mkdListItem = { fg = colors.yellow },
    mkdFootnotes = { fg = colors.yellow },

    mkdID = { fg = colors.orange },
    mkdLinkDef = { fg = colors.orange , style = colors.bold_underline },

    mkdLineBreak = { bg = colors.yellow },
    mkdRule = {  style = colors.reverse },
  }

  require("lighthouse.hlgroups").link_hlgroups(mapping, {
    Normal = {
      "mkdLinkTitle",
      "mkdListBlock0",
      "mkdListBlock1",
      "mkdListBlock2",
    },
    _String = {
      "mkdCode",
      "mkdIndentCode",
    },
    _Comment = {
      "mkdBlockquote",
    },
    Unknown = {
      "markdownUrl", "mkdIndentCode0", "mkdIndentCode1", "mkdIndentCode2", "mkdFrontmatterDelimiter", "mkdString", "mkdMath", "mkdURLDelimiter"
    }
  })

  return mapping
end

return M
