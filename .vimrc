"===================插件管理====================== {{{

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'taglist.vim'
Plugin 'majutsushi/tagbar'
Plugin 'The-NERD-tree'
Plugin 'indentLine.vim'
Plugin 'delimitMate.vim'
"Plugin 'wincent/command-t'
"Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'kien/ctrlp.vim'
Plugin 'spin6lock/vim_sproto'
"Plugin 'jeaye/color_coded'
Plugin 'rdnetto/YCM-Generator'
Plugin 'morhetz/gruvbox'
"Plugin 'altercation/vim-colors-solarized'

"Plugin 'Valloric/YouCompleteMe'
Plugin 'davits/YouCompleteMe'
"Plugin 'davits/dyevim'
Plugin 'jimlmq/dyevim', {'name': 'mydyevim'}
"Plugin 'Valloric/ListToggle'

Plugin 'vim-scripts/a.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"}}}

"===================通用配置====================== {{{

"文件搜索路径  
set path=.,/usr/include,,

" 控制
set nocompatible " 关闭 vi 兼容模式
set fileencodings=utf-8,gbk "使用utf-8或gbk编码方式
set t_Co=256
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
syntax on " 自动语法高亮
set background=dark
colorscheme gruvbox "设定配色方案
"colorscheme solarized
set number " 显示行号
set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4 " 设定 tab 长度为 4
"set nobackup " 覆盖文件时不备份
set autochdir " 自动切换当前目录为当前文件所在的目录
set autoread "文件修改时，自动重读
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan " 禁止在搜索到文件两端时重新搜索
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
" set showmatch " 插入括号时，短暂地跳转到匹配的对应括号
" set matchtime=2 " 短暂跳转到匹配括号的时间
"set magic " 设置魔术
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单栏
"set smartindent " 开启新行时使用智能自动缩进
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1 " 设定命令行的行数为 1
set showcmd
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
" 设置在状态行显示的信息
"set foldenable " 开始折叠
"set foldmethod=syntax " 设置语法折叠
"set foldcolumn=0 " 设置折叠区域的宽度
"setlocal foldlevel=1 " 设置折叠层数为
" set foldclose=all " 设置为自动关闭折叠 
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" 用空格键来开关折叠

augroup jimlong
	autocmd!
augroup END


" return OS type, eg: windows, or linux, mac, et.st..
function! MySys()
	if has("win16") || has("win32") || has("win64") || has("win95")
		return "windows"
	elseif has("unix")
		return "linux"
	endif
endfunction

" 用户目录变量$VIMFILES
if MySys() == "windows"
	let $VIMFILES = $VIM.'/vimfiles'
elseif MySys() == "linux"
	let $VIMFILES = $HOME.'/.vim'
endif

" 设定doc文档目录
let helptags=$VIMFILES.'/doc'

" 设置字体 以及中文支持
if has("win32")
	set guifont=Inconsolata:h12:cANSI
endif

" 配置多语言环境
if has("multi_byte")
	" UTF-8 编码
	set encoding=utf-8
	set termencoding=utf-8
	set formatoptions+=mM
	set fencs=utf-8,gbk

	if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
		set ambiwidth=double
	endif

	if has("win32")
		source $VIMRUNTIME/delmenu.vim
		source $VIMRUNTIME/menu.vim
		language messages zh_CN.utf-8
	endif
else
	echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

function! SaveMySession()
	"NERDTree doesn't support session, so close before saving
	execute ':NERDTreeClose'
	execute 'set sessionoptions-=curdir'
	execute 'set sessionoptions+=sesdir'
	"echom exists('g:session_loaded')
	if exists('g:session_loaded') && g:session_loaded 
		execute "mksession! " . v:this_session
	endif
endfunction

function! RestoreMySession()
	if filereadable("xgame.vim")
		execute 'so xgame.vim'
		let g:session_loaded = 1
	endif
endfunction

"autocmd VimLeave * call SaveMySession()
"autocmd VimEnter * call RestoreMySession()
"}}}

"===================按键映射======================  {{{

"按键映射的起始字符  
let mapleader = ',' 

"Fast reloading of the .vimrc
noremap <silent> <leader>sv :source ~/.vimrc<cr>
"Fast editing of .vimrc
noremap <silent> <leader>ev :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
augroup jimlong
	autocmd! bufwritepost .vimrc source ~/.vimrc
augroup END

"使用Ctrl-l 和 Ctrl+h 切换标签页  
nnoremap <C-S-n> gt              
nnoremap <C-S-m> gT  

"在行末加上分号  
"nnoremap <silent> <Leader>; :<Esc><End>a<Space>;<Esc><Down>  
"保存  
"nnoremap <C-s> :w<CR>  
"替换  
"nnoremap <C-h> :%s/<C-R>=expand("<cword>")<CR>/<C-R>=expand("<cword>")<CR> "

" Buffers操作快捷方式!
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>

" Tab操作快捷方式!
nnoremap <C-TAB> :tabnext<CR>
nnoremap <C-S-TAB> :tabprev<CR>

"关于tab的快捷键
" map tn :tabnext<cr>
" map tp :tabprevious<cr>
" map td :tabnew .<cr>
" map te :tabedit
" map tc :tabclose<cr>

"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
"时候会变得非常方便.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"插入模式下移动光标
"inoremap <C-S-h> <Left>
"inoremap <C-S-j> <Down>
"inoremap <C-S-k> <Up>
"inoremap <C-S-l> <Right>

" 选中状态下 Ctrl+c 复制
vnoremap <C-c> "+y
""}}}

"===================插件配置======================

" -------------gruvbox----------------{{{
"let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_italic = 1
"let g:gruvbox_italicize_strings = 1
"let g:gruvbox_invert_signs=1
"let g:gruvbox_invert_tabline =1
"}}}

" -------------ycm----------------{{{
" 自动补全配置
set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
augroup jimlong
	autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
augroup END
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>" "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"

let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
" force recomile with syntastic
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	
"nnoremap <leader>lo :lopen<CR>	"open locationlist
"nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o> 
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'

"let g:ycm_goto_buffer_command = '' "'new-or-existing-tab'
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <F4> :YcmDiags<CR>
"}}}

"--------------cscope-------------{{{
set cscopequickfix=s-,c-,d-,i-,t-,e-
if has("cscope")
	set csto=1
	set cst " use the :cstag behavior
	set csre " use the relative location
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out 
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif

nnoremap <silent><Leader>bc :!./cscope.sh<CR>

nnoremap <leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>sg :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>sc :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>st :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>se :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>sf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <leader>si :cs find i <C-R>=expand("<cfile>")<CR><CR>
nnoremap <leader>sd :cs find d <C-R>=expand("<cword>")<CR><CR>
"}}}

"-----------------ctags-------------{{{
let &tags .= ',' . expand("%:p:h") . '/tags'
"}}}

"----------------airline-------------{{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#ycm#enabled = 1
"let g:airline#extensions#ycm#error_symbol = 'E:'
"let g:airline#extensions#ycm#warning_symbol = 'W:'
"}}}

"---------------TList---------------{{{
noremap <F3> :TlistToggle<CR>
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_WinWidt=25
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"}}}

"---------------tagbar---------------{{{
noremap <F6> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/bin/ctags'
"}}}

"--------------NERDTree------------{{{
noremap <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=25
" 当不带参数打开Vim时自动加载项目树
augroup jimlong
	autocmd StdinReadPre * let s:std_in=1
	"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	" 当所有文件关闭时关闭项目树窗格
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END
" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', '\.d$', '\.o$',  'node_modules'] "ignore files in NERDTree
"}}}

"-------------Powerline-----------{{{
"set fillchars+=stl:\ ,stlnc:\  
"let g:Powerline_symbols = 'compatible'  
"let g:Powerline_stl_path_style = 'filename'  "只显示文件名 
"}}}

"------------vim-cpp-enhanced-highlight--------------{{{
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
"}}}

"------------ctrlp--------------{{{
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.d,*.a,*.meta,*.apk
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_buftag_ctags_bin = '/usr/bin/ctags'
"}}}

"------------solarized--------------{{{
let g:solarized_termcolors=256
"}}}

"------------dyevim--------------{{{
let g:dyevim_timeout=20
"}}}

