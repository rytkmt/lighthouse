local M = {}

function M.mapping()
  local config = require("lighthouse").config
  local colors = config.colors

  local mapping = {
    -- "------------ l_purple --------------"
    -- #id "
    cssIdentifier = { fg = colors.l_purple },
    -- "---------- blue ------------"
    -- -moz- -webkit- "
    cssVendor = { fg = colors.blue },
    -- animation-name animation-duration "
    cssAnimationProp = { fg = colors.blue },
    -- content "
    cssPageProp = { fg = colors.blue },
    -- background background-color "
    cssBackgroundProp = { fg = colors.blue },
    -- border border-color "
    cssBorderProp = { fg = colors.blue },
    -- margin padding margin-right "
    cssBoxProp = { fg = colors.blue },
    -- opacity "
    cssColorProp = { fg = colors.blue },
    -- width height "
    cssDimensionProp = { fg = colors.blue },
    -- font-size font-family "
    cssFontProp = { fg = colors.blue },
    -- page-break-before: always <-- page-break-before "
    cssMultiColumnProp = { fg = colors.blue },
    -- font-family: myFont; src:url(some); <-- font-family src "
    cssFontDescriptorProp = { fg = colors.blue },
    -- counter-increment: popular_img; "
    cssGeneratedContentProp = { fg = colors.blue },
    -- target-new:none; <-- target_new "
    cssHyerlinkProp = { fg = colors.blue },
    -- list-style-type:none; <-- list-style-type "
    cssListProp = { fg = colors.blue },
    -- display: float: left: top: position: <-- :以外"
    cssPositioningProp = { fg = colors.blue },
    -- table-layout:auto; <-- table-layout"
    cssTableProp = { fg = colors.blue },
    -- line-height:2; color:red; <-- line-height color "
    cssTextProp = { fg = colors.blue },
    -- transform: scale(1.5); <-- transform "
    cssTransformProp = { fg = colors.blue },
    -- transition: some; transition-property:some <-- transition transition-property "
    cssTransitionProp = { fg = colors.blue },
    -- box-sizing: some; cursor: some; <-- box-sizing cursor "
    cssUIProp = { fg = colors.blue },
    -- zoom: some; interpolation-mode: some; filter: some <-- zoom inter@olation-mode filter "
    cssIEUIProp = { fg = colors.blue },
    -- pitch: some; <-- pitch "
    cssAuralProp = { fg = colors.blue },
    -- text-size-adjust: some; <-- text-size-adjust "
    cssMobileTextProp = { fg = colors.blue },
    -- box-shadow: some <-- box-shadow "
    cssFlexibleBoxProp = { fg = colors.blue },
    -- @media screen{ min-color: some} <-- min-color "
    cssMediaProp = { fg = colors.blue },
    -- "------------ l_blue --------------"
    -- @charset "
    cssIncludeKeyword = { fg = colors.l_blue },
    -- @font-face "
    cssFontDescriptor = { fg = colors.l_blue },
    -- .class <-- . "
    cssClassNameDot = { fg = colors.l_blue },
    -- .class <-- class "
    cssClassName = { fg = colors.l_blue },
    -- .top_margin{} <-- _ "
    cssHacks = { fg = colors.l_blue },
    -- "------------ green -------------"
    -- div ul "
    cssTagName = { fg = colors.green },
    -- "---------- yellow -----------"
    -- selector:pseudo-class{} <-- pseudo-class "
    cssPseudoClass = { fg = colors.yellow },
    -- @page:first <-- :first "
    cssPagePseudo = { fg = colors.yellow },
    -- input:checked div:hover <-- :checked :hover "
    cssPseudoClassId = { fg = colors.yellow },
    -- content: open-quote <-- open quote "
    cssGeneratedContentAttr = { fg = colors.yellow },
    -- "---------- orange -----------"
    -- input[type=radio] <-- type radio "
    cssAttributeSelector = { fg = colors.orange },
  }

  require("lighthouse.hlgroups").link_hlgroups(mapping, {
    Normal = {
      "cssStyle",
      -- propety: some; <-- : ;"
      "cssNoise",
      -- selector{ } <-- { }"
      "cssBraces",
      -- scale(x,y) <-- , "
      "cssFunctionComma",
      -- #ff0000 red <-- ff0000 red "
      "cssColor",
      -- rect(0px auto, auto auto) <-- \s auto"
      "cssFunction",
      -- propety: some <-- \s % "
      "cssAttrRegion",
      -- none "
      "cssCommonAttr",
      -- url(some) <-- url( )"
      "cssFunctionName",
      -- linear-gradient(left, #fff, rgba(255,0,0,0) <-- left "
      "cssGradientAttr",
      -- background: #fff url(some) top center no-repeat <-- top center no-repeat; "
      "cssBackgroundAttr",
      -- border:solid 1px #fff; <-- solid "
      "cssBorderAttr",
      -- margin: auto; overflow: hidden "
      "cssBoxAttr",
      -- font-family: Arial <-- Arial "
      "cssFontAttr",
      -- #FF0000 10px 2em 3Hz <-- # px em Hz"
      "cssUnitDecorators",
      -- @media (orientation: landscape){} <-- landscape"
      "cssMediaAttr",
      -- @media screen, print <-- , "
      "cssMediaComma",
      -- @media screen and (max-width:480px) <-- \s : ( ) "
      "cssInclude",
      -- break-after:column; <-- column "
      "cssMultiColumnAttr",
      -- animation-iteration-count: infinite; <-- infinite "
      "cssAnimationAttr",
      -- list-style: square url('../images/ico32.gif') inside <-- insize squeare"
      "cssListAttr",
      -- display:block; position:absolute; float:left <-- block absolute left "
      "cssPositioningAttr",
      -- page-break-inside: avoid; size:landscape; <-- avoid landscape "
      "cssPrintAttr",
      -- page-break-before: always; <-- always "
      "cssTableAttr",
      -- frex-wrap:nowrap; word-break:break-all; text-decoration:underline <-- nowrap break-all underline "
      "cssTextAttr",
      -- transition : width 1s ease-out; transition:1s linear <-- ease-out linear "
      "cssTransitionAttr",
      -- content:some; zoom:1; cursor:pointer; <-- content zoom pointer "
      "cssUIAttr",
      -- interpolation-mode:bicubic <-- bicubic "
      "cssIEUIAttr",
      -- voice-family:male; <-- male"
      "cssAuralAttr",
      -- , "
      "cssAttrComma",
      -- #aaa + .bbb > .test <-- + >  "
      "cssSelectorOp",
      -- input[type=radio] <-- = "
      "cssSelectorOp2",
      -- @media screen and (min-width:480px) <-- and "
      "cssMediaKeyword",
      -- :lang(en) :lang(no) <-- en no "
      "cssPseudoClassFn",
      -- @media screen and print <-- screen print all "
      "cssMediaType",
      -- @keyframes some { 0% {} 30%{} } <-- 0% 30% "
      "cssKeyFrameSelector",
      -- "z-index:2; line-height:1; <-- 2 1 (IntegerはNumberでもあるのでNumberが優先される
    },
    _Value = {
      "cssValueInteger",
      -- "z-index:2; transform:scale(1,2.3) <-- 2 1 2.3 "
      "cssValueNumber",
      -- padding:20px; font-size:14em; <-- 20 14 "
      "cssValueLength",
      -- transform:rotateX(360deg); <-- 360 "
      "cssValueAngle",
      -- transition: 0.2s linear; <-- 0.2 "
      "cssValueTime",
      -- 14Hz 3kHz <-- 14 3 "
      "cssValueFrequency",
      -- url(img/arw.png) <-- img/arw.png "
      "cssURL",
      -- url(sansation_light.woff) <-- sansation_light.woff "
      "cssFontDescriptorFunction",
      -- unicode-range: U+000-5FF, U+1e00-1fff, U+2000-2300;"
      "cssFontDescriptorAttr",
    },
    _String = {
      -- content: "\2193"; <-- \2193
      "cssUnicodeEscape",
      -- 'some' "
      "cssStringQ",
      -- "some" "
      "cssStringQQ",
      -- "\\\\" "
      "cssSpecialCharQQ",
      -- '\\\\' "
      "cssSpecialCharQ",
    },
    _Error = {
      -- !important "
      "cssImportant",
    },
    _Unknown = {
      "cssMediaBlock", "cssError", "cssDefinition", "cssPageWrap", "cssPage",
      "cssPageMargin", "cssKeyFrameWrap", "cssKeyFrame", "cssFontDescriptorBlock",
      "cssFlexibleBoxAttr", "cssGridProp", "cssBraceError", "cssDeprecated", "cssProp",
      "cssContentForPagedMediaProp", "cssMarqueeProp", "cssPagedMediaProp", "cssRubyProp",
      "cssSpeechProp", "cssRenderProp", "cssAttr", "cssContentForPagedMediaAttr", "cssDimensionAttr",
      "cssGridAttr", "cssHyerlinkAttr", "cssLineboxAttr", "cssMarginAttr", "cssMarqueeAttr",
      "cssPaddingAttr", "cssPagedMediaAttr", "cssRubyAttr", "cssSpeechAttr", "cssTransformAttr",
      "cssRenderAttr", "cssPseudoClassLang",
    }
  })

  return mapping
end

return M
