if !exists("g:skeletons_dir")
    let g:skeletons_dir = $HOME . "/.vim/skeletons"
endif

if !exists("g:skeletons_autoregister")
    let g:skeletons_autoregister = 1
endif

call skeletons#RegisterSkeletons(g:skeletons_dir)

if g:skeletons_autoregister
    autocmd BufNewFile * call skeletons#InsertSkeleton()
endif
