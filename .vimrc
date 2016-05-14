" General "{{{
set nocompatible               " be iMproved

scriptencoding utf-8           " utf-8 all the way
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,euc-kr,latin1

set history=256                " Number of things to remember in history.
" set timeoutlen=250             " Time to wait after ESC (default causes an annoying delay)
set clipboard+=unnamed         " Yanks go on clipboard instead.
set pastetoggle=<F10>          " toggle between paste and normal: for 'safer' pasting from keyboard
set shiftround                 " round indent to multiple of 'shiftwidth'
set tags=.git/tags;$HOME       " consider the repo tags first, then
                               " walk directory tree upto $HOME looking for tags
                               " note `;` sets the stop folder. :h file-search
set colorcolumn=80
set modeline
set modelines=5                " default numbers of lines to read for modeline instructions

set autowrite                  " Writes on make/shell commands
set autoread

set nobackup
set nowritebackup
set noswapfile                 "

set hidden                     " The current buffer can be put to the background without writing to disk

set hlsearch                   " highlight search
set ignorecase                 " be case insensitive when searching
set smartcase                  " be case sensitive when input has a capital letter
set incsearch                  " show matches while typing

let g:is_posix = 1             " vim's default is archaic bourne shell, bring it up to the 90s
let mapleader = ','
let maplocalleader = '	'      " Tab as a local leader
let g:netrw_banner = 0         " do not show Netrw help banner
" "}}}


" Formatting "{{{
set fo+=o                      " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r                      " Do not automatically insert a comment leader after an enter
set fo-=t                      " Do no auto-wrap text using textwidth (does not apply to comments)

set wrap                       " wrap lines
set whichwrap+=<,>h,l,[,]

set textwidth=0                " Don't wrap lines by default

set expandtab                  " 将tab键转化为空格
set tabstop=4                  " tab size eql 4 spaces
set softtabstop=4
set shiftwidth=4               " default shift width for indents
set smarttab                   

if has("autocmd")
	autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
	autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
endif

set backspace=indent
set backspace+=eol
set backspace+=start

set smartindent
set autoindent
set cindent
set indentkeys-=0#            " do not break indent on #
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do
set cinwords+=for,switch,case
" "}}}


" Visual "{{{
syntax on                      " enable syntax

" set synmaxcol=250              " limit syntax highlighting to 128 columns

"set cursorline                 " highlight current line
set mouse=a                   "enable mouse in GUI mode
set mousehide                 " Hide mouse after chars typed

set number                    " line numbers on
set showmatch                 " Show matching brackets.
set matchtime=2               " Bracket blinking.

set wildmode=longest,list     " At command line, complete longest common string, then list alternatives.

set completeopt+=preview

set novisualbell              " No blinking
set noerrorbells              " No noise.
"set vb t_vb=                  " disable any beeps or flashes on error

set laststatus=2              " always show status line.
"set shortmess=atI             " shortens messages
"set showcmd                   " display an incomplete command in statusline

"set statusline=%<%f\          " custom statusline
"set stl+=[%{&ff}]             " show fileformat
"set stl+=%y%m%r%=
"set stl+=%-14.(%l,%c%V%)\ %P
"set statusline=%f\ %h%m%r%w[%{strlen(&filetype)?&filetype:'none'},%{&encoding},%{&fileformat}]%=%-14.(%l,%c%V%)\ %<%p%%\ \ \ [%L]

set nofoldenable                 " Turn on folding
set foldmethod=manual
"set foldmethod=indent         " Fold on the marker
"set foldmethod=marker

set virtualedit=block

set splitbelow
set splitright


" set list chars color
hi NonText ctermfg=7 guifg=gray cterm=bold gui=bold
hi SpecialKey ctermfg=66 guifg=#649A9A

if has('gui_running')
  set guioptions=cMg " console dialogs, do not show menu and toolbar

  " Fonts
  " :set guifont=* " to launch a GUI dialog
  if has('mac')
  set guifont=Andale\ Mono:h13
  else
  set guifont=Terminus:h16
  end

  if has('mac')
  set noantialias
  " set fullscreen
  set fuoptions=maxvert,maxhorz ",background:#00AAaaaa
  endif
endif
" "}}}


" Scripts and Plugins " {{{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle

" plugins util
"===================== YouCompleteMe ========================
Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" 关掉补全时的预览窗口
set completeopt=longest,menu
" 回车即选中当前项
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 关闭ycm的syntastic
let g:ycm_show_diagnostics_ui = 0
"let g:ycm_key_detailed_diagnostics = '<leader>f'
" 两个字开始补全
let g:ycm_min_num_of_chars_for_completion = 2
" 注释也能使用补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 代码跳转
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>


"===================== vim-commentary ===========================
" -批量注释和去除注释
Plugin 'scrooloose/nerdcommenter'


"===================== vim-surround =======================
" -用于快速切换括号/引号或者标签
Plugin 'tpope/vim-surround'


"===================== delimitMate ========================
" -用于补全括号和引号
" 按shift-tab, 跳到补全的符号后面, 还是insert-mode
Plugin 'Raimondi/delimitMate'

" Vim Auto Indent with newline
let delimitMate_expand_cr=1  

" for python docstring, 特别有用
au FileType python let b:delimitMate_nesting_quotes = ['"']

" 关闭某些类型文件的自动补全
"au FileType mail let b:delimitMate_autoclose = 0

"===================== statusline =========================
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
let g:airline_left_sep='>'
let g:airline#extensions#tabline#enabled = 1   "开启tabline
let g:airline#extensions#tabline#buffer_nr_show = 1  "tab显示编号
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
" close buffer
nnoremap <leader>d :bd<CR>
" 映射<leader>num到num buffer
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

"===================== tree explorer =========================
Plugin 'scrooloose/nerdtree'
nnoremap <C-\> :NERDTreeToggle<CR>


"===================== 回退版本分支 ==========================
Plugin 'sjl/gundo.vim'
nnoremap <Leader>gu :GundoToggle<CR>


"===================== 文件搜索 ===========================
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<leader>t'

"===================== colorscheme =========================
Plugin 'altercation/vim-colors-solarized'
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_contrast="normal"


"===================== markdown mode ========================
Plugin 'tpope/vim-markdown'
"au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['c', 'cpp', 'java', 'python']

"==================== html css ==============================
Plugin 'mattn/emmet-vim'


"=================== vim-multiple-cursors =======================
Plugin 'terryma/vim-multiple-cursors'


"=================== tagbar ========================
Plugin 'majutsushi/tagbar'
let g:tagbar_ctags_bin='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
noremap <Leader>y :TagbarToggle<CR>


"=================== vim-easymotion ======================
Plugin 'Lokaltog/vim-easymotion'
" 更改快捷键
map f <Plug>(easymotion-prefix)
map ff <Plug>(easymotion-s)
map fs <Plug>(easymotion-f)
map fl <Plug>(easymotion-lineforward)
map fj <Plug>(easymotion-j)
map fk <Plug>(easymotion-k)
map fh <Plug>(easymotion-linebackward)
" 重复上一次操作, 类似repeat插件, 很强大
map f. <Plug>(easymotion-repeat)
" 忽略大小写
let g:EasyMotion_smartcase = 1


"==================== ultisnips engine ===============
Plugin 'SirVer/ultisnips'

" Snippets collect
Plugin 'honza/vim-snippets'

let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsSnippetsDir='~/.vim/bundle/vim-snippets/UltiSnips'
let g:UltiSnipsExpandTrigger='<C-l>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-h>'

"===================== DoxygenToolkit ====================
Plugin 'vim-scripts/DoxygenToolkit.vim'
let g:DoxygenToolkit_authorName="ethan <freematrix@163.com>"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
map <leader><leader>do :Dox<CR>
map <leader><leader>da :DoxAuthor<CR>
map <leader><leader>lic :DoxLic<CR>

filetype plugin indent on      " Automatically detect file types.

" " }}}


" my template " {{{
" autoload template
" 设置为0时禁用插件 (template_loader.vim) 
let g:template_load = 1
let g:template_tags_replacing = 1

" 设置模板文件存放的路径 
let g:template_path = "~/.vim/templates"

" 设置预定义Tag的值,如果这个Tag出现在模板中, 将会被替换为定义的值 
let g:T_AUTHOR = "_iMatrix" 
let g:T_AUTHOR_EMAIL = "freematrix@163.com" 
let g:T_AUTHOR_WEBSITE = "http://funhacks.net/" 

" 这个会被替换为当前时间
let g:T_DATE_FORMAT = "%Y-%m-%d %H:%M"
" " }}}


" my keymapping " {{{
" jump to the end in insert mode
inoremap <C-e> <C-o>A
" esc映射
inoremap jj <ESC>
" ctrl-o 映射
imap kk <C-o>
" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk
" 搜索完毕后按一下回车回到normal模式, 再按一下回车高亮就没了
nnoremap <CR> :nohlsearch<cr>
" " }}}

" my utils " {{{
" 记住上次打开的位置(remember position last change)
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" 改变行号的背景色
highlight LineNr cterm=NONE ctermfg=4

" " }}}



