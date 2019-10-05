" ================================================================
" Author:huvipg
" Email: tjqm49@163.com
" Description: huvipg vimrc
" ================================================================

" 关闭兼容模式, 默认情况下, Vim 会以兼容 Vi 的模式运行, 所以一定要关闭.
set nocompatible


" ================================================================
" 环境判断
" ================================================================
" 判断是 Windows 还是 Linux.
let g:isWindows=0
let g:isLinux=0
if (has("win32") || has("win64"))
    let g:isWindows=1
else
    let g:isLinux=1
endif
" 判断是终端还是 gVim
let g:isGUI=1
if has("gui_running")
    let g:isGUI=1
else
    let g:isGUI=0
endif


" ================================================================
" gVim 原有配置
" ================================================================
if (g:isWindows)
    " 加载一些默认配置
    source $VIMRUNTIME/vimrc_example.vim
    " 模仿 Windows 快捷键, 例如 ctrl-s, ctrl-c, ctrl-v 等等
    source $VIMRUNTIME/mswin.vim
    " 模仿 Windows 的行为, 这一行很重要, 没有这行的话, 最大化经常出问题.
    behave mswin
elseif (g:isLinux)
    if (g:isGUI)
        " Source a global configuration file if available
        if filereadable("/etc/vim/gvimrc.local")
            source /etc/vim/gvimrc.local
        endif
    else
        set mouse=a                    " 在任何模式下启用鼠标
        set t_Co=256                   " 在终端启用256色
        set backspace=2                " 设置退格键可用
        " Source a global configuration file if available
        if filereadable("/etc/vim/vimrc.local")
            source /etc/vim/vimrc.local
        endif
    endif
endif


" ================================================================
" UI和基本配置
" ================================================================
" 设置字体
if (g:isWindows)
    set guifont=Consolas:h14
elseif (g:isLinux)
    set guifont=Consolas\ 14
endif

" GUI 的设置
if (g:isGUI)
    " 关闭菜单
    set guioptions-=m
    " 关闭工具栏
    set guioptions-=T
    " 关闭左侧滚动条
    set guioptions-=L
    " 关闭右侧滚动条
    set guioptions-=r
    " 启动时最大化
    autocmd GUIEnter * simalt ~x
endif

" 只在需要的时候才重新绘制界面(例如宏执行过程中不需要重绘界面)
set lazyredraw
" 发生错误时不要响铃, 也不要闪烁
set noerrorbells
set belloff=all

" 分割窗口时保持相等的宽/高
set equalalways
" 竖直split时,在右边开启
set splitright
" 水平split时,在下边开启
set splitbelow


" ================================================================
" 编码
" ================================================================
set langmenu=zh_CN.UTF-8                 "设置菜单语言
source $VIMRUNTIME/delmenu.vim    "导入删除菜单脚本，删除乱码的菜单
" 设置vim内部编码
set encoding=utf-8
" 设置编辑文件时的编码
set fileencoding=utf-8
" 设置 Vim 能识别的编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,gb2312,big5,cuc-jp,cuc-kr,latin,bgk
" 设置终端模式(非 GUI 模式)下的编码
set termencoding=utf-8
" 防止特殊符号无法显示
set ambiwidth=double
" 解决 console 输出乱码
language messages zh_CN.utf-8


" ================================================================
" 文件相关配置
"
" 关于备份文件的说明: 备份文件, 临时文件, undo 文件, 最好的做法是把
" 他们配置到单独的文件夹里, 我这里暂时都不让生成了, 以后可以按需要修改.
" 例如:
" set directory=~/.vim/.swp//
" set backupdir=~/.vim/.backup//
" set undodir=~/.vim/.undo//
" 注意最后要有两道//, 表示文件名使用绝对路径
" ================================================================
" 自动检测文件类型和缩进格式, 并根据文件类型加载插件
filetype plugin indent on
" 文件被外部改动后, 自动加载
set autoread
" 不生成备份文件
set nobackup
" 不生成临时文件
set noswapfile
" 不生成 undo 文件
set noundofile


" ================================================================
" 编辑器配置
" ================================================================
" 显示行号
set number
" 显示语法高亮
syntax enable
syntax on
" 显示 tab(>---), 空格(^), 换行(?)
set list
set listchars=tab:>-,trail:^ ",eol:?
" 突出显示当前行
set cursorline
" 开启自动缩进
set autoindent
" 智能缩进
set smartindent

" 编辑时按一个 Tab 键相当于输入4个空格
set tabstop=4
" 格式化时缩进尺寸为4个空格
set shiftwidth=4
" 让 Vim 把连续的空格视为一个 Tab, 删除时可以一次删掉一个 Tab 的空格数量
set softtabstop=4
" 把制表符转换为多个空格, 具体空格数量参考 tabstop 和 shiftwidth
set expandtab
" 在行和段的开始出使用 Tab
set smarttab

" 合并两行中文时, 不在中间加空格
set formatoptions+=B
" 合并行时不添加多余空格
set nojoinspaces


" ================================================================
" 搜索和匹配
" ================================================================
" 高亮显示匹配的括号
set showmatch
" 高亮显示搜索到的关键字
set hlsearch
" 即时搜索
set incsearch
" 智能大小写敏感, 只要有一个字母大写, 就大小写敏感, 否则不敏感
set ignorecase smartcase
" 共享系统剪切板*****
set clipboard=unnamed

" ================================================================
" 操作习惯和快捷键
" ================================================================

" 对于很长的行, vim会自动换行, 此时 j 或者 k 就会一下跳很多行,
" 使用 gk,gj 可以避免跳过多行, 但是不方便, 所以做了如下映射.
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj
" 按 gb 跳转到前一个标签页, 默认 gT, 按起来不方便
nnoremap gb gT

" 将 <leader> 键配置为 ';'
let mapleader=" "
" 按 <leader>w 保存文件
nnoremap <leader>w :w!<cr>
" 按 <leader>q 保存文件
nnoremap <leader>q :q!<cr>
" 按 <leader>x 保存文件
nnoremap <leader>x :x<cr>
"设置（自动补全
inoremap ( ()<ESC>i
"设置[自动补全
inoremap [ []<ESC>i
"设置{自动补全
inoremap { {}<ESC>i
"设置<自动补全
inoremap < <><ESC>i
"设置'自动补全
inoremap ' ''<ESC>i
"设置"自动补全
inoremap " ""<ESC>i


" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
" 按 <leader>k 向上移动半屏
nnoremap <leader>k <c-u>
" 按 <leader>j 向下移动半屏
nnoremap <leader>j <c-d>
" 按 <leader>nv 编辑 vimrc
if (g:isWindows)
    nnoremap <leader>v :tabe $vim/_vimrc<cr>
endif

