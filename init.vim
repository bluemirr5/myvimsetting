call plug#begin()

Plug 'tpope/vim-sensible'

" code
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'preservim/nerdcommenter'

" nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim'

" statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" vim theme
Plug 'morhetz/gruvbox'

" python
Plug 'nvie/vim-flake8'

" vuejs
Plug 'leafOfTree/vim-vue-plugin'

" html
Plug 'alvan/vim-closetag'

call plug#end()

" Ignore CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png,*.gif
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_custom_ignore = {
  \ 'file': '\v\.(pyc|so|dll)$',
  \ }

set nu
set ma

" buffer 이동 단축키
nnoremap <C-l> :enew<CR>
nnoremap <C-k> :bnext!<CR>
nnoremap <C-j> :bprevious!<CR>
nnoremap <C-h> :bp <BAR> bd #<CR>

" code folding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2
set wildignore+=*/node_modules/*
nnoremap gr :grep <cword> *<CR>
nnoremap Gr :grep <cword> %:p:h/*<CR>
nnoremap gR :grep '\b<cword>\b' *<CR>
nnoremap GR :grep '\b<cword>\b' %:p:h/*<CR>
nnoremap vgr :vimgrep <cword> **/*<CR>
nnoremap ygr :vimgrep /<C-R>"/ **/*<CR>

" set theme
set termguicolors
colorscheme gruvbox

nmap nerd :NERDTreeToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1

" vim-airline buffer를 상단에 보여주기 위함
let g:airline#extensions#tabline#enabled = 1              " vim-airline 버퍼 목록 켜기
let g:airline#extensions#tabline#fnamemod = ':t'          " vim-airline 버퍼 목록 파일명만 출력

" python flake8 설정
let g:flake8_show_in_file=1   " show
let g:flake8_max_markers=500  " maximum # of markers to show(500 is default)
autocmd FileType python nmap <buffer> <F3> :! python %<CR>
autocmd FileType python nmap <buffer> <F2> :call Flake8()<CR>

" vuejs
let g:vim_vue_plugin_use_sass=1
autocmd FileType *.vue setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

" html
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'
let g:closetag_filetypes = 'html,xhtml,phtml,vue'
let g:closetag_shortcut = '>'
autocmd FileType html setlocal ts=2 sts=2 sw=2

" ultisnips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/snips']

set cindent

autocmd VimEnter * NERDTree
