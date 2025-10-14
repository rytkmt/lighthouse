local M = {}

function M.mapping()
  local config = require("lighthouse").config
  local colors = config.colors

  local mapping = {
    -- -------- l_purple -----------
    -- / ( )  (?: )  (?<some> )  (?= )  (?<= )  (?# ) /"
    rubyRegexpSpecial = { fg = colors.l_purple },
    -- / [[:some]]  \d \w \d [ ] /"
    rubyRegexpCharClass = { fg = colors.l_purple },
    -- / \. \/ \$ /"
    rubyRegexpEscape = { fg = colors.l_purple },
    -- / *  +  {1,5}  +?  *? /"
    rubyRegexpQuantifier = { fg = colors.l_purple },
    -- / ^  \A  \z  /"
    rubyRegexpAnchor = { fg = colors.l_purple },
    -- /  .  /"
    rubyRegexpDot = { fg = colors.l_purple },
    -- / some_all /"
    rubyRegexp = { fg = colors.l_purple },

    -- ---------- blue ------------"
    -- def end "
    rubyDefine = { fg = colors.blue , style = colors.bold },
    -- method_exception_resque
    rubyMethodExceptional = { fg = colors.blue , style = colors.bold },
    -- class end "
    rubyClass = { fg = colors.blue , style = colors.bold },
    -- module end "
    rubyModule = { fg = colors.blue , style = colors.bold },
    -- module_function :some <-- module_function "
    rubyAccess = { fg = colors.blue , style = colors.bold },
    -- attr "
    rubyAttribute = { fg = colors.blue , style = colors.bold },

    -- -------- l_blue -----------
    -- if end case when rescue
    rubyConditional = { fg = colors.l_blue , style = colors.bold },
    -- do end begin rescue return"
    rubyControl = { fg = colors.l_blue , style = colors.bold },
    -- exception_rescue"
    rubyExceptional = { fg = colors.l_blue , style = colors.bold },
    -- while end for end "
    rubyRepeat = { fg = colors.l_blue , style = colors.bold },
    -- for nm,val in some do <-- do "
    rubyOptionalDo = { fg = colors.l_blue , style = colors.bold },
    -- some = 0 if true <-- if "
    rubyConditionalModifier = { fg = colors.l_blue , style = colors.bold },
    -- begin some end until true <-- until "
    rubyRepeatModifier = { fg = colors.l_blue , style = colors.bold },

    -- -------- green -----------
    -- raise "
    rubyException = { fg = colors.green },
    -- yield "
    rubyKeyword = { fg = colors.green },
    -- extend require "
    rubyInclude = { fg = colors.green },

    -- -------- yellow ----------"
    -- @test"
    rubyInstanceVariable = { fg = colors.yellow },
    -- @@test"
    rubyClassVariable = { fg = colors.yellow },
    -- $test"
    rubyGlobalVariable = { fg = colors.yellow },
    -- $1
    rubyPredefinedVariable = { fg = colors.yellow },
    -- #! /usr/bin/ruby
    rubySharpBang = { fg = colors.yellow },

    -- -------- orange -----------"
    -- Person  Exception "
    rubyConstant = { fg = colors.orange },
    -- self __FILE__ "
    rubyPseudoVariable = { fg = colors.orange },
    -- ARGV "
    rubyPredefinedConstant = { fg = colors.orange },
    -- #{ }"
    rubyInterpolationDelimiter = { fg = colors.orange },
    -- / some / "
    rubyRegexpDelimiter = { fg = colors.orange },
    -- __END__
    rubyDataDirective = { fg = colors.orange },

    -- -------- red -----------"
    --  __END__ より下の行
    rubyData = { fg = colors.red },
  }

  require("lighthouse.hlgroups").link_hlgroups(mapping, {
    Normal = {
      -- 3.times do |here| <-- here "
      "rubyBlockParameter",
      -- #{ here } <-- here"
      "rubyInterpolation",
      -- class Class <-- \s = "
      "rubyBlock",
      -- { nm => '', val => ''} {|nm| here } <-- , \s here"
      "rubyCurlyBlock",
      -- def here(name) <-- here "
      "rubyFunction",
      -- def method(some) <-- (some) \s "
      "rubyMethodBlock",
      -- some =   some >  "
      "rubyDoBlock",
      -- some = <<'VALUES'.split(/\r|\n)  <-- split()
      "rubyHeredocStart",
      -- begin some_all end <-- some_all "
      "rubyBlockExpression",
      -- case here when 1 end <-- here \s "
      "rubyCaseExpression",
      -- [ 1, 2, 3] <-- , "
      "rubyArrayLiteral",
      -- if here else here end <-- here \s "
      "rubyConditionalExpression",
      -- for here in here do <-- here \s "
      "rubyOptionalDoLine",
      -- while true here end <-- here \s "
      "rubyRepeatExpression",
      -- 3.times do |some, some2| <-- | , |"
      "rubyBlockParameterList",
      -- [ 1, 2, 3] <-- [ ] "
      "rubyArrayDelimiter",
      -- some = { name => '' , val => '' } <-- { } "
      "rubyCurlyBlockDelimiter",
      -- Class.method <-- . "
      "rubyMethodDeclaration",
      -- Class::Method <- ::
      "rubyClassDeclaration",
      -- Module::Method <- ::
      "rubyModuleDeclaration",
      -- eval(some) <-- eval"
      "rubyEval",
      -- defined?(some) <-- defined?
      "rubyOperator",
      -- BigDecimal
      "rubyLocalVariableOrMethod",
    },
    _String = {
      -- :some "
      "rubySymbol",
      -- " ", %w()
      "rubyStringDelimiter",
      -- %i()
      "rubySymbolDelimiter",
      -- "string"
      "rubyString",
      -- \s \\ \r\n"
      "rubyStringEscape",
    },
    _Comment = {
      -- comment_TODO
      "rubyTodo",
      -- /(?#here)/ <-- here"
      "rubyRegexpComment",
      -- # some "
      "rubyComment",
      -- =begin some =end <-- all "
      "rubyDocumentation",
    },
    _Value = {
      -- 3 "
      "rubyInteger",
      -- 1.0 "
      "rubyFloat",
      -- true false "
      "rubyBoolean",
    },
    _Unknown = {
      "rubyQuoteEscape", "rubyInvalidVariable", "rubyNoInterpolation", "rubyDelimiterEscape",
      "rubyRegexpParens", "rubyRegexpBrackets", "rubyASCIICode", "rubyBlockArgument",
    },
    _Unknown2 = {
      "rubySpaceError", "rubyMultilineComment", "rubyBeginEnd", "rubyHeredoc",
      "rubyNestedParentheses", "rubyNestedCurlyBraces", "rubyNestedAngleBrackets", "rubyNestedSquareBrackets",
      "rubyAliasDeclaration2", "rubyAliasDeclaration",
      "rubyKeywordAsMethod", "rubyIdentifier", "rubyPredefinedIdentifier", "rubyError",
    },
    rubyConstant = {
      "rubyModuleName", "rubyClassName"
    },
    rubyStringEscape = {
      "rubyBackslashEscape",
      "rubySpaceEscape",
      "rubyParenthesisEscape",
      "rubyCurlyBraceEscape",
      "rubyAngleBracketEscape",
      "rubySquareBracketEscape",
      "rubyAtEscape",
      "rubyCaretEscape",
      "rubyUnderscoreEscape",
      "rubyBackQuoteEscape",
      "rubyBangEscape",
      "rubyDoubleQuoteEscape",
      "rubyHashEscape",
      "rubyDollarEscape",
      "rubyPercentEscape",
      "rubyAmpersandEscape",
      "rubyAsterixEscape",
      "rubyPlusEscape",
      "rubyCommaEscape",
      "rubyDashEscape",
      "rubyPeriodEscape",
      "rubyForwardSlashEscape",
      "rubyColonEscape",
      "rubySemicolonEscape",
      "rubyBarEscape",
      "rubyEqualsEscape",
      "rubyTildeEscape",
      "rubyQuestionMarkEscape",
    },
    rubyOperator = {
      "rubyEnglishBooleanOperator",
      "rubyDefinedOperator"
    },
    rubyRegexpSpecial = {
      "rubyRegexpIntersection"
    },
    rubyStringDelimiter = {
      "rubyPercentStringDelimiter",
      "rubyHeredocDelimiter"
    },
    rubySymbolDelimiter = {
      "rubyPercentSymbolDelimiter"
    },
    rubyRegexpDelimiter = {
      "rubyPercentRegexpDelimiter"
    },
    rubyError = {
      "rubyGlobalVariableError"
    },
    Character = {
      "rubyCharacter"
    },
    rubyFunction = {
      "rubyMethodName"
    },
    rubyExceptionHandler = {
      "rubyRescueModifier",
      "rubyConditional"
    },
    rubyDefine = {
      "rubyExceptionHandler2"
    },
    Macro = {
      "rubyMacro"
    },
    Constant = {
      "rubyEncoding"
    },
    SpecialComment = {
      "rubyMagicComment"
    },
  })

  -- TreeSitter
  require("lighthouse.hlgroups").link_hlgroups(mapping, {
    String = {
      "rubyTSSymbol",
      "rubyTSConstant", -- HEREや%iの中身など
    }
  })
-- rubyParentheses xxx cleared
-- rubyCapitalizedMethod xxx cleared
-- rubyScopeOperator xxx cleared
-- rubySuperClassOperator xxx cleared
-- rubyEigenClassOperator xxx cleared
-- rubyClassBlock xxx cleared
-- rubyModuleBlock xxx cleared
-- rubyLineContinuation xxx cleared
-- rubyUselessLineContinuation xxx cleared
-- rubyDotOperator xxx cleared
-- rubyBangPredicateMethod xxx cleared

  return mapping
end

return M
