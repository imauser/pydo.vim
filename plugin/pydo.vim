if !has('python')
    finish
endif
map <Leader>p :call pydo#DoFromVisualHere()<CR>

!function MeinTest()
py print("hello")
endfunction

map <Leader>l :call pydo#DoFromVisualHere()<CR>
