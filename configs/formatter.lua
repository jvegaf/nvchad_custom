local M = {
  filetype = {
    javascript = {
      require("formatter.filetypes.javascript").prettier
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier
    },
    lua = {
      require("formatter.filetypes.lua").stylua
    },
    java = {
      require("formatter.filetypes.java").clang_format
    },
    c = {
      require("formatter.filetypes.c").clang_format
    },
    cpp = {
      require("formatter.filetypes.cpp").clang_format
    },
    xml = {
      require("formatter.filetypes.xml").lemminx
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}



return M
