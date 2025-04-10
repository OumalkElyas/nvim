

autocmd BufNewFile *.c call append(0, "/*") | call append(1, "\to_elyas")
"autocmd BufNewFile *.cpp :put ='// oumalk elyas' 
"autocmd BufNewFile *.cpp :r !date +"    \%d-\%m-\%Y  \%H:\%M:\%S" 
autocmd BufNewFile *.c call append(2, strftime("\t%d-%m-%Y  %H:%M:%S"))
autocmd BufNewFile *.c call append(3, "*/")
autocmd BufNewFile *.c :r ~/.config/nvim/templates/c_template.c
