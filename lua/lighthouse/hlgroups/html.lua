local M = {}

function M.mapping()
  local config = require("lighthouse").config
  local colors = config.colors

  local mapping = {
    -- -------------- l_purple --------------
    htmlEventDQ = { fg = colors.l_purple },

    -- -------------- blue --------------
    -- class="" name="" id="" <-- class name id
    htmlArg = { fg = colors.blue },

    -- -------------- l_blue --------------
    -- <tag> <div id=""> <-- < > \s =
    htmlTag = { fg = colors.l_blue },
    htmlTagN = { fg = colors.l_blue },
    -- </tag> <-- </ >
    htmlEndTag = { fg = colors.l_blue },
    -- <script> <-- < >
    htmlScriptTag = { fg = colors.l_blue },

    -- ------------- green -----------
    htmlSpecialChar = { fg = colors.green },

    -- -------------- yellow --------------
    htmlH5 = { fg = colors.yellow , style = colors.bold },
    htmlH6 = { fg = colors.yellow },

    -- ------------- orange -----------------
    -- <tag> </tag> <-- tag
    htmlTagName = { fg = colors.orange },
    -- <script> </script> <-- script
    htmlSpecialTagName = { fg = colors.orange },
    htmlH3 = { fg = colors.orange , style = colors.bold },
    htmlH4 = { fg = colors.orange },

    -- ------------- red -----------------
    htmlH1 = { fg = colors.red , style = colors.bold_underline },
    htmlH2 = { fg = colors.red , style = colors.underline },
  }

  require("lighthouse.hlgroups").link_hlgroups(mapping, {
    Normal = {
      -- onclick="method(aa,bb)" <-- onclick="method ,
      "htmlEvent",
      -- <a href="aaa">here</a> <-- here
      "htmlLink",
      "htmlLeadingSpace",
      "htmlTitle",
      "htmlBoldUnderline",
      "htmlBoldItalic",
      "htmlBold",
      "htmlBoldUnderlineItalic",
      "htmlBoldItalicUnderline",
      "htmlUnderlineBold",
      "htmlUnderlineItalic",
      "htmlUnderline",
      "htmlUnderlineBoldItalic",
      "htmlUnderlineItalicBold",
      "htmlItalicBold",
      "htmlItalicUnderline",
      "htmlItalic",
      "htmlItalicBoldUnderline",
      "htmlItalicUnderlineBold",

    },
    _Comment = {
      -- <!-- comment --> <-- -- comment --
      "htmlCommentPart",
      -- <!-- comment --> <-- <! >
      "htmlComment",
      "htmlCssStyleComment",
    },
    _String = {
      -- "aa" 'aa'
      "htmlString",
    },
    _Value = {
      -- colspan=2 <-- 2
      "htmlValue",
    },
    _Error = {
      "htmlError",
      "htmlTagError",
      "htmlCommentError",
    },
    _Unknown = {
      "htmlPreStmt", "htmlPreError", "htmlPreAttr", "htmlPreProc", "htmlPreProcAttrError", "htmlCssDefinition",
      "htmlPreProcAttrName", "htmlHead", "htmlEventSQ",
    }
  })

  return mapping
end

return M
