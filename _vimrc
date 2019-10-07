" ================================================================
" Author:huvipg
" Email: tjqm49@163.com
" Description: huvipg vimrc
" ================================================================

" �رռ���ģʽ, Ĭ�������, Vim ���Լ��� Vi ��ģʽ����, ����һ��Ҫ�ر�.
set nocompatible


" ================================================================
" �����ж�
" ================================================================
" �ж��� Windows ���� Linux.
let g:isWindows=0
let g:isLinux=0
if (has("win32") || has("win64"))
    let g:isWindows=1
else
    let g:isLinux=1
endif
" �ж����ն˻��� gVim
let g:isGUI=1
if has("gui_running")
    let g:isGUI=1
else
    let g:isGUI=0
endif


" ================================================================
" gVim ԭ������
" ================================================================
if (g:isWindows)
    " ����һЩĬ������
    source $VIMRUNTIME/vimrc_example.vim
    " ģ�� Windows ��ݼ�, ���� ctrl-s, ctrl-c, ctrl-v �ȵ�
    source $VIMRUNTIME/mswin.vim
    " ģ�� Windows ����Ϊ, ��һ�к���Ҫ, û�����еĻ�, ��󻯾���������.
    behave mswin
elseif (g:isLinux)
    if (g:isGUI)
        " Source a global configuration file if available
        if filereadable("/etc/vim/gvimrc.local")
            source /etc/vim/gvimrc.local
        endif
    else
        set mouse=a                    " ���κ�ģʽ���������
        set t_Co=256                   " ���ն�����256ɫ
        set backspace=2                " �����˸������
        " Source a global configuration file if available
        if filereadable("/etc/vim/vimrc.local")
            source /etc/vim/vimrc.local
        endif
    endif
endif


" ================================================================
" UI�ͻ�������
" ================================================================
" ��������
if (g:isWindows)
    set guifont=Consolas:h14
elseif (g:isLinux)
    set guifont=Consolas\ 14
endif

" GUI ������
if (g:isGUI)
    " �رղ˵�
    set guioptions-=m
    " �رչ�����
    set guioptions-=T
    " �ر���������
    set guioptions-=L
    " �ر��Ҳ������
    set guioptions-=r
    " ����ʱ���
    autocmd GUIEnter * simalt ~x
endif

" ֻ����Ҫ��ʱ������»��ƽ���(�����ִ�й����в���Ҫ�ػ����)
set lazyredraw
" ��������ʱ��Ҫ����, Ҳ��Ҫ��˸
set noerrorbells
set belloff=all

" �ָ��ʱ������ȵĿ�/��
set equalalways
" ��ֱsplitʱ,���ұ߿���
set splitright
" ˮƽsplitʱ,���±߿���
set splitbelow


" ================================================================
" ����
" ================================================================
set langmenu=zh_CN.UTF-8                 "���ò˵�����
source $VIMRUNTIME/delmenu.vim    "����ɾ���˵��ű���ɾ������Ĳ˵�
" ����vim�ڲ�����
set encoding=utf-8
" ���ñ༭�ļ�ʱ�ı���
set fileencoding=utf-8
" ���� Vim ��ʶ��ı���
set fileencodings=ucs-bom,utf-8,cp936,gb18030,gb2312,big5,cuc-jp,cuc-kr,latin,bgk
" �����ն�ģʽ(�� GUI ģʽ)�µı���
set termencoding=utf-8
" ��ֹ��������޷���ʾ
set ambiwidth=double
" ��� console �������
language messages zh_CN.utf-8


" ================================================================
" �ļ��������
"
" ���ڱ����ļ���˵��: �����ļ�, ��ʱ�ļ�, undo �ļ�, ��õ������ǰ�
" �������õ��������ļ�����, ��������ʱ������������, �Ժ���԰���Ҫ�޸�.
" ����:
" set directory=~/.vim/.swp//
" set backupdir=~/.vim/.backup//
" set undodir=~/.vim/.undo//
" ע�����Ҫ������//, ��ʾ�ļ���ʹ�þ���·��
" ================================================================
" �Զ�����ļ����ͺ�������ʽ, �������ļ����ͼ��ز��
filetype plugin indent on
" �ļ����ⲿ�Ķ���, �Զ�����
set autoread
" �����ɱ����ļ�
set nobackup
" ��������ʱ�ļ�
set noswapfile
" ������ undo �ļ�
set noundofile


" ================================================================
" �༭������
" ================================================================
" ��ʾ�к�
set number
" ��ʾ�﷨����
syntax enable
syntax on
set listchars=tab:>-,trail:^ ",eol:?
" ͻ����ʾ��ǰ��
set cursorline
" �����Զ�����
set autoindent
" ��������
set smartindent

" �༭ʱ��һ�� Tab ���൱������4���ո�
set tabstop=4
" ��ʽ��ʱ�����ߴ�Ϊ4���ո�
set shiftwidth=4
" �� Vim �������Ŀո���Ϊһ�� Tab, ɾ��ʱ����һ��ɾ��һ�� Tab �Ŀո�����
set softtabstop=4
" ���Ʊ��ת��Ϊ����ո�, ����ո������ο� tabstop �� shiftwidth
set expandtab
" ���кͶεĿ�ʼ��ʹ�� Tab
set smarttab

" �ϲ���������ʱ, �����м�ӿո�
set formatoptions+=B
" �ϲ���ʱ����Ӷ���ո�
set nojoinspaces


" ================================================================
" ������ƥ��
" ================================================================
" ������ʾƥ�������
set showmatch
" ������ʾ�������Ĺؼ���
set hlsearch
" ��ʱ����
set incsearch
" ���ܴ�Сд����, ֻҪ��һ����ĸ��д, �ʹ�Сд����, ��������
set ignorecase smartcase
" ����ϵͳ���а�*****
set clipboard=unnamed

" ================================================================
" ����ϰ�ߺͿ�ݼ�
" ================================================================

" ���ںܳ�����, vim���Զ�����, ��ʱ j ���� k �ͻ�һ�����ܶ���,
" ʹ�� gk,gj ���Ա�����������, ���ǲ�����, ������������ӳ��.
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj
" �� gb ��ת��ǰһ����ǩҳ, Ĭ�� gT, ������������
nnoremap gb gT

" �� <leader> ������Ϊ ';'
let mapleader=" "
" �� <leader>w �����ļ�
nnoremap <leader>w :w!<cr>
" �� <leader>q �����ļ�
nnoremap <leader>q :q!<cr>
" �� <leader>x �����ļ�
nnoremap <leader>x :x<cr>
"���ã��Զ���ȫ
inoremap ( ()<ESC>i
"����[�Զ���ȫ
inoremap [ []<ESC>i
"����{�Զ���ȫ
inoremap { {}<ESC>i
"����<�Զ���ȫ
inoremap < <><ESC>i
"����'�Զ���ȫ
inoremap ' ''<ESC>i
"����"�Զ���ȫ
inoremap " ""<ESC>i


" ӳ��ȫѡ+���� ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" ѡ��״̬�� Ctrl+c ����
vmap <C-c> "+y
" �� <leader>k �����ƶ�����
nnoremap <leader>k <c-u>
" �� <leader>j �����ƶ�����
nnoremap <leader>j <c-d>
" �� <leader>nv �༭ vimrc
if (g:isWindows)
    nnoremap <leader>v :tabe $vim/_vimrc<cr>
endif

