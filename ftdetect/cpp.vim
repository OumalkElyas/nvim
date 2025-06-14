

"autocmd BufNewFile *.cpp call append(0, "// ") | !date+"%H"
"autocmd BufNewFile *.cpp :put ='// oumalk elyas' 
"autocmd BufNewFile *.cpp :r !date +"    \%d-\%m-\%Y  \%H:\%M:\%S" 
autocmd BufNewFile *.cpp call append(0, strftime("//\t%d-%m-%Y  %H:%M:%S"))
"autocmd BufNewFile *.cpp call append(3, "*/")
autocmd BufNewFile *.cpp :r ~/.config/nvim/templates/cpp_template.cpp
