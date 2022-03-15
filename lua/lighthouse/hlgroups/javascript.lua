local M = {}

function M.mapping()
  local config = require("lighthouse").config
  local colors = config.colors

  local mapping = {
    -- ------------- l_purple ----------------- "
    -- new "
    javaScriptOperator = { fg = colors.l_purple },
    -- return "
    javaScriptStatement = { fg = colors.l_purple },
    -- break "
    javaScriptBranch = { fg = colors.l_purple },
    -- var "
    javaScriptIdentifier = { fg = colors.l_purple },
    -- --------------- blue --------------------- "
    -- function(){} <-- function "
    javaScriptFunction = { fg = colors.blue , style = colors.bold },
    -- if else end "
    javaScriptConditional = { fg = colors.blue , style = colors.bold },
    -- for "
    javaScriptRepeat = { fg = colors.blue , style = colors.bold },
    -- case "
    javaScriptLabel = { fg = colors.blue , style = colors.bold },
    -- try catch
    javaScriptException = { fg = colors.blue , style = colors.bold },
    -- --------------- green --------------------- "
    -- "debugger;
    javaScriptReserved = { fg = colors.green },
    -- ------------- orange ----------------- "
    -- Date "
    javaScriptType = { fg = colors.orange },
    -- -------------- ??? ---------------------- "
  }

  require("lighthouse.hlgroups").link_hlgroups(mapping, {
    Normal = {
      -- +++ Normal {{{
      "javaScript",
      -- { } "dd
      "javaScriptBraces",

      -- alert() confirm() <-- alert confirm "
      "javaScriptMessage",
      -- window "
      "javaScriptGlobal",
      -- document "
      "javaScriptMember",
      -- if() function() <-- ( ) "
      "javaScriptParens",
    },
    _Comment = {
      -- //some "
      "javaScriptLineComment",
      -- /* some */ "
      "javaScriptComment",
    },
    _String = {
      -- /,/g "
      "javaScriptRegexpString",
      -- "some" "
      "javaScriptStringD",
      -- 'some' "
      "javaScriptStringS",
    },
    _Value = {
      -- 1 3 "
      "javaScriptValue",
      -- 1 3 "
      "javaScriptNumber",
      -- true false "
      "javaScriptBoolean",
      -- null "
      "javaScriptNull",
    },
    Unknown = {
      "javaScriptRailsFunction", "javaScriptTemplateVar", "javaScriptTemplateDelim", "javaScriptTemplateString",
      "javaScriptCommentTodo", "javaScriptCommentSkip", "javaScriptSpecial", "javaScriptSpecialCharacter", "javaScriptDeprecated",
    },
    Unknown2 = {
      "javaScriptCharacter", "javaScriptError", "javaScrParenError", "javaScriptDebug", "javaScriptConstant", "javaScriptExpression",
    }
  })

  return mapping
end

return M
