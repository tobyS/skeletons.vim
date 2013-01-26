let s:skeletons = {}

func! skeletons#RegisterSkeletons(dir)
    let l:files = glob(a:dir . "/*", 0, 1)
    for l:file in l:files
        call s:RegisterSkeleton(l:file)
    endfor
endfunc

func! skeletons#InsertSkeleton()
    let l:filetypematch = matchlist(&ft, '\.\?\([^.]\+\)$')
    let l:filetype = l:filetypematch[1]

    if !has_key(s:skeletons, l:filetype)
        return
    endif

    let l:snippet = join(readfile(s:skeletons[l:filetype]), "\n")

    call UltiSnips_Anon(l:snippet)
endfunc

func! s:RegisterSkeleton(file)
    let l:matches = matchlist(a:file, '\.\([^.]\+\)$')

    if (len(l:matches) < 2)
        return
    endif
    let s:skeletons[l:matches[1]] = a:file
endfunc
