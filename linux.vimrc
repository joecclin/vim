" An example for a vimrc file.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2006 Aug 12
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"         for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"       for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
else
  set backup        " keep a backup file
endif
set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch       " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" In an xterm the mouse should work quite well, thus enable it.
set mouse=a

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
  " Also load indent files, to automatically do language-dependent indenting
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

  set autoindent        " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and th
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis

" set tab=4 spaces by josh
set expandtab
set tabstop=4
retab
set shiftwidth=4

" set vim taglist by josh
let Tlist_Ctags_Cmd='/usr/bin/ctags'
nnoremap <F11> <ESC>:TlistToggle<cr><C-W><C-W>
set tags=tags;
set autochdir
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_One_File=1
let Tlist_Close_On_Select=1

" set NERDTree by josh
nnoremap <F12> <ESC>:NERDTreeToggle<cr>
let NERDTreeWinPos='right'

" set hot key of page control
"nnoremap <silent> <C-TAB> :tabn<cr>
:nmap <F10> :tabnext<cr>
":nmap <C-L> :tabprev<cr>


"set filetype                                                          
:filetype on                                                       
:filetype plugin on                                                
                                                                   
"set number                                                        
:set number                                                        
                                                                   
"set ignorecase                                                    
:set ignorecase                                                    
                                                                   
"set nowrap                                                        
:set nowrap                                                        
                                                                   
"set omnicppcomplete                                               
set nocp                                                           
filetype on                                                        
filetype plugin on                                                 
:nmap <F9> :!ctags -R --C++-kinds=+p --fields=+iaS --extra=+q .<CR>
                                                                   
"set supertab                                                      
"let g:SuperTabRetainCompletionType=2                              
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"                  
let g:SuperTabMappingTabLiteral="<F8>"                             
