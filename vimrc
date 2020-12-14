"打开语法高亮
syntax on
"设置背景色，每种配色有两种方案，一个light、一个dark
"设置配色，这里选择的是desert，也有其他方案，在vim中输入:color 在敲tab键可以查看
set background=dark
colorscheme desert 

"用空格键替换制表符
set expandtab
""制表符占2个空格
set tabstop=2
"设定 << 和 >> 命令移动时的宽度为2
set shiftwidth=2
"" 使得按退格键时可以一次删掉 2 个空格
set softtabstop=2
"高亮搜索
set hlsearch
" 突出显示当前行
set cursorline
"在输入要搜索的文字时，vim会实时匹配
set incsearch
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 相对行号
" set relativenumber
" 高亮显示当前行/列
set cursorline
" 高亮显示搜索结果
set hlsearch
" 自适应不同语言的智能缩进
filetype indent on
" 在命令行显示当前输入的命令
set showcmd
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 文件类型检测
filetype plugin indent on 

autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4
if &diff
  colorscheme evening
endif
