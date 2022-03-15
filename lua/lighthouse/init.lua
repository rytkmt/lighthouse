local M = {}

local function set_highlights()
  for i, group in pairs(M.config.reset_hlgroups) do
    vim.cmd("hi clear " .. group)
  end

  for group, color in pairs(M.config.hlgroups) do
    if not vim.tbl_isempty(color) then
      if color.link then
        vim.cmd("hi! link " .. group .. " " .. color.link)
      else
        local fg = color.fg and "guifg=" .. color.fg .. " " or ""
        local bg = color.bg and "guibg=" .. color.bg .. " " or ""
        local style = color.style and "gui=" .. color.style .. " " or ""
        local guisp = color.guisp and "guisp=" .. color.guisp .. " " or ""
        vim.cmd("hi " .. group .. " " .. fg .. bg .. style .. guisp)
      end
    end
  end
end

M.config = {}

function M.load()
  vim.g.colors_name = "lighthouse"
  vim.o.termguicolors = true

  require("lighthouse.colors").setup()
  require("lighthouse.hlgroups").setup()

  set_highlights()
end

return M
