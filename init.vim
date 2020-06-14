filetype off

call plug#begin(stdpath('data') . '/plugged')

" Better motion
Plug 'justinmk/vim-sneak'

" Pimped status line
Plug 'itchyny/lightline.vim'

" Color scheme and highlighter
Plug 'chrisbra/Colorizer'
Plug 'tsiemens/vim-aftercolors'

" Highlight yanked text
Plug 'justinmk/vim-highlightedyank'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Utility
Plug 'tpope/vim-surround'
Plug 'bkad/CamelCaseMotion'
Plug 'tpope/vim-unimpaired'

" Fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Comment lines
Plug 'tpope/vim-commentary'

" Snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" C/CPP
Plug 'octol/vim-cpp-enhanced-highlight'

" Syntax
Plug 'dart-lang/dart-vim-plugin'
Plug 'udalov/kotlin-vim'
Plug 'leafgarland/typescript-vim'
Plug 'gburca/vim-logcat'
Plug 'pboettch/vim-cmake-syntax'

" Neovim bultin lsp
Plug 'neovim/nvim-lsp'
Plug 'haorenW1025/completion-nvim'
Plug 'haorenW1025/diagnostic-nvim'

" Format multiple file types
Plug 'sbdchd/neoformat'

" Theme
Plug 'morhetz/gruvbox'

call plug#end()

if (has("termguicolors"))
 set termguicolors
endif

set termguicolors
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
hi Search cterm=NONE ctermfg=red ctermbg=blue

set background=dark
syntax on
set backspace=2

let mapleader = ','

set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set hidden
set hlsearch

set ruler
set number
set wildmenu
set autoread
set backspace=indent,eol,start
set complete-=i
set smarttab
set smartcase
set incsearch
set scrolloff=1
set laststatus=2
set textwidth=100

set nocompatible               " be iMproved

" Undo
set undodir=~/.config/nvim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" Swaps
set backupdir=~/.config/nvim/swaps,$TMP
set directory=~/.config/nvim/swaps,$TMP

" Default statusline
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P

set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=100

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

nmap <C-K> :Buffers<CR>
nmap <C-A> :GFiles<CR>
nmap <C-P> :Files<CR>

" Tab completion. Taken from nvim-completion README.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

inoremap <silent><expr> <c-space> completion#trigger_completion()

" Enable mousewheel scrolling
set mouse=a

" Highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=#FF4060
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red
autocmd InsertEnter * match ExtraWhiteSpace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhiteSpace /\s\+$/

" Lightline
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'relativepath' ],
      \             [ ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ }
      \ }

" CPP
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2

" Makefiles should use tabulators
autocmd FileType make setlocal shiftwidth=4 tabstop=4 noexpandtab

" Map that hard to type key
nmap ö [
nmap ä ]
omap ö [
omap ä ]
xmap ö [
xmap ä ]

" Navigation
nmap . .`[
nmap j gj
nmap k gk
nmap <c-j> :tjump 
nmap <c-h> :call SwitchSourceHeader() <CR>
nmap <F4> :e ~/.config/nvim/init.vim <CR>
nmap <F12> :tjump <C-R><C-W> <CR>
nmap <F12> :tjump <C-R><C-W> <CR>

" Fzf.vim
nnoremap <silent> <leader>f :Files <CR>
nnoremap <silent> <leader>b :Buffers <CR>
nnoremap <silent> <leader>j :GFiles <CR>
nnoremap <silent> <leader>t :Tags <CR>

" Quickfix/location
nnoremap qo :copen<CR>
nnoremap qc :cclose<CR>
nnoremap Lo :lopen<CR>
nnoremap Lc :lclose<CR>

" Diagnostics
nnoremap qn :NextDiagnosticCycle<CR>
nnoremap qp :PrevDiagnosticCycle<CR>

" override default f instead of s
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" Format file
nnoremap <leader>cf :Neoformat<CR>
vnoremap <leader>cf :Neoformat<CR>

" Generate new ctags for project
nmap <F8> :!ctags -R --c++-kinds=+p --fields=+ilaS --extras=+q+f .<CR>
nmap <C-F8> :!ctags -R --language-force=java --extras=+f --exclude=*.class .<CR>

" Change between indentation settings
nmap <F9> :set tabstop=4<CR>:set shiftwidth=4<CR>:set expandtab<CR>:set cinoptions=<CR>
nmap <F10> :set tabstop=2<CR>:set shiftwidth=2<CR>:set expandtab<CR>:set cinoptions=<CR>

" Magically fold from search result
nnoremap \z :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>

"Added ! to overwrite on reload
function! SwitchSourceHeader()
    let extension = expand("%:e")
    if extension ==? "cpp" || extension ==? "c"
        let extension = ".h"
    else
        let extension = ".c"
    endif
    let file = expand("%:t:r").extension
    if bufexists(bufname(file))
        execute "buffer ".file
    else
        execute "tjump ".file
    endif
endfunction

" Gitgutter
set updatetime=100

" Camelcase
call camelcasemotion#CreateMotionMappings('<leader>')

" Ultisnips
" let g:UltiSnipsExpandTrigger="<c-g>"
let g:UltiSnipsListSnippets="<a-g>"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-y>"
let g:UltiSnipsJumpBackwardTrigger="<c-t>"

" Reset blinking mode when leaving
au VimLeave * set guicursor=a:block-blinkon1
au VimSuspend * set guicursor=a:block-blinkon1
au VimResume * set guicursor=a:block-blinkon0

" Floating FZF
let $FZF_DEFAULT_OPTS='--layout=reverse --margin=1,3'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" For nvim-completion
let g:completion_enable_auto_popup = 1
let g:completion_auto_change_source = 1
let g:completion_enable_snippet = 'UltiSnips'

" Neovim LSP Diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_show_sign = 1
let g:diagnostic_auto_popup_while_jump = 1
let g:diagnostic_insert_delay = 1
" let g:diagnostic_virtual_text_prefix = ' '

" autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

" Use neovim lsp ccls
lua << EOF

local nvim_lsp = require('nvim_lsp')

local on_attach = function(_, bufnr)
  require'completion'.on_attach()
  require'diagnostic'.on_attach()
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local configs = require 'nvim_lsp/configs'
local util = require 'nvim_lsp/util'

local default_ccls = "/home/greven/.config/nvim/default_config/ccls/.ccls";
configs.ccls = {
  default_config = {
    cmd = {"ccls"};
    filetypes = {"c", "cpp", "objc", "objcpp"};
    root_dir = util.root_pattern(".ccls", "compile_commands.json", "compile_flags.txt", ".git", default_ccls);
  };
}
nvim_lsp.ccls.setup {
    on_attach = on_attach,
}
nvim_lsp.pyls.setup { on_attach = on_attach }
nvim_lsp.texlab.setup { on_attach = on_attach }
nvim_lsp.jsonls.setup { on_attach = on_attach }
nvim_lsp.html.setup { on_attach = on_attach }
nvim_lsp.bashls.setup { on_attach = on_attach }

local tsbin = "typescript-language-server";
local ts_installer = util.npm_installer {
  server_name = "tsserver";
  packages = { tsbin };
  binaries = { tsbin };
}

local default_tsc = "/home/greven/.config/nvim/default_config/tsserver/tsconfig.json";
configs.tsserver = {
  default_config = {
    cmd = {ts_installer.info().binaries[tsbin], "--stdio"};
    filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"};
    root_dir = util.root_pattern("package.json", "tsconfig.json", ".git", default_tsc);
  };
  settings = {};
};
nvim_lsp.tsserver.setup { on_attach = on_attach }
nvim_lsp.vimls.setup { on_attach = on_attach }

EOF

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <a-d> <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <silent> gA    <cmd>lua vim.lsp.buf.codeaction()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gt    <cmd>lua vim.lsp.buf.symbols()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <a-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gF    <cmd>lua vim.lsp.buf.formatting()<CR>
