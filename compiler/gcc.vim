

" set error format for gcc and enable errors
"compiler gcc
"setlocal errorformat=%f:%l:%c\ %m
"setlocal makeprg=g++\ -Wall\ -Wextra\ -o\ %<\ %

" highlight errors in red
"highlight QuickFixLine ctermbg=red guibg=#ff0000
