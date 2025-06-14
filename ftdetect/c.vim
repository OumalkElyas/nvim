

autocmd BufNewFile *.c call append(0, strftime("//\t%d-%m-%Y  %H:%M:%S"))
autocmd BufNewFile *.c :r ~/.config/nvim/templates/c_template.c
