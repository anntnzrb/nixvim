(function()
  -- list only plugin-provided colorschemes (exclude $VIMRUNTIME)
  local vr = vim.env.VIMRUNTIME
  local paths, out, seen = {}, {}, {}

  for _, p in ipairs(vim.api.nvim_list_runtime_paths()) do
    if not (vr and p:sub(1, #vr) == vr) then
      table.insert(paths, p)
    end
  end

  for _, f in ipairs(vim.fn.globpath(table.concat(paths, ","), "colors/*", true, true)) do
    local name = vim.fn.fnamemodify(f, ":t:r")
    if not seen[name] then
      seen[name] = true
      table.insert(out, name)
    end
  end

  -- deduplicate and return a stable order for the picker
  table.sort(out)
  return out
end)()
