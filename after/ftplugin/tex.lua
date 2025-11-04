
local kmap = vim.keymap.set

-- ctex is a costumed command
--vim.bo.makeprg = 'cd %:h && bash -i "ctex"'
vim.g.vimtex_view_methode = "okular"


vim.api.nvim_buf_set_keymap(0, 'n', '<leader>l', ':w<CR>:make<CR>', {noremap = true, silent = true})

local clean_latex = " && rm -f *.aux *.log *.out *.toc *.synctex.gz *.fls *.fdb_latexmk && rm -rf _minted-main"
local gknapsettings = {
    textopdf = "pdflatex -shell-escape -interaction=nonstopmode -synctex=1 %docroot%" .. clean_latex,
    textopdfviewerlaunch = "okular --unique %outputfile%",
    textopdfviewerrefresh = "none",
    textopdfforwardjump = "okular --unique %outputfile%'#src:%line% '%srcfile%"
}
vim.g.knap_settings = gknapsettings

-- F5 processes the document once, and refreshes the view
kmap({ 'n', 'v', 'i' },'<F5>', function() require("knap").process_once() end)

-- F6 closes the viewer application, and allows settings to be reset
kmap({ 'n', 'v', 'i' },'<F6>', function() require("knap").close_viewer() end)

-- F7 toggles the auto-processing on and off
kmap({ 'n', 'v', 'i' },'<F7>', function() require("knap").toggle_autopreviewing() end)

-- F8 invokes a SyncTeX forward search, or similar, where appropriate
kmap({ 'n', 'v', 'i' },'<F8>', function() require("knap").forward_jump() end)
