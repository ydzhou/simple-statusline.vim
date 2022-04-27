function! SimStatusline() abort
	let focused = g:statusline_winid == win_getid(winnr())
    if !focused
        return ''
    endif    
    if mode() == 'n'
        let modeSymbol = '普通'
    elseif mode() == 'i'
        let modeSymbol = '插入'
    else
        let modeSymbol = '可视'
    endif
    let statusline = modeSymbol . " %03l,%03v %p%% %<%=%F%m%r%h%w"
	return statusline
endfunction

function! BufferStatusline() abort
	let focused = g:statusline_winid == win_getid(winnr())
    if !focused
        return ''
    endif    
    if mode()=='n'
        return '缓冲区 ' . BufferList()
    endif    
    let statusline = '%03l,%03v %p%% %<%=%F%m%r%h%w'
	return statusline
endfunction

function! BufferList() abort
    let bufline = ''
    for bufinfo in getbufinfo({'buflisted': 1})
        let bufline = bufline . bufinfo.bufnr . ':'
        if exists('*WebDevIconsGetFileTypeSymbol')
            let bufline = bufline . WebDevIconsGetFileTypeSymbol(bufinfo.name)
        endif
        let bufline = bufline . fnamemodify(bufinfo.name, ':t') . ' '
    endfor
    return bufline
endfunction
