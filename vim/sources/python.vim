" :map <expr> <leader>. "m90<esc><c-v>" . count . "jkI# <esc>0<c-v>" .count. "jkf#hd<esc>`9"
" :map <expr> <leader>/ "m90<esc><c-v>" . count . "jkld<esc>`9<esc>"
" :map <leader>p :w<cr> :!clear && python3 "%" \|less<cr>
"
" copy paste into commandline with :p
" note it seems that :p will sometimes paste the entire line including comments
" in this case :v$ to select your text, then copy/paste from system clipboard.

" abbreviations

iab pf print(f"{}") <esc>4hi
iab pr print() <esc>hi
iab dfun <esc>Idef() ->:<cr>pass<esc>k0ea
iab dmain <ESC>Idef main():<CR><ESC>04i<SPACE><ESC>apass<CR><CR><CR><ESC>Iif __name__ == "__main__":<CR><ESC>0<ESC>4i<SPACE><ESC>amain()


" Ale
nnoremap <silent> <leader>aj :ALENext<cr>
nnoremap <silent> <leader>ak :ALEPrevious<cr>

