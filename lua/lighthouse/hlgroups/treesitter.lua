local M = {}

function M.mapping()
  local config = require("lighthouse").config
  local colors = config.colors

  local mapping = {
    TSType = { fg = colors.orange }, -- 定数
    TSVariableBuiltin = { fg = colors.orange }, -- self
    TSParameter = { fg = colors.l_blue }, -- 引数
    TSConstant = { fg = colors.jade }, -- 定義
    TSLabel = { fg = colors.yellow }, -- インスタンス変数?(ruby)
    TSPunctBracket = { fg = colors.m_gray }, -- カッコ
    TSConstructor = { fg = colors.m_gray }, -- 構造のカッコ
    TSStringRegex = { fg = colors.purple }, -- regexpの中身
  }
  require("lighthouse.hlgroups").link_hlgroups(mapping, {
    Normal = {
      "TSVariable", -- 変数
      "TSFunction", -- メソッド
      "TSOperator", -- 演算子
      "TSPunctDelimiter" -- 区切り
    },
    -- 文字列
    String = { "TSString" },
    -- コメント
    Comment = { "TSComment" },
    -- 条件式
    Conditional = { "TSConditional" },
    -- catchなどの例外処理
    Exception = { "TSException" },
    Keyword = {
      -- module class defなどの言語の予約語
      "TSKeyword",
      -- functionなどの言語の予約語
      "TSKeywordFunction",
    },
    Number = { "TSNumber" },
    Boolean = { "TSBoolean" },
    Float = { "TSFloat" },
    Identifier = {
      -- 構造体のフィールド
      "TSField",
      -- return
      "TSKeywordReturn"
    },
    Todo = { "TSTodo" },
    Include = { "TSInclude" },
  })

-- 謎な者たち
-- TSNone         xxx guifg=foreground
-- TSPunctSpecial xxx links to Delimiter
-- TSConstBuiltin xxx links to Special
-- TSConstMacro   xxx links to Define
-- TSStringEscape xxx links to SpecialChar
-- TSStringSpecial xxx links to SpecialChar
-- TSCharacter    xxx links to Character
-- TSCharacterSpecial xxx links to SpecialChar
-- TSFuncBuiltin  xxx links to Special
-- TSFuncMacro    xxx links to Macro
-- TSParameterReference xxx links to TSParameter
-- TSMethod       xxx links to Function
-- TSProperty     xxx links to Identifier
-- TSAnnotation   xxx links to PreProc
-- TSAttribute    xxx links to PreProc
-- TSNamespace    xxx links to Include
-- TSSymbol       xxx links to Identifier
-- TSRepeat       xxx links to Repeat
-- TSKeywordOperator xxx links to TSOperator
-- TSDebug        xxx links to Debug
-- TSDefine       xxx links to Define
-- TSPreProc      xxx links to PreProc
-- TSStorageClass xxx links to StorageClass
-- TSTypeBuiltin  xxx links to Type
-- TSTypeQualifier xxx links to Type
-- TSTypeDefinition xxx links to Typedef
-- TSText         xxx links to TSNone
-- TSStrong       xxx cterm=bold gui=bold
-- TSEmphasis     xxx cterm=italic gui=italic
-- TSUnderline    xxx cterm=underline gui=underline
-- TSStrike       xxx cterm=strikethrough gui=strikethrough
-- TSMath         xxx links to Special
-- TSTextReference xxx links to Constant
-- TSEnvironment  xxx links to Macro
-- TSEnvironmentName xxx links to Type
-- TSTitle        xxx links to Title
-- TSLiteral      xxx links to String
-- TSURI          xxx links to Underlined
-- TSNote         xxx links to SpecialComment
-- TSWarning      xxx links to Todo
-- TSDanger       xxx links to WarningMsg
-- TSTag          xxx links to Label
-- TSTagDelimiter xxx links to Delimiter
-- TSTagAttribute xxx links to TSProperty
  return mapping
end

return M
