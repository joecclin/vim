
" set OS options
if has("win32")
    " -----------------------------windows offical setting ------------------
    set nocompatible
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin

    set diffexpr=MyDiff()
    function MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        let eq = ''
        if $VIMRUNTIME =~ ' '
            if &sh =~ '\<cmd'
                let cmd = '""' . $VIMRUNTIME . '\diff"'
                let eq = '"'
            else
                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
            endif
        else
            let cmd = $VIMRUNTIME . '\diff'
        endif
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction 
    " -----------------------------windows offincal setting end -----------
    
    " set the ctags exec
    let Tlist_Ctags_Cmd='c:\vimruntime\ctags.exe'

    "set word size
    set guifont=Consolas:h12

    "set omnicppcomplete
    set nocp
    :nmap <F8> :!c:\vimruntime\ctags -R --C++-kinds=+p --fields=+iaS --extra=+q -f "%:p:h\tags" "%:p:h"<CR>

    " set backup dir
    set backupdir=c:\vimtemp

    " set the H scroll bar
    set guioptions+=b

    " set hot key of page control
    "nnoremap <silent> <C-TAB> :tabn<cr>
    :nmap <M-Right> :tabnext<cr>
    :nmap <M-Left> :tabprev<cr>

else 
    let os=substitute(system('uname'), '\n', '', '')
    if os == 'Darwin' || os == 'Mac'
        "set font
        :set guifont=Monaco:h14

        "set Pmenu color
        hi Pmenu ctermbg=200 guibg=LightMagenta
        hi PmenuSel ctermbg=8 guibg=Grey
        
        " set omnicppcomplete
        set nocp
        filetype plugin on
        set completeopt=longest,menu
        set tags+=~/.vim/tags/cpp
        let OmniCpp_NamespaceSearch = 1 
        let OmniCpp_GlobalScopeSearch = 1 
        let OmniCpp_ShowAccess = 1 
        let OmniCpp_MayCompleteDot = 1 
        let OmniCpp_MayCompleteArrow = 1 
        let OmniCpp_MayCompleteScope = 1 
        let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

        "set super tab
        let g:SuperTabRetainCompletionType=2
        let g:SuperTabDefaultCompletionType="<C-P>"

        "set hotkey of taglist to F11 amd setup taglist
        ":nmap <F8> :ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
        :let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
        :set csprg=/usr/local/bin/cscope

        " fix the ms ^M issue
        :set ff=unix

        "set super tab
        let g:SuperTabRetainCompletionType=2
        let g:SuperTabDefaultCompletionType="<C-P>"

        " set omnifunc for c and cpp
        autocmd FileType c set omnifunc=ccomplete#Complete
        "autocmd FileType cpp set omnifunc=cppcomplete#Complete

        " set tab for makefile
        autocmd FileType make setlocal noexpandtab

        " set backup dir
        set backupdir=~/vimtmp
    elseif os == 'Linux'
        " -----------------------------Linux offical setting ------------------
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
        set mouse=n

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
                    \ | wincmd p | diffthi 
        " -----------------------------Linux offical setting end -------------------------
        
        " set the ctags exec 
        let Tlist_Ctags_Cmd='/usr/bin/ctags'
        
        "set omnicppcomplete                                               
        set nocp                                                           
        :nmap <F9> :!cd ..; ctags -R --C++-kinds=+p --fields=+iaS --extra=+q .<CR>
        set completeopt=longest,menu
        set tags+=~/.vim/tags/cpp
        let OmniCpp_NamespaceSearch = 1 
        let OmniCpp_GlobalScopeSearch = 1 
        let OmniCpp_ShowAccess = 1 
        let OmniCpp_MayCompleteDot = 1 
        let OmniCpp_MayCompleteArrow = 1 
        let OmniCpp_MayCompleteScope = 1 
        let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

        " set backup dir
        set backupdir=~/vimtmp

        "set supertab                                                      
        "let g:SuperTabRetainCompletionType=2                              
        "let g:SuperTabDefaultCompletionType="<C-X><C-O>"                  
        "let g:SuperTabMappingTabLiteral="<F8>"            
       
        :nmap <F6> :CMake<CR>
        :nmap <F7> :make<CR>
        :nmap <F8> :Gstatus<CR>
    endif
endif

"  set VIM variable 
:filetype on                        " detect the file type                               
:filetype plugin on                 " load plugin by file type
:filetype plugin indent on          " indent by file type
:set autoindent                     " turn on auto indent
:set ruler                          " show the line and column number of the cusor position
:set showcmd                        " show the command
:set ignorecase                     " ignore the case of searching
:set smartcase                      " When searching try to be smart about cases
:set incsearch                      " search while typing 
:set number                         " show the line number
:set nowrap                         " not chang the longer line to the second line
:set hlsearch                       " high light search
:syntax enable                      " enable high light of language supporting
:colorscheme desert                 " color scheme -- peachpuff
:set autoread                       " auto reload

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"
 
    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")
 
    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif
 
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


" set tab = 4 space
:set tabstop=4                      " number of spaces that a <Tab> in the file counts for 
:set shiftwidth=4                   " number of spaces to use for each step of (auto)indent
:set expandtab                      " number of spaces to use for typing a <Tab>
:retab                              " replace all Tab to spaces

"  set H boundry
:set sidescroll=10                  "set the H bundary of moving the screen

"  set V boundry
:set so=7                           "set the V bundary of moving the screen

" Turn on the WiLd menu
set wildmenu

"  set whichwrap
:set whichwrap=b,s,<,>,[,]          "set the wrap character

" set hotkey
"nnoremap <F10> <ESC>:Project<cr>
nnoremap <F10> <ESC>:TlistToggle<cr><C-W><C-W>
nmap <silent> <F11> <Plug>ToggleProject
nnoremap <F12> <ESC>:NERDTreeToggle<cr>
:nmap <F3> :tabnext<cr>
:nmap <F2> :tabprev<cr>

"set NERDTree 
let NERDTreeShowBookmarks=1             " show book mark
let NERDTreeWinPos='right'               " position of NERDTree

" set vim taglist by josh
set autochdir
set tags+=tags;
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_One_File=1
let Tlist_Close_On_Select=1

" set use backup
set backup 
set writebackup

" set hightline current line
"set cursorline
:nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

" auto load cscope database
function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
    endif
endfunction
au BufEnter /* call LoadCscope()

" set copy to clipboard
set clipboard=unnamed
