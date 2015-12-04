if !has('python')
    finish
endif

" init on start
augroup pydoStart
  autocmd!
  autocmd VimEnter * call pydoScripts#init()
augroup END

" shortcuts:
map <Leader>v :python LittleHelper.visual_query_inplace("eval")<CR>
map <Leader>x :python LittleHelper.visual_query_inplace("exec")<CR>
map <Leader>d :python delete_visual_selection()<CR>
