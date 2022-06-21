local M = {}

function M.mapping()
  local config = require("lighthouse").config
  local colors = config.colors

  local mapping = {
    Defx_filename_3_directory = { fg = colors.blue , bg = colors.black },
    Defx_filename_3 = { link = "Normal" },
    -- Defx_mark_0    xxx cleared
    -- Defx_mark_0_readonly xxx links to Comment
    -- Defx_mark_0_selected xxx links to Statement
    -- Defx_filename_3 xxx cleared
    Defx_filename_3 = { fg = colors.blue },
    DefxIconsMarkIcon = { fg = colors.yellow , style = colors.underline },
    -- Defx_filename_3_directory_icon xxx links to Special
    -- Defx_filename_3_opened_icon xxx links to Special
    -- Defx_filename_3_root_icon xxx links to Identifier
    -- Defx_filename_3_directory_marker xxx cleared
    -- Defx_filename_3_file xxx cleared
    -- Defx_filename_3_file_marker xxx cleared
    -- Defx_filename_3_root xxx links to Identifier
    -- Defx_filename_3_root_marker xxx links to Constant
    -- Defx_filename_3_hidden xxx links to Comment
    -- Defx_type_4    xxx cleared
    -- Defx_type_4_text xxx links to Constant
    -- Defx_type_4_image xxx links to Type
    -- Defx_type_4_archive xxx links to Special
    -- Defx_type_4_executable xxx links to Statement
  }

  require("lighthouse.hlgroups").link_hlgroups(mapping, {
    _Unknown2 = {
      "Defx_mark_0", "Defx_mark_0_readonly", "Defx_mark_0_selected", "Defx_filename_3", "Defx_filename_3_directory_icon",
      "Defx_filename_3_opened_icon", "Defx_filename_3_root_icon", "Defx_filename_3_directory_marker", "Defx_filename_3_file",
      "Defx_filename_3_file_marker", "Defx_filename_3_root", "Defx_filename_3_root_marker", "Defx_filename_3_hidden",
      "Defx_type_4", "Defx_type_4_text", "Defx_type_4_image", "Defx_type_4_archive", "Defx_type_4_executable",
    }
  })

  return mapping
end

return M
