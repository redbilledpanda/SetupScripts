"source $HOME/cscope_maps.vim
set nobackup
"set background=dark 
"colorscheme peachpuff
"set cursorline
"set cursorcolumn
hi CursorLine cterm=NONE ctermbg=grey ctermfg=black guibg=grey guifg=black
hi CursorColumn cterm=NONE ctermbg=grey ctermfg=black guibg=grey guifg=black

"set lines=27
"set columns=100

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set nu

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file
endif
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set rulerformat=%l,%c%V%=%P
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set ignorecase          " ignore case while searching
set splitright
"set number              " display line numbers

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" In an xterm the mouse should work quite well, thus enable it.
" set mouse=a

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent                " always set autoindenting on

endif " has("autocmd")

set cindent shiftwidth=3

" Symbol Find all references to the token under cursor
nmap <F2> <ESC>:vert scs find s <C-R>=expand("<cword>")<CR><CR>
" Global Find global definitions of the token under cursor
nmap <F3> <ESC>:vert scs find g <C-R>=expand("<cword>")<CR><CR>
" calls Find all calls to the function name under cursor
nmap <F4> <ESC>:vert scs find c <C-R>=expand("<cword>")<CR><CR>
" text Find all instances of the text  under cursor
nmap <F6> <ESC>:vert scs find t <C-R>=expand("<cword>")<CR><CR>
" egrep search for the word under cursor
nmap <F7> <ESC>:vert scs find e <C-R>=expand("<cword>")<CR><CR>
" open file name under cursor
nmap <F8> <ESC>vert :scs find f <C-R>=expand("<cword>")<CR><CR>
" find files that include the filenames under cursor
"nmap <F9> <ESC>:vert scs find i <C-R>=expand("<cword>")<CR>$<CR>
" find functions that function under the cursor calls
nmap <F10> <ESC>:vert scs find d <C-R>=expand("<cword>")<CR><CR>

nmap <C-\>s :scs find s <C-R>=expand("<cword>")<CR><CR>  
nmap <C-\>g :scs find g <C-R>=expand("<cword>")<CR><CR>  
nmap <C-\>c :scs find c <C-R>=expand("<cword>")<CR><CR>  
nmap <C-\>t :scs find t <C-R>=expand("<cword>")<CR><CR>  
nmap <C-\>e :scs find e <C-R>=expand("<cword>")<CR><CR>  
"nmap <C-\>f :scs find f <C-R>=expand("<cfile>")<CR><CR>  
nmap <C-\>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :scs find d <C-R>=expand("<cword>")<CR><CR>

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR> 
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR> 
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR> 
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR> 
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR> 
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR> 
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>   
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR> 

map <F9> :!cscope -Rbqk<CR>:cs reset<CR><CR>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
"command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
"                \ | wincmd p | diffthis

set cscopeverbose

set vb
set ts=3
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
set autoindent
set nonumber
colorscheme elflord
highlight StatusLineNC cterm=bold ctermfg=Black ctermbg=DarkYellow
highlight StatusLine cterm=bold ctermfg=Black ctermbg=DarkYellow
set statusline=%f,%c
set laststatus=2
set cindent
":fixdel
"set backspace=eol,start
set nocompatible
set backspace=indent,eol,start
set ignorecase
set smartcase
set incsearch
set expandtab
set shiftwidth=4
set hlsearch
set nolist
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:.
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
:noremap <F12> :set nolist!<CR>

nmap <C-\>n :set nonumber!<CR>

" Press F11 to toggle highlighting on/off, and show current value.
:noremap <F11> :set hlsearch! hlsearch?<CR>
set gfn=Monospace\ 12
if has("gui_running")
    colorscheme desert
endif
if &diff
    set nofoldenable
    colorscheme desert
    :noremap <F5> [c
    :noremap <F6> ]c
    syntax off
    highlight DiffAdd    cterm=bold ctermfg=Black ctermbg=DarkGray gui=none guifg=bg guibg=Red
    highlight DiffDelete cterm=bold ctermfg=Black ctermbg=DarkGray gui=none guifg=bg guibg=Red
    highlight DiffChange cterm=bold ctermfg=Black ctermbg=yellow gui=none guifg=bg guibg=Red
    highlight DiffText   cterm=bold ctermfg=Black ctermbg=Cyan gui=none guifg=bg guibg=Red
    highlight StatusLine cterm=bold ctermfg=Green ctermbg=Black
endif
retab
