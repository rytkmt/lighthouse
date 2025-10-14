local M = {}

function M.mapping()
  local config = require("lighthouse").config
  local colors = config.colors

  local mapping = {
    -- yamlKey = { fg = colors.l_blue
    -- yamlAnchor = { fg = colors.green
    -- yamlAlias = { fg = colors.l_purple
    -- yamlDocumentHeader = { fg = colors.yellow
    -- -------------- l_purple --------------
    yamlNodeTag = { fg = colors.l_purple },
    -- -------------- blue --------------
    yamlFlowMappingKey = { fg = colors.blue },
    yamlBlockMappingKey = { fg = colors.blue },
    -- -------------- l_blue --------------
    yamlAlias = { fg = colors.l_blue },
    yamlAnchor = { fg = colors.l_blue , style = colors.underline },
    -- -------------- green --------------
    yamlFlowMappingMerge = { fg = colors.green , style = colors.bold },
    yamlBlockMappingMerge = { fg = colors.green , style = colors.bold },
    -- -------------- yellow --------------
    yamlBlockCollectionItemStart = { fg = colors.yellow , style = colors.bold },
    -- -------------- orange --------------
    yamlNull = { fg = colors.orange },
    -- -------------- red --------------
    yamlDocumentStart = { fg = colors.red },
    yamlDocumentEnd = { fg = colors.red , style = colors.underline },
  }

  require("lighthouse.hlgroups").link_hlgroups(mapping, {
    Normal = {
      "yamlKeyValueDelimiter",
      "yamlFlowMapping",
      "yamlFlowCollection",
      "yamlPlainScalar",
      "yamlFlowIndicator",
    },
    _Comment = {
      "yamlComment",
    },
    _Value = {
      "yamlBool",
      "yamlFloat",
      "yamlTimestamp",
      "yamlInteger",
    },
    _String = {
      "yamlFlowString",
      "yamlFlowStringDelimiter",
    },
    _Unknown = {
      "yamlTodo", "yamlTAGDirective", "yamlYAMLDirective", "yamlReservedDirective", "yamlDirective", "yamlTagHandle",
      "yamlTagPrefix", "yamlYAMLVersion", "yamlEscape", "yamlSingleEscape", "yamlBlockScalarHeader", "yamlMappingKeyStart",
      "yamlDirectiveName", "yamlString", "yamlConstant", "yamlKey", "yamlDocumentHeader",
    }
  })

  return mapping
end

return M
