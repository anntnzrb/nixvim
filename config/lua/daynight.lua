-- choose day/night theme based on local time
local day_theme = "ef-eagle"
local night_theme = "ef-melissa-dark"
local day_start = (6 * 60) + 30
local night_start = (18 * 60) + 30

local h = tonumber(os.date("%H"))
local m = tonumber(os.date("%M"))
local minutes = (h * 60) + m
local day = minutes >= day_start and minutes < night_start
local scheme = day and day_theme or night_theme

local ok, ef = pcall(require, "ef-themes")
if ok then
	-- disable ef-themes compile cache
	ef.setup({ options = { compile = false } })
end

-- keep bg aligned with the selected theme
vim.o.background = day and "light" or "dark"
vim.cmd.colorscheme(scheme)
