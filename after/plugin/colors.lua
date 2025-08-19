
math.randomseed(os.time())

colors = {'retrobox','sorbet','catppuccin','selenized','jellybeans-nvim','tokyonight','ron','wildcharm','unokai','slate','koehler'}
color = colors[math.random(#colors)]

function clearall()
    local groups = {
	"Normal",          -- main text area
	"NormalNC",        -- non-current window
	"EndOfBuffer",     -- empty lines at end
	"VertSplit",       -- vertical split bar
	"SignColumn",      -- sign column (gutter)
	"FoldColumn",      -- fold column
	"StatusLine",      -- bottom bar
	"CursorLine",      -- current line highlight
	"LineNr",          -- line numbers
	"CursorLineNr",    -- current line number
	"WinSeparator",    -- separator line between splits
    }

    for _, group in ipairs(groups) do
	vim.api.nvim_set_hl(0, group, { bg = "none" })
    end
end

set_col = function(col)
    vim.cmd.colorscheme(col)
    clearall()
    vim.api.background = "dark"
end

-- _G.set_col = set_col

vim.api.nvim_create_user_command("SetCol", function(opts)
    set_col(opts.args)
end, { nargs = 1 })


set_col(color)


