set nocompatible
filetype off

call pathogen#helptags()
call pathogen#infect()

filetype plugin indent on
syntax enable

" Основные настройки
set t_Co=256
set autoindent
set autoread " Reload files changed outside automatically
set backspace=indent,eol,start
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

" higlight but not jump
nnoremap * *N

" Подсвечивает по звёздочке выделенный блок во всём файле
vnoremap * y :execute ":let @/=@\""<CR> :execute "set hlsearch"<CR>

" Настройка цвета ограничительной линии
hi ColorColumn ctermbg=235 guibg=235

" Настраиваем syntastic
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']

" Настройка solirized темы
set background=dark
colorscheme solarized

" Настраиваем netrw
let g:netrw_liststyle=3
let g:netrw_list_hide= '.*\.swp$,.*\.pyc$,^\..*'

" Настраиваем yaml
autocmd FileType yaml,yml set shiftwidth=2
autocmd FileType yaml,yml set tabstop=2

" Настраиваем bufexplorer
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerDetailedHelp=0      " Do not show detailed help.
let g:bufExplorerShowDirectories=0   " Don't show directories.
let g:bufExplorerSortBy='number'     " Sort by the buffer's name.

" Настраиваем Python
let python_highlight_all = 1
autocmd FileType python set colorcolumn=80
autocmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python inoremap <Nul> <C-x><C-o> " Auto completion via ctrl-space (instead of the nasty ctrl-x ctrl-o)
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" Настраиваем GO
autocmd FileType go set noexpandtab
autocmd FileType go set tabstop=4
autocmd FileType go set colorcolumn=120
autocmd FileType go set foldmethod=syntax
autocmd FileType go set foldnestmax=10
autocmd FileType go set nofoldenable
autocmd FileType go set foldlevel=0
autocmd FileType go nmap <leader>gi :GoImport
autocmd FileType go nmap <leader>gf :GoInfo<CR>
autocmd FileType go nmap <leader>gd :GoDoc<CR>
autocmd FileType go nmap <leader>gg :GoDef<CR>
autocmd FileType go nmap <leader>gr :GoRename
let g:go_list_type = "quickfix"

" Настраиваем Tagbar
nnoremap <leader>tb :TagbarToggle<CR>
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
