"
"               vi-info-fetch
"    (c) lasermtv07 - MIT licence
"     Version 1.0.0 - 01/07/2023
"

function! Fetch()
redir => colors | silent colorsche:me | redir END
"config

let logo_vim=["      |     ","  }}}|||}}}  ","  }}||||}}   "," |}}|||}}|   ","  }}|}}|     ","  }}}|       "]
let logo_nvim=['\\||       ||','\\  ||     ||','\\    ||   ||','\\      || ||','\\         ||']
let text=["  vimfetch", "  --------","  > Version: ".v:progname." ".v:version,"  > Program Path: ".v:progpath,"  > Theme: ".colors,"  > Plugins: ".string(len(g:plugs))]


syntax on

new
normal VggGd
let g:terminal_ansi_colors = 5

if v:progname=="vim"
    if len(logo_vim)>=len(text)
        for x in range(0,len(logo_vim)-1)
            if x<len(text)
                call append(x, logo_vim[x] .. text[x])
            else
                call append(x, logo_vim[x])
            endif
        endfor
    else
         for x in range(0,len(text)-1)
            if x<len(logo_vim)
                call append(x, logo_vim[x] .. text[x])
            else
                let vtemp=""
                for y in range(1,len(logo_nvim[0]))
                    let vtemp =vtemp.." "
                endfor
 
                call append(x, vtemp..text[x])
            endif
        endfor
        
    endif
elseif v:progname=="nvim"
    if len(logo_nvim)>=len(text)
        for x in range(0,len(logo_nvim)-1)
            if x<len(text)
                call append(x, logo_nvim[x] .. text[x])
            else

                call append(x, logo_nvim[x])
            endif
        endfor
    else
         for x in range(0,len(text)-1)
            if x<len(logo_nvim)
                call append(x, logo_nvim[x] .. text[x])
            else
                let vtemp=""
                for y in range(1,len(logo_nvim[0]))
                    let vtemp =vtemp.." "
                endfor
                call append(x, vtemp.text[x])
            endif
        endfor
        
    endif

endif

syntax match gr '|'
highlight gr ctermfg=green

syntax match bl '\\'
highlight bl ctermfg=blue

syntax match rd '!'
highlight rd ctermfg=red

syntax match yl '{'
highlight yl ctermfg=Yellow

highlight link grs gr
highlight link bls bl

endfunction

command! VimFetch :call Fetch() 
