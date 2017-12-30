" File:       iceberg.vim Maintainer: cocopon <cocopon@me.com>
" Modified:   2017-11-30 20:32+0900
" License:    MIT


if !has('gui_running') && &t_Co < 256
  finish
endif

set background=dark
hi clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'lighthouse'

if has("gui_running") || has('gui') || has('nvim')
    let s:vmode       = "gui"
    let s:col0        = "#191926" "黒
    let s:col1        = "#303442"
    let s:col2        = "#515960"
    let s:col3        = "#c4cbd2"
    let s:col4        = "#ede4fd" "白
    let s:col5        = "#747480" "グレー
    let s:col6        = "#605a94" "濃い紫
    let s:col7        = "#888abf" "薄紫
    let s:col8        = "#5868a6" "青
    let s:col9        = "#819cdf" "水色
    let s:col10       = "#98c0c8" "翡翠
    let s:col11       = "#728a7f" "緑
    let s:col12       = "#b4be96" "黄緑
    let s:col13       = "#ead080" "黃
    let s:col14       = "#cfa686" "オレンジ
    let s:col15       = "#d48585" "赤ピンク
else
    let s:vmode       = "cterm"
    let s:col0        = "234"
    let s:col1        = "236"
    let s:col2        = "239"
    let s:col3        = "251"
    let s:col4        = "254"
    let s:col5        = "243"
    let s:col6        = "60"
    let s:col7        = "103"
    let s:col8        = "62"
    let s:col9        = "68"
    let s:col10       = "110"
    let s:col11       = "66"
    let s:col12       = "151"
    let s:col13       = "222"
    let s:col14       = "180"
    let s:col15       = "174"
endif

" + highlight設定用変数の定義 {{{

for i in range(0, 15)
  exe "let s:col = s:col".i
  exe "let s:bg_col".i." = ' ".s:vmode."bg=".s:col."'"
  exe "let s:fg_col".i." = ' ".s:vmode."fg=".s:col."'"
  exe "let s:sp_col".i." = ' ".s:vmode."sp=".s:col."'"
  if has('nvim')
    exe "let g:terminal_color_".i." = s:col".i
  endif
endfor

function! s:hl_special(...)
  return ' gui=' . join(a:000, ',')
endfunction

function! s:fg_col(col)
  return ' '.s:vmode."fg=".a:col
endfunction

function! s:bg_col(col)
  return ' '.s:vmode."bg=".a:col
endfunction

function! s:h_link(to, ...)
  for from in a:000
    exe "hi! link " .from ." " .a:to
  endfor
endfunction
"}}}

" + グループ化 {{{
exe "hi! _Normal" .s:fg_col4
exe "hi! _Comment" .s:fg_col5
exe "hi! _Value" .s:fg_col10
exe "hi! _String" .s:fg_col12
hi! link _Regexp _String
exe "hi! _Note" .s:fg_col13
exe "hi! _Error" .s:fg_col15
exe "hi! _Unknown" .s:bg_col("#990000")
" }}}

" + 基本の設定 {{{

" 固定のもの
hi! link Normal _Normal
exe "hi! NonText" .s:bg_col1 .s:fg_col14
hi! link SpecialKey _Unknown
exe "hi! Operator" .s:fg_col4
exe "hi! Delimiter" .s:fg_col4
hi! link Comment _Comment
hi! link String _String
hi! link Error _Error
hi! link ErrorMsg _Error

exe "hi! Search" .s:bg_col14 .s:fg_col1
exe "hi! MatchParen" .s:bg_col15 .s:fg_col1
exe "hi! Visual" .s:bg_col9 .s:fg_col0

exe "hi! Include" .s:fg_col9
exe "hi! StorageClass" .s:fg_col9
exe "hi! Statement" .s:fg_col9
hi! link Constant _Value
exe "hi! Function" .s:fg_col14
exe "hi! Identifier" .s:fg_col7
exe "hi! MoreMsg" .s:fg_col11
exe "hi! WarningMsg" .s:fg_col13
exe "hi! PreProc" .s:fg_col11
exe "hi! Question" .s:fg_col4
exe "hi! Special" .s:fg_col6
exe "hi! Type" .s:fg_col8
exe "hi! Conceal" .s:bg_col0 .s:fg_col0

exe "hi! Cursor" .s:bg_col1 .s:fg_col0
exe "hi! CursorColumn"                                 " gui=NONE cterm=NONE"
exe "hi! CursorLine" .s:bg_col1
exe "hi! CursorLineNr" .s:fg_col4  .s:bg_col1
exe "hi! LineNr" .s:bg_col("#1f2028") .s:fg_col("#444b61")
exe "hi! DiffAdd"                .s:fg_col11       .s:bg_col0 .s:hl_special("underline")
exe "hi! DiffDelete"             .s:fg_col15   .s:bg_col0
exe "hi! DiffChange"             .s:fg_col9      .s:bg_col0 .s:hl_special("underline")
exe "hi! DiffText"               .s:fg_col13      .s:bg_col0 .s:hl_special("underline")
exe "hi! Directory" .s:fg_col8
exe "hi! Folded" .s:fg_col15 .s:bg_col1
exe "hi! PMenu"                  .s:fg_col15       .s:bg_col1
exe "hi! PMenuSel"               .s:fg_col11       .s:bg_col1 .s:hl_special("underline")
call s:h_link("_Unknown", "PMenuSBar", "PMenuThumb", "SignColumn", "FoldColumn",
\ "Structure", "Title", "Todo", "SpellBad", "SpellCap", "SpellLocal", "SpellRare", "StatusLine")
exe "hi! StatusLine" .s:hl_special("reverse") .s:bg_col("#17171b") .s:fg_col("#818596")
exe "hi! StatusLineTerm" .s:hl_special("reverse") .s:bg_col("#17171b") .s:fg_col("#818596")
exe "hi! StatusLineNC" .s:hl_special("reverse") .s:bg_col("#3e445e") .s:fg_col("#0f1117")
exe "hi! StatusLineTermNC" .s:hl_special("reverse") .s:bg_col("#3e445e") .s:fg_col("#0f1117")
exe "hi! TabLine" .s:hl_special("NONE") .s:bg_col("#818596") .s:fg_col("#17171b")
exe "hi! StatusLineTerm" .s:hl_special("reverse") .s:bg_col("#17171b") .s:fg_col("#818596")
exe "hi! TabLine" .s:hl_special("NONE") .s:bg_col("#161821") .s:fg_col("#9a9ca5")
exe "hi! Underlined" .s:hl_special("underline") .s:fg_col15
exe "hi! VertSplit" .s:bg_col("#0f1117") .s:fg_col("#0f1117")
exe "hi! WildMenu" .s:bg_col3 .s:fg_col0
" }}}


hi link ZenkakuSpace Error

" + filetype毎のhighlight {{{
" ++ css {{{
" +++ _Normal {{{
hi! link cssStyle _Normal
" propety: some; <-- : ;"
hi! link cssNoise _Normal
" selector{ } <-- { }"
hi! link cssBraces _Normal
" scale(x,y) <-- , "
hi! link cssFunctionComma _Normal
" #ff0000 red <-- ff0000 red "
hi! link cssColor _Normal
" rect(0px auto, auto auto) <-- \s auto"
hi! link cssFunction _Normal
" propety: some <-- \s % "
hi! link cssAttrRegion _Normal
" none "
hi! link cssCommonAttr _Normal
" url(some) <-- url( )"
hi! link cssFunctionName _Normal
" linear-gradient(left, #fff, rgba(255,0,0,0) <-- left "
hi! link cssGradientAttr _Normal
" background: #fff url(some) top center no-repeat <-- top center no-repeat; "
hi! link cssBackgroundAttr _Normal
" border:solid 1px #fff; <-- solid "
hi! link cssBorderAttr _Normal
" margin: auto; overflow: hidden "
hi! link cssBoxAttr _Normal
" font-family: Arial <-- Arial "
hi! link cssFontAttr _Normal
" #FF0000 10px 2em 3Hz <-- # px em Hz"
hi! link cssUnitDecorators _Normal
" @media (orientation: landscape){} <-- landscape"
hi! link cssMediaAttr _Normal
" @media screen, print <-- , "
hi! link cssMediaComma _Normal
" @media screen and (max-width:480px) <-- \s : ( ) "
hi! link cssInclude _Normal
" break-after:column; <-- column "
hi! link cssMultiColumnAttr _Normal
" animation-iteration-count: infinite; <-- infinite "
hi! link cssAnimationAttr _Normal
" list-style: square url('../images/ico32.gif') inside <-- insize squeare"
hi! link cssListAttr _Normal
" display:block; position:absolute; float:left <-- block absolute left "
hi! link cssPositioningAttr _Normal
" page-break-inside: avoid; size:landscape; <-- avoid landscape "
hi! link cssPrintAttr _Normal
" page-break-before: always; <-- always "
hi! link cssTableAttr _Normal
" frex-wrap:nowrap; word-break:break-all; text-decoration:underline <-- nowrap break-all underline "
hi! link cssTextAttr _Normal
" transition : width 1s ease-out; transition:1s linear <-- ease-out linear "
hi! link cssTransitionAttr _Normal
" content:some; zoom:1; cursor:pointer; <-- content zoom pointer "
hi! link cssUIAttr _Normal
" interpolation-mode:bicubic <-- bicubic "
hi! link cssIEUIAttr _Normal
" voice-family:male; <-- male"
hi! link cssAuralAttr _Normal
" , "
hi! link cssAttrComma _Normal
" #aaa + .bbb > .test <-- + >  "
hi! link cssSelectorOp _Normal
" input[type=radio] <-- = "
hi! link cssSelectorOp2 _Normal
" @media screen and (min-width:480px) <-- and "
hi! link cssMediaKeyword _Normal
" :lang(en) :lang(no) <-- en no "
hi! link cssPseudoClassFn _Normal
" @media screen and print <-- screen print all "
hi! link cssMediaType _Normal
" @keyframes some { 0% {} 30%{} } <-- 0% 30% "
hi! link cssKeyFrameSelector _Normal
"z-index:2; line-height:1; <-- 2 1 (IntegerはNumberでもあるのでNumberが優先される
" +++ }}}
" +++ _Value {{{
hi! link cssValueInteger _Value
"z-index:2; transform:scale(1,2.3) <-- 2 1 2.3 "
hi! link cssValueNumber _Value
" padding:20px; font-size:14em; <-- 20 14 "
hi! link cssValueLength _Value
" transform:rotateX(360deg); <-- 360 "
hi! link cssValueAngle _Value
" transition: 0.2s linear; <-- 0.2 "
hi! link cssValueTime _Value
" 14Hz 3kHz <-- 14 3 "
hi! link cssValueFrequency _Value
" url(img/arw.png) <-- img/arw.png "
hi! link cssURL _Value
" url(sansation_light.woff) <-- sansation_light.woff "
hi! link cssFontDescriptorFunction _Value
" unicode-range: U+000-5FF, U+1e00-1fff, U+2000-2300;"
hi! link cssFontDescriptorAttr _Value
" +++ }}}
" +++ _String {{{
" content: "\2193"; <-- \2193
hi! link cssUnicodeEscape _String
" 'some' "
hi! link cssStringQ _String
" "some" "
hi! link cssStringQQ _String
" "\\\\" "
hi! link cssSpecialCharQQ _String
" '\\\\' "
hi! link cssSpecialCharQ _String
" +++ }}}
" +++ _Error {{{
" !important "
hi! link cssImportant _Error
" +++ }}}
"------------ col7 --------------"
" #id "
exe "hi! cssIdentifier" .s:fg_col7
"---------- col8 ------------"
" -moz- -webkit- "
exe "hi! cssVendor" .s:fg_col8
" animation-name animation-duration "
exe "hi! cssAnimationProp" .s:fg_col8
" content "
exe "hi! cssPageProp" .s:fg_col8
" background background-color "
exe "hi! cssBackgroundProp" .s:fg_col8
" border border-color "
exe "hi! cssBorderProp" .s:fg_col8
" margin padding margin-right "
exe "hi! cssBoxProp" .s:fg_col8
" opacity "
exe "hi! cssColorProp" .s:fg_col8
" width height "
exe "hi! cssDimensionProp" .s:fg_col8
" font-size font-family "
exe "hi! cssFontProp" .s:fg_col8
" page-break-before: always <-- page-break-before "
exe "hi! cssMultiColumnProp" .s:fg_col8
" font-family: myFont; src:url(some); <-- font-family src "
exe "hi! cssFontDescriptorProp" .s:fg_col8
" counter-increment: popular_img; "
exe "hi! cssGeneratedContentProp" .s:fg_col8
" target-new:none; <-- target_new "
exe "hi! cssHyerlinkProp" .s:fg_col8
" list-style-type:none; <-- list-style-type "
exe "hi! cssListProp" .s:fg_col8
" display: float: left: top: position: <-- :以外"
exe "hi! cssPositioningProp" .s:fg_col8
" table-layout:auto; <-- table-layout"
exe "hi! cssTableProp" .s:fg_col8
" line-height:2; color:red; <-- line-height color "
exe "hi! cssTextProp" .s:fg_col8
" transform: scale(1.5); <-- transform "
exe "hi! cssTransformProp" .s:fg_col8
" transition: some; transition-property:some <-- transition transition-property "
exe "hi! cssTransitionProp" .s:fg_col8
" box-sizing: some; cursor: some; <-- box-sizing cursor "
exe "hi! cssUIProp" .s:fg_col8
" zoom: some; interpolation-mode: some; filter: some <-- zoom inter@olation-mode filter "
exe "hi! cssIEUIProp" .s:fg_col8
" pitch: some; <-- pitch "
exe "hi! cssAuralProp" .s:fg_col8
" text-size-adjust: some; <-- text-size-adjust "
exe "hi! cssMobileTextProp" .s:fg_col8
" box-shadow: some <-- box-shadow "
exe "hi! cssFlexibleBoxProp" .s:fg_col8
" @media screen{ min-color: some} <-- min-color "
exe "hi! cssMediaProp" .s:fg_col8
"------------ col9 --------------"
" @charset "
exe "hi! cssIncludeKeyword" .s:fg_col9
" @font-face "
exe "hi! cssFontDescriptor" .s:fg_col9
" .class <-- . "
exe "hi! cssClassNameDot" .s:fg_col9
" .class <-- class "
exe "hi! cssClassName" .s:fg_col9
" .top_margin{} <-- _ "
exe "hi! cssHacks" .s:fg_col9
"------------ col11 -------------"
" div ul "
exe "hi! cssTagName" .s:fg_col11
"---------- col13 -----------"
" selector:pseudo-class{} <-- pseudo-class "
exe "hi! cssPseudoClass" .s:fg_col13
" @page:first <-- :first "
exe "hi! cssPagePseudo" .s:fg_col13
" input:checked div:hover <-- :checked :hover "
exe "hi! cssPseudoClassId" .s:fg_col13
" content: open-quote <-- open quote "
exe "hi! cssGeneratedContentAttr" .s:fg_col13
"---------- col14 -----------"
" input[type=radio] <-- type radio "
exe "hi! cssAttributeSelector" .s:fg_col14

call s:h_link("_Unknown", "cssMediaBlock", "cssError", "cssDefinition", "cssPageWrap", "cssPage", "cssPageMargin",
      \ "cssKeyFrameWrap", "cssKeyFrame", "cssFontDescriptorBlock", "cssFlexibleBoxAttr", "cssGridProp", "cssBraceError",
      \ "cssDeprecated", "cssProp", "cssContentForPagedMediaProp", "cssMarqueeProp", "cssPagedMediaProp", "cssRubyProp")
 call s:h_link("_Unknown", "cssSpeechProp", "cssRenderProp", "cssAttr", "cssContentForPagedMediaAttr", "cssDimensionAttr", "cssGridAttr",
      \ "cssHyerlinkAttr", "cssLineboxAttr", "cssMarginAttr", "cssMarqueeAttr", "cssPaddingAttr", "cssPagedMediaAttr",
      \ "cssRubyAttr", "cssSpeechAttr", "cssTransformAttr", "cssRenderAttr", "cssPseudoClassLang")
" ++ }}}
" ++ ruby {{{
" +++ _Normal {{{
" 3.times do |here| <-- here "
hi! link rubyBlockParameter _Normal
" #{ here } <-- here"
hi! link rubyInterpolation _Normal
" class Class <-- \s = "
hi! link rubyBlock _Normal
" { nm => '', val => ''} {|nm| here } <-- , \s here"
hi! link rubyCurlyBlock _Normal
" def here(name) <-- here "
hi! link rubyFunction _Normal
" def method(some) <-- (some) \s "
hi! link rubyMethodBlock _Normal
" some =   some >  "
hi! link rubyDoBlock _Normal
" begin some_all end <-- some_all "
hi! link rubyBlockExpression _Normal
" case here when 1 end <-- here \s "
hi! link rubyCaseExpression _Normal
" [ 1, 2, 3] <-- , "
hi! link rubyArrayLiteral _Normal
" if here else here end <-- here \s "
hi! link rubyConditionalExpression _Normal
" for here in here do <-- here \s "
hi! link rubyOptionalDoLine _Normal
" while true here end <-- here \s "
hi! link rubyRepeatExpression _Normal
" 3.times do |some, some2| <-- | , |"
hi! link rubyBlockParameterList _Normal
" [ 1, 2, 3] <-- [ ] "
hi! link rubyArrayDelimiter _Normal
" some = { name => '' , val => '' } <-- { } "
hi! link rubyCurlyBlockDelimiter _Normal
" Class.method <-- . "
hi! link rubyMethodDeclaration _Normal
" Class::Method <- ::
hi! link rubyClassDeclaration _Normal
" Module::Method <- ::
hi! link rubyModuleDeclaration _Normal
" eval(some) <-- eval"
hi! link rubyEval _Normal
" defined?(some) <-- defined?
hi! link rubyOperator _Normal
" +++ }}}
" +++ _String {{{
" :some "
hi! link rubySymbol _String
" " " "
hi! link rubyStringDelimiter _String
" "string"
hi! link rubyString _String
" \s \\ \r\n"
hi! link rubyStringEscape _String
" +++ }}}
" +++ _Comment {{{
" comment_TODO
hi! link rubyTodo _Comment
" /(?#here)/ <-- here"
hi! link rubyRegexpComment _Comment
" # some "
hi! link rubyComment _Comment
" =begin some =end <-- all "
hi! link rubyDocumentation _Comment
" +++ }}}
" +++ _Value {{{
" 3 "
hi! link rubyInteger _Value
" 1.0 "
hi! link rubyFloat _Value
" true false "
hi! link rubyBoolean _Value
" +++ }}}
" -------- col7 -----------
" / ( )  (?: )  (?<some> )  (?= )  (?<= )  (?# ) /"
exe "hi! rubyRegexpSpecial" .s:fg_col7
" / [[:some]]  \d \w \d [ ] /"
exe "hi! rubyRegexpCharClass" .s:fg_col7
" / \. \/ \$ /"
exe "hi! rubyRegexpEscape" .s:fg_col7
" / *  +  {1,5}  +?  *? /"
exe "hi! rubyRegexpQuantifier" .s:fg_col7
" / ^  \A  \z  /"
exe "hi! rubyRegexpAnchor" .s:fg_col7
" /  .  /"
exe "hi! rubyRegexpDot" .s:fg_col7
" / some_all /"
exe "hi! rubyRegexp" .s:fg_col7

" ---------- col8 ------------"
" def end "
exe "hi! rubyDefine" .s:fg_col8 .s:hl_special("bold")
" method_exception_resque
exe "hi! rubyMethodExceptional" .s:fg_col8 .s:hl_special("bold")
" class end "
exe "hi! rubyClass" .s:fg_col8 .s:hl_special("bold")
" module end "
exe "hi! rubyModule" .s:fg_col8 .s:hl_special("bold")
" module_function :some <-- module_function "
exe "hi! rubyAccess" .s:fg_col8 .s:hl_special("bold")
" attr "
exe "hi! rubyAttribute" .s:fg_col8 .s:hl_special("bold")

" -------- col9 -----------
" if end case when rescue
exe "hi! rubyConditional" .s:fg_col9 .s:hl_special("bold")
" do end begin rescue return"
exe "hi! rubyControl" .s:fg_col9 .s:hl_special("bold")
" exception_rescue"
exe "hi! rubyExceptional" .s:fg_col9 .s:hl_special("bold")
" while end for end "
exe "hi! rubyRepeat" .s:fg_col9 .s:hl_special("bold")
" for nm,val in some do <-- do "
exe "hi! rubyOptionalDo" .s:fg_col9 .s:hl_special("bold")
" some = 0 if true <-- if "
exe "hi! rubyConditionalModifier" .s:fg_col9 .s:hl_special("bold")
" begin some end until true <-- until "
exe "hi! rubyRepeatModifier" .s:fg_col9 .s:hl_special("bold")

" -------- col11 -----------
" raise "
exe "hi! rubyException" .s:fg_col11
" yield "
exe "hi! rubyKeyword" .s:fg_col11
" extend require "
exe "hi! rubyInclude" .s:fg_col11

" -------- col13 ----------"
" @test"
exe "hi! rubyInstanceVariable" .s:fg_col13
" @@test"
exe "hi! rubyClassVariable" .s:fg_col13
" $test"
exe "hi! rubyGlobalVariable" .s:fg_col13
" $1
exe "hi! rubyPredefinedVariable" .s:fg_col13


" -------- col14 -----------"
" Person  Exception "
exe "hi! rubyConstant" .s:fg_col14
" self __FILE__ "
exe "hi! rubyPseudoVariable" .s:fg_col14
" ARGV "
exe "hi! rubyPredefinedConstant" .s:fg_col14
" #{ }"
exe "hi! rubyInterpolationDelimiter" .s:fg_col14
" / some / "
exe "hi! rubyRegexpDelimiter" .s:fg_col14

call s:h_link("_Unknown", "rubyQuoteEscape", "rubyInvalidVariable", "rubyNoInterpolation", "rubyDelimiterEscape",
      \ "rubyNestedParentheses", "rubyNestedCurlyBraces", "rubyNestedAngleBrackets", "rubyNestedSquareBrackets",
      \ "rubyRegexpParens", "rubyRegexpBrackets", "rubyASCIICode", "rubyLocalVariableOrMethod", "rubyBlockArgument")
call s:h_link("_Unknown", "rubySymbolDelimiter", "rubyHeredocStart", "rubyHeredoc", "rubyAliasDeclaration2", "rubyAliasDeclaration",
      \ "rubyBeginEnd", "rubySharpBang", "rubySpaceError", "rubyMultilineComment", "rubyKeywordAsMethod",
      \ "rubyDataDirective", "rubyData", "rubyIdentifier", "rubyPredefinedIdentifier", "rubyError")
" ++ }}}
" ++ javascript {{{
" +++ _Normal {{{
hi! link javaScript _Normal
" { } "dd
hi! link javaScriptBraces _Normal

" alert() confirm() <-- alert confirm "
hi! link javaScriptMessage _Normal
" window "
hi! link javaScriptGlobal _Normal
" document "
hi! link javaScriptMember _Normal
" if() function() <-- ( ) "
hi! link javaScriptParens _Normal
" +++ }}}
" +++ _Comment {{{
" //some "
hi! link javaScriptLineComment _Comment
" /* some */ "
hi! link javaScriptComment _Comment
" +++ }}}
" +++ _String {{{
" /,/g "
hi! link javaScriptRegexpString _String
" "some" "
hi! link javaScriptStringD _String
" 'some' "
hi! link javaScriptStringS _String
" +++ }}}
" +++ _Value {{{
" 1 3 "
hi! link javaScriptValue _Value
" 1 3 "
hi! link javaScriptNumber _Value
" true false "
hi! link javaScriptBoolean _Value
" null "
hi! link javaScriptNull _Value
" +++ }}}
" ------------- col7 ----------------- "
" new "
exe "hi! javaScriptOperator" .s:fg_col7
" return "
exe "hi! javaScriptStatement" s:fg_col7
" break "
exe "hi! javaScriptBranch" .s:fg_col7
" var "
exe "hi! javaScriptIdentifier" .s:fg_col7
" --------------- col8 --------------------- "
" function(){} <-- function "
exe "hi! javaScriptFunction" .s:fg_col8 .s:hl_special("bold")
" if else end "
exe "hi! javaScriptConditional" .s:fg_col8 .s:hl_special("bold")
" for "
exe "hi! javaScriptRepeat" .s:fg_col8 .s:hl_special("bold")
" case "
exe "hi! javaScriptLabel" .s:fg_col8 .s:hl_special("bold")
" try catch
exe "hi! javaScriptException" .s:fg_col8 .s:hl_special("bold")
" ------------- col14 ----------------- "
" Date "
exe "hi! javaScriptType" .s:fg_col14
" -------------- ??? ---------------------- "
call s:h_link("_Unknown", "javaScriptRailsFunction", "javaScriptTemplateVar", "javaScriptTemplateDelim", "javaScriptTemplateString",
      \ "javaScriptCommentTodo", "javaScriptCommentSkip", "javaScriptSpecial", "javaScriptSpecialCharacter", "javaScriptDeprecated",
      \ "javaScriptReserved", "javaScriptCharacter", "javaScriptError", "javaScrParenError", "javaScriptDebug", "javaScriptConstant", "javaScriptExpression")
" }}}
" ++ html {{{
" +++ _Normal {{{
" onclick="method(aa,bb)" <-- onclick="method ,
hi! link htmlEvent _Normal
" <a href="aaa">here</a> <-- here
hi! link htmlLink _Normal
hi! link htmlLeadingSpace _Normal
hi! link htmlTitle _Normal
hi! link htmlBoldUnderline _Normal
hi! link htmlBoldItalic _Normal
hi! link htmlBold _Normal
hi! link htmlBoldUnderlineItalic _Normal
hi! link htmlBoldItalicUnderline _Normal
hi! link htmlUnderlineBold _Normal
hi! link htmlUnderlineItalic _Normal
hi! link htmlUnderline _Normal
hi! link htmlUnderlineBoldItalic _Normal
hi! link htmlUnderlineItalicBold _Normal
hi! link htmlItalicBold _Normal
hi! link htmlItalicUnderline _Normal
hi! link htmlItalic _Normal
hi! link htmlItalicBoldUnderline _Normal
hi! link htmlItalicUnderlineBold _Normal
" +++ }}}
" +++ _Comment {{{
" <!-- comment --> <-- -- comment --
hi! link htmlCommentPart _Comment
" <!-- comment --> <-- <! >
hi! link htmlComment _Comment
hi! link htmlCssStyleComment _Comment
" +++ }}}
" +++ _String {{{
" "aa" 'aa'
hi! link htmlString _String
" +++ }}}
" +++ _Value {{{
" colspan=2 <-- 2
hi! link htmlValue _Value
" +++ }}}
" +++ _Error {{{
hi! link htmlError _Error
hi! link htmlTagError _Error
hi! link htmlCommentError _Error
" }}}
" -------------- col2 --------------
exe "hi! htmlH1" .s:bg_col15 .s:fg_col2
exe "hi! htmlH3" .s:bg_col14 .s:fg_col2
exe "hi! htmlH5" .s:bg_col13 .s:fg_col2

" -------------- col7 --------------
exe "hi! htmlEventDQ" .s:fg_col7

" -------------- col8 --------------
" class="" name="" id="" <-- class name id
exe "hi! htmlArg" .s:fg_col8

" -------------- col9 --------------
" <tag> <div id=""> <-- < > \s =
exe "hi! htmlTag" .s:fg_col9
exe "hi! htmlTagN" .s:fg_col9
" </tag> <-- </ >
exe "hi! htmlEndTag" .s:fg_col9
" <script> <-- < >
exe "hi! htmlScriptTag" .s:fg_col9

" ------------- col11 -----------
exe "hi! htmlSpecialChar" .s:fg_col11

" -------------- col13 --------------
exe "hi! htmlH6" .s:fg_col13

" ------------- col14 -----------------
" <tag> </tag> <-- tag
exe "hi! htmlTagName" .s:fg_col14
" <script> </script> <-- script
exe "hi! htmlSpecialTagName" .s:fg_col14
exe "hi! htmlH4" .s:fg_col14

" ------------- col15 -----------------
exe "hi! htmlH2" .s:fg_col15 .s:hl_special("underline")

call s:h_link("_Unknown", "htmlPreStmt", "htmlPreError", "htmlPreAttr", "htmlPreProc", "htmlPreProcAttrError", "htmlCssDefinition",
      \  "htmlPreProcAttrName", "htmlHead", "htmlEventSQ")

"}}}
" ++ yaml {{{
" exe "hi! yamlKey" .s:fg_col9
" exe "hi! yamlAnchor" .s:fg_col11
" exe "hi! yamlAlias" .s:fg_col7
" exe "hi! yamlDocumentHeader" .s:fg_col13
" +++ _Normal {{{
hi! link yamlKeyValueDelimiter _Normal
hi! link yamlFlowMapping _Normal
hi! link yamlFlowCollection _Normal
hi! link yamlPlainScalar _Normal
hi! link yamlFlowIndicator _Normal
" +++ }}}
" +++ _Comment {{{
hi! link yamlComment _Comment
" +++ }}}
" +++ _Value {{{
hi! link yamlBool _Value
hi! link yamlFloat _Value
hi! link yamlTimestamp _Value
hi! link yamlInteger _Value
" +++ }}}
" +++ _String {{{
hi! link yamlFlowString _String
hi! link yamlFlowStringDelimiter _String
" +++ }}}
" -------------- col7 --------------
exe "hi! yamlNodeTag" .s:fg_col7
" -------------- col8 --------------
exe "hi! yamlFlowMappingKey" .s:fg_col8
exe "hi! yamlBlockMappingKey" .s:fg_col8
" -------------- col9 --------------
exe "hi! yamlAlias" .s:fg_col9
exe "hi! yamlAnchor" .s:fg_col9 .s:hl_special("underline")
" -------------- col11 --------------
exe "hi! yamlFlowMappingMerge" .s:fg_col11 .s:hl_special("bold")
exe "hi! yamlBlockMappingMerge" .s:fg_col11 .s:hl_special("bold")
" -------------- col13 --------------
exe "hi! yamlBlockCollectionItemStart" .s:fg_col13 .s:hl_special("bold")
" -------------- col14 --------------
exe "hi! yamlNull" .s:fg_col14
" -------------- col15 --------------
exe "hi! yamlDocumentStart" .s:fg_col15
exe "hi! yamlDocumentEnd" .s:fg_col15 .s:hl_special("underline")

call s:h_link("_Unknown", "yamlTodo", "yamlTAGDirective", "yamlYAMLDirective", "yamlReservedDirective", "yamlDirective", "yamlTagHandle",
      \ "yamlTagPrefix", "yamlYAMLVersion", "yamlEscape", "yamlSingleEscape", "yamlBlockScalarHeader", "yamlMappingKeyStart", 
      \ "yamlDirectiveName", "yamlString", "yamlConstant", "yamlKey", "yamlDocumentHeader")
"}}}
" ++ vimfiler {{{
exe "hi! vimfilerNormalFile"  .s:fg_col3
exe "hi! vimfilerROFile"  .s:fg_col7
exe "hi! vimfilerClosedFile"  .s:fg_col9
exe "hi! vimfilerOpenedFile"  .s:fg_col11
exe "hi! vimfilerLeaf"  .s:fg_col13
exe "hi! vimfilerNonMark"  .s:fg_col13
exe "hi! vimfilerMarkedFile"  .s:fg_col14
call s:h_link("_Unknown", "vimfilerMark", "vimfilerCurrentDirectory", "vimfilerStatus", "vimfilerDirectory")
" }}}
" ++ markdown {{{
" +++ _Normal {{{
hi! link mkdLinkTitle _Normal
hi! link mkdListBlock0 _Normal
hi! link mkdListBlock1 _Normal
hi! link mkdListBlock2 _Normal
" +++ }}}
" +++ _String {{{
hi! link mkdCode _String
hi! link mkdIndentCode _String
" +++ }}}
" +++ _Comment {{{
hi! link mkdBlockquote _Comment
" +++ }}}

exe "hi! mkdItalic" .s:fg_col6 .s:hl_special("italic")
exe "hi! mkdBold" .s:fg_col6 .s:hl_special("bold")
exe "hi! mkdBoldItalic" .s:fg_col6 .s:hl_special("bold", "italic")

exe "hi! mkdInlineURL" .s:fg_col7
exe "hi! mkdLinkDefTarget" .s:fg_col7
exe "hi! mkdURL" .s:fg_col7

exe "hi! mkdLinkDelimiter" .s:fg_col9
exe "hi! mkdFootnotesDelimiter" .s:fg_col9

exe "hi! mkdIDDelimiter" .s:fg_col11
exe "hi! mkdCodeDelimiter" .s:fg_col11  .s:hl_special("bold")
exe "hi! mkdDelimiter" .s:fg_col11 .s:hl_special("bold")
exe "hi! mkdInlineCodeDelimiter" .s:fg_col11 .s:hl_special("bold")
exe "hi! markdownCodeDelimiter" .s:fg_col11

exe "hi! mkdLink" .s:fg_col13
exe "hi! mkdListItem" .s:fg_col13
exe "hi! mkdFootnotes" .s:fg_col13

exe "hi! mkdID" .s:fg_col14
exe "hi! mkdLinkDef" .s:fg_col14 .s:hl_special("underline", "bold")

exe "hi! mkdLineBreak" .s:bg_col13
exe "hi! mkdRule" .s:hl_special("reverse")

" なぞ
call s:h_link("_Unknown", "markdownUrl", "mkdIndentCode0", "mkdIndentCode1", "mkdIndentCode2", "mkdFrontmatterDelimiter", "mkdString", "mkdMath", "mkdURLDelimiter")
" ++ }}}
" + }}}
