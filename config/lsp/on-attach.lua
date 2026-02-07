if client ~= nil and client.server_capabilities.documentHighlightProvider then
	local group = vim.api.nvim_create_augroup("nixvim_lsp_document_highlight_" .. bufnr, { clear = true })

	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
		group = group,
		buffer = bufnr,
		callback = vim.lsp.buf.document_highlight,
		desc = "LSP document highlight",
	})

	vim.api.nvim_create_autocmd("CursorMoved", {
		group = group,
		buffer = bufnr,
		callback = vim.lsp.buf.clear_references,
		desc = "LSP clear references",
	})
end
