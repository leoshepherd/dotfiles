vim.cmd[[
function! GitModified()
    cexpr system("git status --porcelain | awk 'match($1, \"M\"){print $2\":1:    *\"}'")
    copen
endfunction

function! GradleFailures()
    let out = system("gradle clean build 2>&1 | grep .java")
    let split = split(out, '\n')
    let locations = []
    for string in split
        let exception = split(string, ' ')[0]
        let lineNumber = split(string, ':')[1]
        let file = split(split(string, ' ')[2], ':')[0]
        let fullPath = substitute(system('find . -type f -name "' . file . '"'), '\n', '', ''))
        call(add(locations, fullPath . ':' . lineNumber . ':    ' . exception))
    endfor
    cexpr
    copen
endfunction

function! OpenFloatingWindow(width, height, buf, title)
    let ui = nvim_list_uis()[0]

    let options = {
        \ 'relative': 'editor',
        \ 'height': a:height,
        \ 'width': a:width,
        \ 'col': (ui.width/2) - (a:width/2),
        \ 'row': (ui.height/2) - (a:height/2),
        \ 'anchor': 'NW',
        \ 'border': 'double',
        \ 'title': a:title,
        \ 'style': 'minimal'
        \}
    return nvim_open_win(a:buf, 1, options)
endfunction

function! OpenTerminalWindow()
    call OpenFloatingWindow(140, 40, nvim_create_buf(v:false, v:true), 'TERMINAL')
    terminal
    startinsert
endfunction
]]
