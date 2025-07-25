local M = {}

function M.link_hlgroups(hash, link_mapping)
  for link_name,vs in pairs(link_mapping) do
    for i,v in pairs(vs) do
      hash[v] = { link = link_name }
    end
  end
end

function M.setup()
  local config = require("lighthouse").config
  local colors = config.colors

  config.reset_hlgroups = { "DiffDelete" }

  local hlgroups = {
    -- + グループ化 {{{
    _Comment = { fg = colors.l_gray },
    _Value = { fg = colors.jade },
    _String = { fg = colors.l_green },
    _Regexp = { link = "_String" },
    _Note = { fg = colors.yellow },
    _Error = { fg = colors.red },
    _URL = { fg = colors.l_purple },
    _Unknown = {  bg = "#990000" },
    _Unknown2 = {  bg = "#eeee00" },
    -- }}}

    Normal = { fg = colors.white , bg = colors.black },
    SignColumn = { link = "Normal" },
    NonText = { bg = colors.vd_gray , fg = colors.orange },
    SpecialKey = { fg = colors.green },
    Operator = { fg = colors.white },
    Delimiter = { fg = colors.white },
    Comment = { link = "_Comment" },
    String = { link = "_String" },
    Error = { link = "_Error" },
    ErrorMsg = { link = "_Error" },
    Structure = { link = "Normal" },

    IncSearch = { bg = colors.orange , fg = colors.vd_gray , style = colors.none },
    Search = { bg = colors.orange , fg = colors.vd_gray },
    MatchParen = { bg = colors.none , fg = colors.none, style = colors.underline },
    Visual = { bg = colors.d_gray , fg = colors.none },

    Include = { fg = colors.l_purple },
    StorageClass = { fg = colors.l_blue },
    Statement = { fg = colors.l_blue, style = colors.none },
    Exception = { fg = colors.l_blue, style = colors.none },
    Constant = { link = "_Value" },
    Function = { fg = colors.green },
    Identifier = { fg = colors.green },
    MoreMsg = { fg = colors.green },
    Title = { fg = colors.green },
    WarningMsg = { fg = colors.yellow },
    PreProc = { fg = colors.green },
    Question = { fg = colors.white },
    Special = { fg = colors.purple },
    Type = { fg = colors.blue },
    Conceal = { bg = colors.black , fg = colors.black },
    Todo = { fg = colors.yellow , bg = colors.black },
    Cursor = { bg = colors.white , fg = colors.black },
    CursorColumn = { style = colors.none },
    CursorLine = {  style = colors.underline, bg = colors.none },
    CursorLineNr = { fg = colors.white, bg = colors.vd_gray },
    LineNr = {  bg = "#1f2028" , fg = "#545b71" },
    DiffAdd = {  fg = colors.none, bg = "#1c3333" },
    DiffDelete = {  fg = "#b0a0a8", bg = "#302020" },
    DiffChange = {  bg = "#202238" },
    DiffText = {  fg = "#f0f0a5", bg = "#585838" },
    diffAdded = {  fg = colors.green, bg = "#1c3333" },
    diffRemoved = {  fg = colors.red, bg = "#302020" },
    diffChanged = {  fg = colors.yellow },
    Directory = { fg = colors.blue },
    -- Folded = { fg = colors.jade , bg = colors.vd_gray },
    Folded = { fg = "#b8b8cf", bg = "#4a3b5e" },
    Pmenu = { fg = colors.red       , bg = colors.vd_gray },
    PmenuSel = { fg = colors.green       , bg = colors.vd_gray , style = colors.underline },

    QuickFixLine = { fg = colors.orange, style = colors.underline },
    StatusLine = { bg = "#818596" , fg = "#17171b" },
    StatusLineTerm = { bg = "#818596" , fg = "#17171b" },
    StatusLineNC = { bg = "#0f1117" , fg = "#3e445e" },
    StatusLineTermNC = { bg = "#0f1117" , fg = "#3e445e" },
    StatusLineTerm = { bg = "#818596" , fg = "#17171b" },
    TabLine = {  style = colors.none , bg = "#161821" , fg = "#9a9ca5" },
    Underlined = {  style = colors.underline , fg = colors.red },
    VertSplit = {  bg = "#0f1117" , fg = "#0f1117" },
    FloatBorder = { bg = colors.black, fg = "#b0b4c8" },
    NormalFloat = { bg = colors.black, fg = "#b0b4c8" },
    WildMenu = { bg = colors.m_gray , fg = colors.black },

    ColorColumn = {  bg = "#282840" },

    ZenkakuSpace = { link = "Error" },
    FloatWindowBG = { bg = "#242630" },
  }

  config.hlgroups = vim.tbl_extend(
    "force",
    hlgroups,
    require("lighthouse.hlgroups.treesitter").mapping(),
    require("lighthouse.hlgroups.css").mapping(),
    require("lighthouse.hlgroups.ruby").mapping(),
    require("lighthouse.hlgroups.javascript").mapping(),
    require("lighthouse.hlgroups.html").mapping(),
    require("lighthouse.hlgroups.yaml").mapping(),
    require("lighthouse.hlgroups.defx").mapping(),
    require("lighthouse.hlgroups.markdown").mapping(),
    require("lighthouse.hlgroups.toml").mapping(),
    require("lighthouse.hlgroups.syntastic").mapping(),
    require("lighthouse.hlgroups.telescope").mapping(),
    require("lighthouse.hlgroups.nvim-cmp").mapping()
  )

  local link_mapping = {
    _Unknown = {
      "PmenuSBar", "PmenuThumb", "FoldColumn",
      "SpellBad", "SpellCap", "SpellLocal", "SpellRare",
    },
  }
  M.link_hlgroups(config.hlgroups, link_mapping)
-- EndOfBuffer    xxx links to NonText
-- TermCursor     xxx cterm=reverse gui=reverse
-- TermCursorNC   xxx cleared
-- ModeMsg        xxx cterm=bold gui=bold
-- LineNrAbove    xxx links to LineNr
-- LineNrBelow    xxx links to LineNr
-- CursorLineSign xxx links to SignColumn
-- CursorLineFold xxx links to FoldColumn
-- VisualNC       xxx cleared
-- FoldColumn     xxx ctermfg=14 ctermbg=242 guifg=Cyan guibg=Grey
-- PmenuSbar      xxx ctermbg=248 guibg=Grey
--                    links to Unknown
-- PmenuThumb     xxx ctermbg=15 guibg=White
--                    links to Unknown
-- Whitespace     xxx links to NonText
-- NormalNC       xxx cleared
-- MsgSeparator   xxx links to StatusLine
-- NormalFloat    xxx links to Pmenu
-- MsgArea        xxx cleared
-- FloatBorder    xxx links to VertSplit
-- RedrawDebugNormal xxx cterm=reverse gui=reverse
-- RedrawDebugClear xxx ctermbg=11 guibg=Yellow
-- RedrawDebugComposed xxx ctermbg=10 guibg=Green
-- RedrawDebugRecompose xxx ctermbg=9 guibg=Red
-- lCursor        xxx guifg=bg guibg=fg
-- Substitute     xxx links to Search
-- FloatShadow    xxx guibg=Black blend=80
-- FloatShadowThrough xxx guibg=Black blend=100
-- Float          xxx links to Number
-- Conditional    xxx links to Statement
-- Repeat         xxx links to Statement
-- Label          xxx links to Statement
-- Keyword        xxx links to Statement
-- Define         xxx links to PreProc
-- Macro          xxx links to PreProc
-- PreCondit      xxx links to PreProc
-- Structure      xxx links to Unknown
-- Typedef        xxx links to Type
-- Tag            xxx links to Special
-- SpecialChar    xxx links to Special
-- SpecialComment xxx links to Special
-- Debug          xxx links to Special
-- Underlined     xxx cterm=underline ctermfg=81 gui=underline guifg=#d48585
-- Ignore         xxx ctermfg=0 guifg=bg
-- false          xxx cleared
-- diffRemoved    xxx cleared
-- diffChanged    xxx cleared
-- diffAdded      xxx cleared
-- BlueSign       xxx cleared
-- Method         xxx cleared
-- Struct         xxx cleared
end

return M
