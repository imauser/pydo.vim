if !has('python')
    finish
endif
map <Leader>p :call pydo#DoFromVisualHere()<CR>
