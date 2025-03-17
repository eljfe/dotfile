let g:vimspector_enable_mappings = 'HUMAN'
packadd! vimspector

nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>dx :call vimspector#Reset()<CR>
nnoremap <Leader>dg :call vimspector#Continue()<CR>
nnoremap <Leader>dc :call vimspector#RunToCursor()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nnoremap <Leader>dr <Plug>VimspectorRestart
nnoremap <Leader>do <Plug>VimspectorStepOut
nnoremap <Leader>dj <Plug>VimspectorStepInto
nnoremap <Leader>dk <Plug>VimspectorStepOver


