" <zo> to open folds, <zc> to close
" <za> to toggle folds

" debugging
" echo '>> ' . $PATH . '\r>> ' $SHELL


"{{{ BASIC OPTIONS 
set clipboard=unnamed 				" yanks to clipboard	
set number                                                                              
set relativenumber					" insert mode nav aid
set rnu
set wildmenu 						" command keystroke prediction	
set wildmode=list:longest 			" bash style prediction	
set ignorecase 						" search enhancement	
set smartcase 						" ... but allow you to use CAPS if needed
set showcmd 						" command completion	
                                                                                        
set shiftwidth=4                                                                        
set tabstop=4                                                                           
set tabstop=4                                                                           
set scrolloff=10 					" keeps the cursor mid-high as you scroll	
set nowrap          	 			" forces lines all the way	
set autoread           				" Reload files that have not been modified	
set backspace=2         			" Makes backspace behave right
set t_Co=256   						" set colourspace	
set splitbelow splitright 			" new splits appear as expected	

set foldmethod=marker
set timeoutlen=2500					" slows down chording of key mappings so 	
                                    " `jk` doesn't drop down a line each time
" 2023.07                                                                       
" this is a big deal... in cordination with .zshrc                              
" and the env variables there in                                                
set runtimepath=$DOTFILES/vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after     
set packpath=$DOTFILES/vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after        

"}}}

"{{{ KEY MAPPING
inoremap jk <ESC> 				" easier INSERT mode escaping
nnoremap Y y$
nnoremap Q @q

" `:echo mapleader` to verify
let mapleader=" "         " The <leader> key

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

":map <expr> <leader>c "<esc><c-v>" . count . "jki#<esc>"
":map <expr> <leader>cc "<esc><c-v>" . count . "jx<esc>"

":map <leader>p :w<cr> :!clear && python3 % \|less<cr>

"}}}

"{{{ KEYBOARD


"}}}

"{{{ LAYOUT

" resizing splits made easier
noremap <silent> <c-left> :vertical resize -3<cr>
noremap <silent> <c-right> :vertical resize +3<cr>
noremap <silent> <c-up> :resize -3<cr>
noremap <silent> <c-down> :resize +3<cr>

"}}}

"{{{ COLOURS
set colorcolumn=80        " Highlight 80 character limit
highlight ColorColumn ctermbg=234
" thx https://www.ditig.com/256-colors-cheat-sheet


" Only 256 colourspace!
" Color Picker https://www.ditig.com/256-colors-cheat-sheet
" these set the context menus... mostly a CoC thing
" highlight Pmenu ctermfg=255 ctermbg=235 guibg=252 
" highlight PmenuSel ctermfg=0 ctermbg=187 guibg=236
highlight Cursor guifg=white guibg=Grey82
" highlight Pmenu ctermfg=255 ctermbg=235 
" highlight PmenuSel ctermfg=0 ctermbg=187
" the parentheses (brackets) highlighter used to hurt my eyes
" highlight MatchParen ctermbg=242 guibg=Grey40

syntax on
"}}}

"{{{ PLUGINS
" To generate the documentation helptags for a plugin, say 
" foo, run the following inside Vim (required only once):
"   `:helptags ~/.vim/pack/plugins/start/foo`
" Or to generate the helptags for everything in Vim's 
" runtimepath, run     `:helptags ALL`

"{{{2 Airline
" view airline-themes
" https://github.com/vim-airline/vim-airline/wiki/Screenshots

" add buffer info to tab line
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" let g:airline_theme='ayu_dark'
"}}}2

"{{{ VimTex
" vimtex 
filetype plugin indent on
syntax enable

"}}}

"}}}

