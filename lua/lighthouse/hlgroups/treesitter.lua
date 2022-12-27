local M = {}

function M.mapping()
  local config = require("lighthouse").config
  local colors = config.colors

  local mapping = {}
  mapping['@parameter'] = { fg = colors.blue } -- 引数
  -- mapping['@constant'] = { fg = colors.jade } -- 定義
  mapping['@label'] = { fg = colors.yellow } -- インスタンス変数?(ruby)
  mapping['@variable.global'] = { fg = colors.yellow } -- グローバル変数(ruby)

  mapping['@punctuation.bracket'] = { fg = colors.m_gray } -- カッコ
  mapping['@constructor'] = { fg = colors.m_gray } -- 構造のカッコ
  mapping['@variable.builtin'] = { fg = colors.orange } -- self
  mapping['@type'] = { fg = colors.l_purple } -- 定数
  mapping['@string.regex'] = { fg = colors.purple } -- regexpの中身
  mapping['@function.call'] = { fg = colors.l_orange }

  require("lighthouse.hlgroups").link_hlgroups(mapping, {
    Normal = {
      "@variable", -- 変数
      "@operator", -- 演算子
      "@punctuation.delimiter", -- 区切り
      "@symbol"
    },
    Function = {
      "@function", -- メソッド
    },
    -- -- 文字列
    String = { "@string" },
    -- -- コメント
    Comment = { "@comment" },
    -- -- 条件式
    Conditional = { "@conditional" },
    -- -- catchなどの例外処理
    Exception = {
      "@exception",
      -- return
      "@keyword.return"
    },
    Keyword = {
      -- module class defなどの言語の予約語
      "@keyword",
      -- functionなどの言語の予約語
      "@keyword.function",
    },
    Number = { "@number" },
    Boolean = { "@boolean" },
    Float = { "@float" },
    Identifier = {
      -- 構造体のフィールド
      "@field",
    },
    Todo = { "@todo" },
    Include = { "@include" },
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
