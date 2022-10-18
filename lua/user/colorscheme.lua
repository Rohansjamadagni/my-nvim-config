local colorscheme = "onehalflight"

local status_ok, err = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  error("couldnt set:" .. err)
  return
end
