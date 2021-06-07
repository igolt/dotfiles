local cmd = vim.cmd
local fn = vim.fn
local gl = require("galaxyline")
local section = gl.section
gl.short_line_list = {"LuaTree", "packager", "Floaterm", "coc-eplorer"}

local one_dark_colors = {
  bg = "#2e3440",
  fg = "#81a1c1",
  line_bg = "#2e3440",
  fg_green = "#6d96a5",
  yellow = "#fabd2f",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#608B4E",
  orange = "#FF8800",
  purple = "#5d4d7a",
  magenta = "#d16d9e",
  grey = "#c0c0c0",
  blue = "#569CD6",
  red = "#D16969"
}

-- local nord_colors = {
--   bg = "NONE",
--   -- bg = "#2E3440",
--   fg = "#81A1C1",
--   line_bg = "NONE",
--   lbg = "#3B4252",
--   fg_green = "#8FBCBB",
--   yellow = "#EBCB8B",
--   cyan = "#A3BE8C",
--   darkblue = "#81A1C1",
--   green = "#8FBCBB",
--   orange = "#D08770",
--   purple = "#B48EAD",
--   magenta = "#BF616A",
--   gray = "#616E88",
--   blue = "#5E81AC",
--   red = "#BF616A"
-- }

local buffer_not_empty = function()
  if fn.empty(fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

section.left[1] = {
  FirstElement = {
    -- provider = function() return '▊ ' end,
    provider = function()
      return "  "
    end,
    highlight = {one_dark_colors.blue, one_dark_colors.line_bg}
  }
}
section.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = one_dark_colors.magenta,
        i = one_dark_colors.green,
        v = one_dark_colors.blue,
        [""] = one_dark_colors.blue,
        V = one_dark_colors.blue,
        c = one_dark_colors.red,
        no = one_dark_colors.magenta,
        s = one_dark_colors.orange,
        S = one_dark_colors.orange,
        [""] = one_dark_colors.orange,
        ic = one_dark_colors.yellow,
        R = one_dark_colors.purple,
        Rv = one_dark_colors.purple,
        cv = one_dark_colors.red,
        ce = one_dark_colors.red,
        r = one_dark_colors.cyan,
        rm = one_dark_colors.cyan,
        ["r?"] = one_dark_colors.cyan,
        ["!"] = one_dark_colors.red,
        t = one_dark_colors.red
      }
      cmd("hi GalaxyViMode guifg=" .. mode_color[fn.mode()])
      return "     "
    end,
    highlight = {one_dark_colors.red, one_dark_colors.line_bg, "bold"}
  }
}
section.left[3] = {
  FileIcon = {
    provider = "FileIcon",
    condition = buffer_not_empty,
    highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, one_dark_colors.line_bg}
  }
}
section.left[4] = {
  FileName = {
    -- provider = "FileName",
    provider = function()
      return fn.expand("%:F")
    end,
    condition = buffer_not_empty,
    separator = " ",
    separator_highlight = {one_dark_colors.purple, one_dark_colors.bg},
    highlight = {one_dark_colors.purple, one_dark_colors.line_bg, "bold"}
  }
}

section.right[1] = {
  GitIcon = {
    provider = function()
      return " "
    end,
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    highlight = {one_dark_colors.orange, one_dark_colors.line_bg}
  }
}
section.right[2] = {
  GitBranch = {
    provider = "GitBranch",
    condition = require("galaxyline.provider_vcs").check_git_workspace,
    separator = "",
    separator_highlight = {one_dark_colors.purple, one_dark_colors.bg},
    highlight = {one_dark_colors.orange, one_dark_colors.line_bg, "bold"}
  }
}

local checkwidth = function()
  local squeeze_width = fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

section.right[3] = {
  DiffAdd = {
    provider = "DiffAdd",
    condition = checkwidth,
    icon = " ",
    highlight = {one_dark_colors.green, one_dark_colors.line_bg}
  }
}
section.right[4] = {
  DiffModified = {
    provider = "DiffModified",
    condition = checkwidth,
    icon = "柳",
    highlight = {one_dark_colors.yellow, one_dark_colors.line_bg}
  }
}
section.right[5] = {
  DiffRemove = {
    provider = "DiffRemove",
    condition = checkwidth,
    icon = " ",
    highlight = {one_dark_colors.red, one_dark_colors.line_bg}
  }
}

section.right[6] = {
  LineInfo = {
    provider = "LineColumn",
    separator = "",
    separator_highlight = {one_dark_colors.blue, one_dark_colors.line_bg},
    highlight = {one_dark_colors.gray, one_dark_colors.line_bg}
  }
}
-- section.right[7] = {
--   FileSize = {
--     provider = "FileSize",
--     separator = " ",
--     condition = buffer_not_empty,
--     separator_highlight = {one_dark_colors.blue, one_dark_colors.line_bg},
--     highlight = {one_dark_colors.fg, one_dark_colors.line_bg}
--   }
-- }

section.right[8] = {
  DiagnosticError = {
    provider = "DiagnosticError",
    separator = " ",
    icon = " ",
    highlight = {one_dark_colors.red, one_dark_colors.line_bg},
    separator_highlight = {one_dark_colors.bg, one_dark_colors.bg}
  }
}
section.right[9] = {
  DiagnosticWarn = {
    provider = "DiagnosticWarn",
    -- separator = " ",
    icon = " ",
    highlight = {one_dark_colors.yellow, one_dark_colors.line_bg},
    separator_highlight = {one_dark_colors.bg, one_dark_colors.bg}
  }
}

section.right[10] = {
  DiagnosticInfo = {
    -- separator = " ",
    provider = "DiagnosticInfo",
    icon = " ",
    highlight = {one_dark_colors.green, one_dark_colors.line_bg},
    separator_highlight = {one_dark_colors.bg, one_dark_colors.bg}
  }
}

section.right[11] = {
  DiagnosticHint = {
    provider = "DiagnosticHint",
    -- separator = " ",
    icon = " ",
    highlight = {one_dark_colors.blue, one_dark_colors.line_bg},
    separator_highlight = {one_dark_colors.bg, one_dark_colors.bg}
  }
}

section.short_line_left[1] = {
  BufferType = {
    provider = "FileIcon",
    separator = " ",
    separator_highlight = {"NONE", one_dark_colors.lbg},
    highlight = {one_dark_colors.blue, one_dark_colors.lbg, "bold"}
  }
}

section.short_line_left[2] = {
  SFileName = {
    provider = function()
      local fileinfo = require("galaxyline.provider_fileinfo")
      local fname = fileinfo.get_current_file_name()
      for _, v in ipairs(gl.short_line_list) do
        if v == vim.bo.filetype then
          return ""
        end
      end
      return fname
    end,
    condition = buffer_not_empty,
    highlight = {one_dark_colors.white, one_dark_colors.lbg, "bold"}
  }
}

section.short_line_right[1] = {
  BufferIcon = {
    provider = "BufferIcon",
    highlight = {one_dark_colors.fg, one_dark_colors.lbg}
  }
}
