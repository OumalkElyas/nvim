
local cmp = require("cmp"); 
cmp.setup.filetype({"sql"}, {
    source = {
	{name = "vim-dadbod-completion"},
	{name = "buffer"},
    },
})
