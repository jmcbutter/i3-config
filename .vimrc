call plug#begin('~/.vim/plugged')
	Plug 'tpope/vim-fugitive'
	Plug 'universal-ctags/ctags'
	Plug 'preservim/nerdtree'
	Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
	Plug 'junegunn/fzf.vim'
    	Plug 'nordtheme/vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'tpope/vim-commentary'
call plug#end()

colorscheme nord
if (has("termguicolors"))
        set termguicolors
endif

syntax on 
set number 
set noswapfile
set hlsearch 
set ignorecase
set incsearch 
set showcmd
set foldmethod=manual
set nu rnu

" Set HTML Rules
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab

" Set Liquid Rules
au BufRead,BufNewFile *.html.liquid set filetype=html
au BufRead,BufNewFile *.css.liquid set filetype=css
au BufRead,BufNewFile *.scss.liquid set filetype=scss
au BufRead,BufNewFile *.js.liquid set filetype=javascript
autocmd FileType liquid setlocal shiftwidth=2 tabstop=2 expandtab

" Set CSS Rules
autocmd FileType css setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType scss setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType css set foldmethod=syntax
autocmd FileType scss set foldmethod=syntax


" Set PHP Rules
autocmd FileType php setlocal shiftwidth=4 tabstop=4 expandtab

nnoremap <leader>n :NERDTreeToggle<CR>

let $FZF_DEFAULT_COMMAND = 'find .'
nnoremap <leader>f :Files<CR>
nnoremap <leader>a :Ag<CR>

" Use <TAB> to select the popup menu from CoC
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Go to definition and references using gd and gr
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Set Prettier to work in CoC 
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" Change cursor on insert mode
let &t_SI = "\<Esc>[1 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"


" Remove lag from cursor change
set ttimeout
set ttimeoutlen=0
set ttyfast

" Start file unfolded
set foldlevelstart=99
" Set folded line style
highlight Folded guibg=#434C5E guifg=#A3BE8C
" Fold text neatly
function! NeatFoldText()
    let line = getline(v:foldstart)
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = line
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

set foldtext=NeatFoldText()
