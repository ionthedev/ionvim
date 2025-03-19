return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		{
			"luukvbaal/statuscol.nvim",
			config = function()
				local builtin = require("statuscol.builtin")
				require("statuscol").setup({
					relculright = true,
					segments = {
						{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
						{ text = { "%s" }, click = "v:lua.ScSa" },
						{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
					},
				})
			end,
		},
	},
	event = "BufReadPre",
	config = function()
		local ufo = require("ufo")
		
		-- Set fold options
		vim.o.foldlevel = 99      -- Start with all folds open
		vim.o.foldlevelstart = 99 
		
		-- Define a custom handler to determine which nodes to fold
		local function fold_only_functions(bufnr)
			return function(lnum)
				-- Get the syntax or treesitter node at this line
				local line = vim.api.nvim_buf_get_lines(bufnr, lnum-1, lnum, false)[1]
				
				-- Simple pattern matching for function definitions across common languages
				-- This is a basic approach without relying on complex treesitter queries
				local is_function = false
				
				-- Check file type for better matching
				local ft = vim.bo[bufnr].filetype
				
				if ft == "lua" then
					-- Match Lua function definitions
					is_function = line:match("^%s*function") or line:match("^%s*local%s+function")
				elseif ft == "python" then
					-- Match Python function definitions
					is_function = line:match("^%s*def%s+") or line:match("^%s*async%s+def%s+")
				elseif ft == "javascript" or ft == "typescript" or ft == "jsx" or ft == "tsx" then
					-- Match JS/TS function definitions
					is_function = line:match("^%s*function") or 
								 line:match("^%s*const%s+%w+%s*=%s*function") or
								 line:match("^%s*const%s+%w+%s*=%s*%(") or
								 line:match("^%s*%w+%s*%(") -- Method in class
				elseif ft == "cpp" or ft == "c" then
					-- Match C/C++ function definitions (very basic)
					is_function = line:match("^[%w%s%*]+%s+%w+%s*%(")
				end
				
				-- If it's a function, fold it
				if is_function then
					return ">1" -- Start fold at level 1
				end
				
				-- Otherwise use the default indent folding
				return "-1"
			end
		end
		
		-- Command to apply function-only folding
		vim.api.nvim_create_user_command("FoldFunctions", function()
			local bufnr = vim.api.nvim_get_current_buf()
			
			-- First close all folds
			vim.cmd("normal! zM")
			
			-- Then only open non-function folds
			-- This approach is simpler than trying to selectively close function folds
			local lines = vim.api.nvim_buf_line_count(bufnr)
			local fold_handler = fold_only_functions(bufnr)
			
			for i = 1, lines do
				if fold_handler(i) ~= ">1" then
					-- Try to open this fold if it's not a function
					pcall(vim.cmd, i .. "normal! zo")
				end
			end
		end, {})
		
		ufo.setup({
			open_fold_hl_timeout = 400,
			provider_selector = function(bufnr, filetype, buftype)
				return {'treesitter', 'indent'}
			end,
			-- Add a keybinding to toggle function-only folding
			-- This adds a key binding to invoke our custom folding
			enable_get_fold_virt_text = true,
			fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
				-- Customize the folded text line if desired
				return virtText
			end
		})
		
		-- Add keybinding for function folding
		vim.keymap.set("n", "<leader>ff", ":FoldFunctions<CR>", { noremap = true, silent = true, desc = "Fold functions only" })
	end,
}
