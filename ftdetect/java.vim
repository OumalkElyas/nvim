
autocmd BufNewFile *.java call append(0, strftime("//\t%d-%m-%Y  %H:%M:%S"))
autocmd BufNewFile *.java call append(1, "//\to_elyas")
