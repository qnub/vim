set nocompatible
set exrc
filetype off

call pathogen#helptags()
call pathogen#infect()

filetype plugin indent on
syntax enable

" Основные настройки
set spelllang=ru_yo,en_us,sv
set langmap=Ж:,йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,э',яz,чx,сc,мv,иb,тn,ьm,,ю.,ё`,./
set t_Co=256
set autoindent
set autoread " Reload files changed outside automatically
set backspace=indent,eol,start
set eol
set expandtab
set hlsearch
set incsearch " Show search matches while typing
set lazyredraw
set nobackup
set noshowmode
set shiftwidth=4
set showcmd
set showmatch
set smartindent
set smarttab
set tabstop=4
set title
set ttyfast
set number
set wildmenu
set wildmode=list:longest,list:full " Wildmenu configuration
set wildignore+=*.o,*.pyc,*.jpg,*.png,*.gif,*.db,*.obj,.git " Ignore compiled files
set exrc " enable reading .exrc files for each dir
set hidden
set cursorline

" Store swap, backup and undo files in fixed location
set dir=/var/tmp//,/tmp//,.
set backupdir=/var/tmp//,/tmp//,.
set history=64
set undolevels=128
set undodir=~/.vim/undodir/
set undofile
set undolevels=100
set undoreload=1000

" настраиваем раскладку
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set listchars=eol:$

nnoremap <F8> :wa<cr>
nnoremap <F10> :qa<cr>

if filereadable("./.session.vim")
    autocmd VimEnter * :source ./.session.vim
endif

autocmd VimLeave * :mksession ./.session.vim

" Настраиваем табы
autocmd TabLeave * let g:lasttab = tabpagenr()
set <C-left>=[D
set <C-Right>=[C
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" higlight but not jump
nnoremap * *N

" Подсвечивает по звёздочке выделенный блок во всём файле
vnoremap * y :execute ":let @/=@\""<CR> :execute "set hlsearch"<CR>

" Настраиваем editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Настраиваем Airline
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='wombat'

" Настраиваем syntastic
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']

" Настраиваем GitGutter
let g:gitgutter_sign_column_always=1

" Настраиваем ctrlp
nnoremap <F5> :CtrlPMixed<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyo|pyc)$',
\ }

" Настройка темы
set background=dark
colorscheme wombat256dave

" Настраиваем netrw
let g:netrw_liststyle=3
let g:netrw_list_hide= '.*\.swp$,.*\.pyc$'

" Настраиваем yaml
autocmd FileType yaml,yml setlocal shiftwidth=2
autocmd FileType yaml,yml setlocal tabstop=2

" Настраиваем bufexplorer
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerDetailedHelp=0      " Do not show detailed help.
let g:bufExplorerShowDirectories=0   " Don't show directories.
let g:bufExplorerSortBy='number'     " Sort by the buffer's name.

" Настраиваем JS
autocmd FileType javascript,js setlocal expandtab
autocmd FileType javascript,js setlocal tabstop=4
autocmd FileType javascript,js setlocal shiftwidth=4

" Настраиваем Python
let python_highlight_all = 1
autocmd FileType python setlocal colorcolumn=100
autocmd FileType python setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python inoremap <Nul> <C-x><C-o> " Auto completion via ctrl-space (instead of the nasty ctrl-x ctrl-o)

" Настравиваем Jedi
let g:jedi#use_tabs_not_buffers=1

" Настраиваем Rust
let g:rustc_path=$HOME."/.cargo/bin/rustc"
let g:racer_cmd=$HOME."/.cargo/bin/racer"
let g:racer_experimantal_completer=1
au FileType rust nmap <leader>gg <Plug>(rust-def)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
"au FileType rust let g:syntastic_rust_checkers=['rustc']
au BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
au BufWrite *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . getcwd() . "&"

" Настраиваем GO
autocmd FileType go setlocal noexpandtab
autocmd FileType go setlocal tabstop=4
autocmd FileType go setlocal colorcolumn=120
autocmd FileType go setlocal foldmethod=syntax
autocmd FileType go setlocal foldnestmax=10
autocmd FileType go setlocal nofoldenable
autocmd FileType go setlocal foldlevel=0
autocmd FileType go nmap <leader>gi :GoImport
autocmd FileType go nmap <leader>gf :GoInfo<CR>
autocmd FileType go nmap <leader>gd :GoDoc<CR>
autocmd FileType go nmap <leader>gg :GoDef<CR>
autocmd FileType go nmap <leader>gr :GoRename
let g:go_list_type = "quickfix"

" Настраиваем Tagbar
nnoremap <silent> <F3> :TagbarToggle<CR>
let g:tagbar_autoclose=1
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

autocmd FileType c,cpp,python,ruby,java,javascript,typescript autocmd BufWritePre <buffer> :call TrimWhiteSpace()

