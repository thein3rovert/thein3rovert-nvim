local I = {
  "██╗",
  "██║",
  "██║",
  "██║",
  "██║",
  "╚═╝",
}
local V = {
  "██╗   ██╗",
  "██║   ██║",
  "██║   ██║",
  "╚██╗ ██╔╝",
  " ╚████╔╝ ",
  "  ╚═══╝  ",
}
local THREE = {
  "██████╗ ",
  "╚════██╗",
  " █████╔╝",
  " ╚═══██╗",
  "██████╔╝",
  "╚═════╝ ",
}
local spacer = "  "
local logo_lines = {}
for i = 1, 6 do
  logo_lines[i] = I[i] .. spacer .. V[i] .. spacer .. THREE[i]
end

return table.concat(logo_lines, "\n")
