set background=dark
syntax on
set backspace=2

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

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

Plugin 'Quramy/tsuquyomi'
" Plugin 'Shougo/vimproc.vim'
Plugin 'digitaltoad/vim-pug'
" Plugin 'leafgarland/typescript-vim'
Plugin 'maksimr/vim-jsbeautify'
" Plugin 'othree/html5.vim'
" Plugin 'pboettch/vim-cmake-syntax'
Plugin 'rhysd/vim-clang-format'
" Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'wikitopian/hardmode'
" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Plugin 'christoomey/vim-system-copy'
Plugin 'udalov/kotlin-vim'
Plugin 'majutsushi/tagbar'
Plugin 'tell-k/vim-autopep8'

" TEST
Plugin 'airblade/vim-gitgutter'
" Plugin 'hsanson/vim-android'
" Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'bkad/CamelCaseMotion'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'

Plugin 'justinmk/vim-highlightedyank'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'

" Plugin 'terryma/vim-multiple-cursors'
Plugin 'HerringtonDarkholme/yats.vim'

Plugin 'neoclide/coc.nvim'
Plugin 'morhetz/gruvbox'
Plugin 'octol/vim-cpp-enhanced-highlight'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required 
" To ignore plugin indent changes, instead use:
filetype plugin on

set termguicolors
let g:gruvbox_contrast_dark = 'hard'
"
colorscheme gruvbox
hi Search cterm=NONE ctermfg=red ctermbg=blue

let mapleader = ","

"" Coc
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
" set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c

inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>gs :CocList symbols<CR>

map <a-o> :CocCommand explorer <CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

autocmd FileType python noremap <buffer> <Leader>ex :CocCommand python.execInTerminal<cr>

autocmd FileType python vnoremap <buffer> <Leader>ex :CocCommand python.execSelectionInTerminal<cr>

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

command! -nargs=0 Prettier :CocCommand prettier.formatFile
noremap <Leader>ff :Prettier<cr>

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" press <esc> to cancel.
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap ; <Plug>(coc-smartf-repeat)
nmap , <Plug>(coc-smartf-repeat-opposite)

nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"

augroup Smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#FFFFFF
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guibg=#F92672
  "autocmd User SmartfEnter :hi Conceal ErrorMsg
  "autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end
" augroup Smartf
"   autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
"   autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
" augroup end

map  <F4> :%s/\s\+$//e<CR>
nmap <F5> :buffers<CR>:buffer<Space>

map <F7> :!ctags -R --language-force=java --extra=+f --exclude=*.class --sort=yes .<CR>
map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q+f --sort=yes .<CR>
map <F12> <C-]>

map <S-Tab> :tjump 

nmap <C-h> [m
nmap <C-j> ]m

map <a-ö> ^
map <a-ä> $

" provide hjkl movements in Insert mode via the <Alt> modifier key
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

nmap <C-K> :Buffers<CR>
nmap <C-A> :GFiles<CR>
nmap <C-P> :Files<CR>

" Undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" set backspace=2
" set scrolloff=4
set backupdir=~/.swapfiles,$TMP
set directory=~/.swapfiles,$TMP

" Makes dot keep the cursor where you triggered it
nmap . .`[

" Enable mousewheel scrolling
set mouse=a

" nmap OO O<Esc>
" nmap oo o<Esc>
nmap <leader>cc :cclose<CR>
nmap <leader>co :copen<CR>
nmap <leader>lb :BLines 
nmap <leader>ll :Lines 

runtime macros/matchit.vim

" Makes vim-ariline fly!
set laststatus=2

" let g:airline_theme='base16_eighties'
let g:airline_theme='random'
let g:airline#extensions#tabline#enabled = 1

" clang-format
let g:clang_format#style_options = {"Standard" : "C++11"}
let g:clang_format#command = "clang-format-6.0"
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

autocmd FileType typescript nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType typescript vnoremap <buffer><Leader>cf :ClangFormat<CR>

nmap <Leader>C :ClangFormatAutoToggle<CR>

autocmd FileType javascript set shiftwidth=4

" JS Beauuutify
autocmd FileType javascript noremap <buffer> <Leader>cf :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <Leader>cf :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <Leader>cf :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <Leader>cf :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <Leader>cf :call CSSBeautify()<cr>

autocmd FileType python noremap <buffer> <Leader>cf :call Autopep8()<cr>
"
" For gitgutter
set updatetime=100

nmap <F6> :TagbarToggle<CR>
let g:tagbar_width = 40
" javacomplete2
" autocmd FileType java setlocal omnifunc=javacomplete#Complete
" nmap <F7> <Plug>(JavaComplete-Imports-Add)
" imap <F7> <Plug>(JavaComplete-Imports-Add)

call camelcasemotion#CreateMotionMappings('<leader>')

let g:UltiSnipsExpandTrigger="<c-g>"
let g:UltiSnipsListSnippets="<a-g>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" Customize autopep8
let g:autopep8_disable_show_diff=1
let g:autopep8_ignore="E226,E24,W6,E402"

set foldmethod=manual
set nofoldenable

" let javaScript_fold=1         " JavaScript
let g:polyglot_disabled = ['pug']

" For vim-unimpaired
nmap ö [
nmap ä ]
inoremap <C-CR> <Esc>
" inoremap jh <ESC>
" imap ö [
" imap ä ]
omap ö [
omap ä ]
xmap ö [
xmap ä ]

" Handle resetting cursor blinking
au VimLeave * set guicursor=a:block-blinkon1
au VimSuspend * set guicursor=a:block-blinkon1
au VimResume * set guicursor=a:block-blinkon0

noremap <expr> <leader>fg ':Ggrep '.expand('<cword>').'<cr>'

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> [h <Plug>(coc-diagnostic-prev-error)
nmap <silent> ]h <Plug>(coc-diagnostic-next-error)

" Reset blinking mode when leaving
if has('nvim')
    let $FZF_DEFAULT_OPTS='--layout=reverse --margin=1,3'
    let g:fzf_layout = { 'window': 'call FloatingFZF()' }
    function! FloatingFZF()
        let buf = nvim_create_buf(v:false, v:true)
        call setbufvar(buf, '&signcolumn', 'no')
        let height = float2nr(40)
        let width = float2nr(140)
        let horizontal = float2nr((&columns - width) / 2)
        let vertical = 1

        let opts = {
                    \ 'relative': 'editor',
                    \ 'row': vertical,
                    \ 'col': horizontal,
                    \ 'width': width,
                    \ 'height': height,
                    \ 'style': 'minimal'
                    \ }
        call nvim_open_win(buf, v:true, opts)
    endfunction
endif
