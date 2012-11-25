"  set VIM variable
:filetype on
:set autoindent
:set ruler
:set showcmd
:filetype plugin indent on
:set ignorecase
:set number

" set tab = 4 space
set tabstop=4 
set shiftwidth=4
set expandtab
retab

"  set wrap
:set nowrap

"  set H boundry
:set sidescroll=10

"  set V boundry
:set so=3

"  set whichwrap
:set whichwrap=b,s,<,>,[,]

"  set highlight
":set highlight
:set hls

" set color
:syntax enable

"set ignore cast
:set ic
:set incsearch

"set hotkey of taglist to F11 amd setup taglist
let Tlist_Ctags_Cmd='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .'
"let Tlist_Use_Right_Window=1
:nmap <F11> :TlistToggle<CR>
:imap <F11> <ESC>:TListToggle<RC>

"set hotkey of nerdtree to F12
let g:NERDTreeWinPos="right"
:map <F12> :NERDTreeToggle<CR> 
:imap <F12> <ESC>:NERDTreeToggle<CR>
"show bookmark
let NERDTreeShowBookmarks=1

"set hotkey of tab to tight
:map <F10> :tabn<CR>
:imap <F10> <ESC>:tabn<CR>

"set super tab
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-P>"

" set omnifunc for c and cpp
autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType cpp set omnifunc=cppcomplete#Complete

" set tab for makefile
autocmd FileType make setlocal noexpandtab

" set omnicppcomplete
set nocp
filetype plugin on
set completeopt=longest,menu
"set tags+=~/.vim/tags/
let OmniCpp_NamespaceSearch = 1 
let OmniCpp_GlobalScopeSearch = 1 
let OmniCpp_ShowAccess = 1 
let OmniCpp_MayCompleteDot = 1 
let OmniCpp_MayCompleteArrow = 1 
let OmniCpp_MayCompleteScope = 1 
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"] 

"set Pmenu color
hi Pmenu ctermbg=200 guibg=LightMagenta
hi PmenuSel ctermbg=8 guibg=Grey

"set color scheme
:colorscheme peachpuff

"set font
:set guifont=Monaco:h14
