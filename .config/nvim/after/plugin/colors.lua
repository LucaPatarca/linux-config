local hour = os.date("*t").hour
local color = "catppuccin-frappe"
if (hour > 19) then
  color = "catppuccin-mocha"
elseif (hour > 16) then
  color = "catppuccin-macchiato"
end
vim.cmd.colorscheme(color)
