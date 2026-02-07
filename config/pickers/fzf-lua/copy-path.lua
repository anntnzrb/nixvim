(function()
	return function(selected, opts)
		if not selected or not selected[1] then
			return
		end

		local path = require("fzf-lua.path")
		local utils = require("fzf-lua.utils")
		local entry = path.entry_to_file(selected[1], opts)

		local value = (entry and (entry.path or entry.bufname)) or selected[1]

		if entry and entry.uri and not value then
			value = entry.uri:gsub("^file://", "")
		end

		if value and not path.is_absolute(value) then
			value = path.join({ opts.cwd or utils.cwd(), value })
		end

		if value then
			vim.fn.setreg('"', value)
			vim.fn.setreg("+", value)
			utils.info("Copied path")
		end
	end
end)()
