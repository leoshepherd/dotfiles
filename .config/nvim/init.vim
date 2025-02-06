lua require('init')
"enable treesitter syntax highlighting on vim startup
autocmd VimEnter * TSEnable highlight 
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set smartcase
set hlsearch                " highlight search 
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
set splitright
filetype plugin indent on   "allow auto-indenting depending on file type
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
"set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
 set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

call plug#begin()
 Plug 'dracula/vim', { 'as': 'dracula' }
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
call plug#end()
"let g:dracula_colorterm = 0
"colorscheme catppuccin-macchiato " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
colorscheme catppuccin-mocha
"autocmd VimEnter * if argc() == 0 && v:this_session == '' | :CocCommand explorer . | endif

"Transparent background
hi Normal guibg=none ctermbg=none
hi NormalNC guibg=none ctermbg=none
hi NormalSB guibg=none ctermbg=none

function! GitModified()
    cexpr system("git status --porcelain | awk 'match($1, \"M\"){print $2\":1:    *\"}'")
    copen
endfunction

function! GradleFailures()
    let out = system("gradle clean build 2>&1 | grep .java")
    let split = split(out, '\n')
    let locations = []
    for string in split
        let exception = split(string, ' ')[0]
        let lineNumber = split(string, ':')[1]
        let file = split(split(string, ' ')[2], ':')[0]
        let fullPath = substitute(system('find . -type f -name "' . file . '"'), '\n', '', ''))
        call(add(locations, fullPath . ':' . lineNumber . ':    ' . exception))
    endfor
    cexpr
    copen
endfunction

function! OpenFloatingWindow(width, height, buf, title)
    let ui = nvim_list_uis()[0]

    let options = {
        \ 'relative': 'editor',
        \ 'height': a:height,
        \ 'width': a:width,
        \ 'col': (ui.width/2) - (a:width/2),
        \ 'row': (ui.height/2) - (a:height/2),
        \ 'anchor': 'NW',
        \ 'border': 'double',
        \ 'title': a:title,
        \ 'style': 'minimal'
        \}
    return nvim_open_win(a:buf, 1, options)
endfunction

function! OpenTerminalWindow()
    call OpenFloatingWindow(140, 40, nvim_create_buf(v:false, v:true), 'TERMINAL')
    terminal
    startinsert
endfunction

"open Coc file explorer
nmap <space>e : CocCommand explorer<CR>
"show git blame
nmap <space>b : CocCommand git.showBlameDoc<CR>
"open quickfix
nmap <space>o : copen<CR>
"close quickfix
nmap <space>c : cclose<CR>
"clear quickfix
nmap <space>d : cexpr []<CR>
"disable highlight
nmap <space>h : noh<CR>
nmap <space>m : call GitModified()<CR>
nmap <space>f : call GradleFailures()<CR>
nmap <space>t : call OpenTerminalWindow()<CR>

nmap <space>r <Plug>(coc-references)

nmap <space>x <Cmd>CocCommand java.action.showTypeHierarchy<CR>
