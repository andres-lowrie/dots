" ========================================================================== "
" Base Config
" ========================================================================== "
" Trying out new vim built in packages
execute pathogen#infect()
filetype plugin indent on

" Trying out fish, not ready to go full bastard on it
set shell=/bin/bash

" Essentials
set nocompatible
set backspace=2
set incsearch
set ignorecase
setlocal spelllang=en_us
set number
syntax on
set t_Co=256
"autocmd BufWinLeave *.* mkview!
"autocmd BufWinEnter *.* silent loadview
set relativenumber
set splitbelow
set splitright
let mapleader = "\<Space>"
set re=1
set tabpagemax=100
"set cursorline

" debugging a freezing problem
set noswapfile
"set directory=/Volumes/RAMDisk

" Theme
set background=light
colorscheme solarized
if g:colors_name ==# "solarized"
  hi SignColumn guibg=NONE ctermbg=NONE
endif


" Indentation
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set nowrap
set formatoptions=croql
" set list listchars=tab:»-,trail:·,extends:»,precedes:«

" Make the Keypad work
map <Esc>Oq 1
map <Esc>Or 2
map <Esc>Os 3
map <Esc>Ot 4
map <Esc>Ou 5
map <Esc>Ov 6
map <Esc>Ow 7
map <Esc>Ox 8
map <Esc>Oy 9
map <Esc>Op 0
map <Esc>On .
map <Esc>OQ /
map <Esc>OR *
map <kPlus> +
map <Esc>OS -
map <Esc>OM <CR>
map! <Esc>Oq 1
map! <Esc>Or 2
map! <Esc>Os 3
map! <Esc>Ot 4
map! <Esc>Ou 5
map! <Esc>Ov 6
map! <Esc>Ow 7
map! <Esc>Ox 8
map! <Esc>Oy 9
map! <Esc>Op 0
map! <Esc>On .
map! <Esc>OQ /
map! <Esc>OR *
map! <kPlus> +
map! <Esc>OS -
map! <Esc>OM <CR>

" Clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "*Y
noremap <Leader>P "*P


" ========================================================================== "
" Freq Keys
" The other ones are handled by karabiner-elements and/or hammerspoon
" ========================================================================== "
map! <C-k> {
map! <C-j> (
map! <C-l> [
noremap , za

" ========================================================================== "
" Windows
" ========================================================================== "
" Splitting and focus
nnoremap <Leader>w- <C-w>s
nnoremap <Leader>w/ <C-w>v
nnoremap <Leader>ww <C-w>w
nnoremap <Leader>wh <C-w>h
nnoremap <Leader>wj <C-w>j
nnoremap <Leader>wk <C-w>k
nnoremap <Leader>wl <C-w>l
nnoremap <Leader>w= <C-w>=
" Moving
nnoremap <Leader>wL <C-w>L
nnoremap <Leader>wH <C-w>H
nnoremap <Leader>wJ <C-w>J
nnoremap <Leader>wK <C-w>K

" Close
nnoremap <Leader>wd :close<CR>

" Close Others
nnoremap <Leader>wo <C-w>o

" Save
nnoremap <Leader>fs :w<CR>

" Save All
nnoremap <Leader>fa :wa<CR>

" Open
nnoremap <Leader>ff :FZF<CR>

" ========================================================================== "
" Buffers
" ========================================================================== "
" Last Buffer
nnoremap <Leader><Tab> :e#<CR>

" List Buffers
nnoremap <Leader>bb :ls<CR>:b<Space>

" Delete Buffer
nnoremap <Leader>bd :bdelete<CR>

" ========================================================================== "
" Command Mode
" ========================================================================== "
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" ========================================================================== "
" Other stuff
" ========================================================================== "
" Clear highlight
nnoremap <Leader>sc :noh<CR>

" Show full path to file
nmap <BS> :echo expand("%:p")<CR>

" Copy path to clipboard
nnoremap <Leader><BS> :let @+=expand('%:p')<CR>

" Comment
nmap <Leader>cl <Plug>Commentary
xmap <Leader>cl <Plug>Commentary
omap <Leader>cl <Plug>Commentary
nmap <Leader>cll <Plug>CommentaryLine


" ========================================================================== "
" NETWR
" ========================================================================== "
nnoremap <Leader>fj :Explore<CR>
nnoremap <Leader>cd :lcd %:p:h<CR>

" ========================================================================== "
" Plugins
" ======================================================================== "

" FZF https://github.com/junegunn/fzf
set rtp+=/usr/local/opt/fzf
nnoremap <C-P> :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'
let g:fzf_colors =
      \{'fg':['fg','Normal'],
      \'bg': ['bg', 'Normal']}

" Tagbar https//github.com/majutsushi/tagbar
nmap <C-\> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Easymotion https://github.com/easymotion/vim-easymotion
" @TODO replace with hop https://github.com/phaazon/hop.nvim
map <Leader>jw <Plug>(easymotion-bd-f)
nmap <Leader>jw <Plug>(easymotion-overwin-f)

" Lightline https://github.com/itchyny/lightline.vim
set laststatus=2
set noshowmode
let g:lightline = {
      \'colorscheme': 'solarized',
      \'active': {
      \ 'left': [ ['mode', 'paste'],
      \           ['gitbranch', 'readonly', 'filename', 'modified' ] ]
      \},
      \'component_function': {
      \ 'gitbranch': 'fugitive#head',
      \ 'filename': 'LightlineFilename',
      \},
      \}

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'gitbranch_path'), ':h:h')
  let path = expand('%:p')
  if path[:len(root)-1]==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" " Emmet https://github.com/mattn/emmet-vim
" let g:user_emmet_install_global = 0
" autocmd FileType html,css,xml EmmetInstall

"" Slumlord https://github.com/scrooloose/vim-slumlord
"let g:slumlord_separate_win=1

" Maximizer https://github.com/szw/vim-maximizer
nnoremap <Leader>wm :MaximizerToggle<CR>

" ALE https://github.com/dense-analysis/ale
nnoremap <Leader>m= :ALEFix<CR>
let g:ale_sign_column_always = 1

" Vim Fugitive https://github.com/tpope/vim-fugitive
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gd :Gsdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Up> :cprev<CR>
nnoremap <Down> :cnext<CR>
nnoremap <Left> :cfirst<CR>
nnoremap <Right> :clast<CR>
nnoremap <Leader>gp :Git -c push.default=current push<CR>

" Anyfold https://github.com/pseewald/vim-anyfold
"autocmd FileType * AnyFoldActivate
"set foldlevel=99

" UltiSnips https://github.com/SirVer/ultisnips
let g:UltiSnipsSnippetDirectories = ['~/.vim/my-snippets']

" Semantic Highlight https://github.com/jaxbot/semantic-highlight.vim
noremap <Leader>s :SemanticHighlightToggle<cr>
let s:semanticGUIColors = [ '#72d572', '#c5e1a5', '#e6ee9c', '#fff59d', '#ffe082', '#ffcc80', '#ffab91', '#bcaaa4', '#b0bec5', '#ffa726', '#ff8a65', '#f9bdbb', '#f9bdbb', '#f8bbd0', '#e1bee7', '#d1c4e9', '#ffe0b2', '#c5cae9', '#d0d9ff', '#b3e5fc', '#b2ebf2', '#b2dfdb', '#a3e9a4', '#dcedc8' , '#f0f4c3', '#ffb74d' ]
let g:semanticTermColors = [28,1,2,3,4,5,6,7,25,9,10,34,12,13,14,15,16,125,124,19]

" CtrlSf https://github.com/dyng/ctrlsf.vim
nmap <Leader>/ <Plug>CtrlSFPrompt
vmap <Leader>/ <Plug>CtrlSFVwordPath
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_ackprg = 'rg'

" Table Mode https://github.com/dhruvasagar/vim-table-mode
let g:table_mode_corner='|'

" Dadbod UI
let g:db_ui_execute_on_save = 0
let g:db_ui_save_location = '~/Database/queries'
"source ~/Database/config/vimconfig

" Wilder
call wilder#setup({'modes': [':', '/', '?']})

" ========================================================================== "
" Language Stuff
" ========================================================================== "
" @TODO setup polyglot or ale?

" Go
let g:go_fmt_command = "goimports"

" Diffing
set diffopt+=vertical

" Terraform
au FileType terraform let g:terraform_align=1
au FileType terraform let g:terraform_fold_sections=1
au FileType terraform let g:terraform_remap_spacebar=1
au FileType terraform let g:terraform_commentstring='//%s'

" Yaml
au FileType yaml let g:autoformat_autoindent=0

" Markdown
au FileType markdown let g:autoformat_autoindent=0
"au FileType markdown setlocal spell spelllang=en_us
"au FileType markdown set complete+=kspell
let g:mkdp_auto_close = 0

" Bats
au BufNewFile,BufRead,BufReadPost *.bats set syntax=sh

" SQL
au BufNewFile,BufRead,BufReadPost *.hql set syntax=sql

" BNF
au BufNewFile,BufRead,BufReadPost *.bnf set syntax=bnf


" ========================================================================== "
" Toggles
" ========================================================================== "
nnoremap <Leader>tp :set paste! paste?<CR>
nnoremap <Leader>tw :set wrap! wrap?<CR>
nnoremap <Leader>tsb :set scrollbind! scrollbind?<CR>
nnoremap <Leader>tss :set spell! spell?<CR>
nnoremap <Leader>tz :Goyo<CR>

" ========================================================================== "
" Key bindings
" ========================================================================== "
nmap t :tabnew

" ========================================================================== "
" Debugging
" ========================================================================== "
nmap <Leader>sI :call <SID>SynStack()<CR>

" ========================================================================== "
" Macros
" ========================================================================== "

" delete all the stuff after a word. Useful for creating columns of text:
"   for example:
"     foo fadf adf adfdfaf      
"     bar        
"
"   you can select all of it and do `:normal @e` and you'll get
"     foo
"     bar
let @e='elDj^'


" Debugging syntax
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

map <F12> :filetype detect<CR>
