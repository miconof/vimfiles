"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"activate pathogen
call pathogen#infect()

set backspace=indent,eol,start  "allow backspacing over anything, insert mode
set history=999                 "store lots of :cmdline history
set showcmd                     "show incomplete cmds down the bottom
set showmode                    "show current mode down the bottom
"set number                     "show line numbers
set list                        "display tabs and trailing spaces
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set incsearch                   "find the next match as we type the search
set hlsearch                    "hilight searches by default
set wrap                        "dont wrap lines
set linebreak                   "wrap lines at convenient points

"default indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

"folding settings
set foldmethod=indent       "fold based on indent
set foldnestmax=3           "deepest fold is 3 levels
set nofoldenable            "dont fold by default
set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set formatoptions-=o        "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2
set t_Co=256                "tell the term has 256 colors
set hidden                  "hide buffers when not displayed

"load ftplugins and indent files
filetype on
filetype plugin on
filetype indent on
syntax on                   "turn on syntax highlighting

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"map Q to something useful
noremap Q gq
"make Y consistent with C and D
nnoremap Y y$

set smartindent
set backupdir=~/.vim/backup     "put backup and swap files out of the way!
set directory=~/.vim/tmp
" For our convenience we can also map Ctrl+c to copy a block of text
map <C-c> "*y<CR>
set tags=./tags;    "look for tags recursively upwards in the directories tree
set formatprg=par   "Set par as the default parser for text

"powerline configuration
let g:Powerline_symbols = 'fancy'

"clang and supertab settings
set completeopt=menu,menuone,longest  "disable preview scratch window
set pumheight=15                      "limit popup menu height
let g:SuperTabDefaultCompletionType = "context" "context aware completion
let g:clang_complete_auto = 0 "disable auto popup, use <Tab> to autocomplete
let g:clang_complete_copen = 1 "show clang errors in the quickfix window

"nerdtree settings
let g:NERDTreeMouseMode = 2
let g:NERDTreeWinSize = 24

"gundo configuration
let g:gundo_width = 30
let g:gundo_preview_height = 30
let g:gundo_right = 1

" ack-grep configuration
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Function key mappings
nmap <F2> :wall<cr>
imap <F2> <esc>:wall<cr>
nmap <F3> :bp<cr>G
imap <F3> <esc>:bp<cr>G
nmap <F4> :bn<cr>G
imap <F4> <esc>:bn<cr>G
nnoremap <F5> :NERDTreeToggle<cr>
nnoremap <F6> :TagbarToggle<cr>
nnoremap <F7> :Ack<space>
nnoremap <F8> :GundoToggle<CR>
nnoremap <F9> :BufExplorer<cr>
set pastetoggle=<F10>           "Toggle autoindentation for clipboard pasting
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Toggle comments of selected lines in normal, visual and insert modes
map <C-D> <plug>NERDCommenterInvert
map! <C-D> <esc><plug>NERDCommenterInvert i

" tab navigation
nmap <A-Left> gT
nmap <A-Right> gt
imap <A-Left> <esc>gT
imap <A-Right> <esc>gt
imap <C-O> <esc>:tabnew<cr>
nmap <C-O> :tabnew<cr>
:map <A-F1> 1gt     " goto first tab
:map <A-F2> 2gt
:map <A-F3> 3gt
:map <A-F4> 4gt
:map <A-F5> 5gt
:map <A-F6> 6gt
:map <A-F7> 7gt
:map <A-F8> 8gt
:map <A-F9> 9gt
:map <A-F0> 10g

" buffer navigation
nmap <C-Left> :bp<cr>
imap <C-Left> <esc>:bp<cr>
nmap <C-Right> :bn<cr>
imap <C-Right> <esc>:bn<cr>
nmap <C-Up> :buffers<cr>
imap <C-Up> <esc>:buffers<cr>

" Filetype dependant options
autocmd FileType text set textwidth=80 formatoptions+=t spell
autocmd FileType c,cpp,slang set cindent "automatic indentation for C/C++
autocmd filetype svn,*commit* setlocal spell "spell check for commit logs
autocmd FileType make set noexpandtab shiftwidth=8 "tabs in makefiles
"autocmd BufRead,BufNewFile *.py syntax on
"autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent
  \ cinwords=if,elif,else,for,while,try,except,finally,def,class

" These settings are needed for latex-suite
let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $*
set iskeyword+=:
autocmd FileType tex set textwidth=80 formatoptions+=t spell
let g:tex_comment_nospell= 1 "disable spell checker in comments

" enable version dependent options
if v:version >= 703
    set undodir=~/.vim/undofiles    "undo settings
    set undofile

    set colorcolumn=+1              "mark the ideal max text width
    hi ColorColumn ctermbg=lightgrey guibg=lightgrey
endif

" GUI dependent options
if has("gui_running")
    "set guifont=Terminus\ 8
    set background=dark
    "colors default
    highlight CursorLine guibg=#003853 ctermbg=24 gui=none cterm=none
    set cursorline        " highlight current line

    " Remove toolbar, left scrollbar and right scrollbar
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R

    " Window size
    au GUIEnter * winpos 50 25
    au GUIEnter * set lines=999 columns=999
else
    let g:CSApprox_loaded = 1 "dont load csapprox silences an annoying warning
    set background=dark
    colors default
endif

"statusline setup
set statusline =%#identifier#
set statusline+=[%t]    "tail of the filename
set statusline+=%*

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

set statusline+=%{fugitive#statusline()}

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}

set statusline+=%{StatuslineLongLineWarning()}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction


"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")

        if !&modifiable
            let b:statusline_long_line_warning = ''
            return b:statusline_long_line_warning
        endif

        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)
    let line_lens =
      \ map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
    return filter(line_lens, 'v:val > threshold')
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction

"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>


"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'svn\|commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

"http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
"hacks from above (the url, not jesus) to delete fugitive buffers when we
"leave them - otherwise the buffer list gets poluted
"
"add a mapping on .. to view parent tree
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd BufReadPost fugitive://*
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" Remove trail spaces
nnoremap <silent> ,r :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" close automatically preview window of omnicompletion
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" title
let &titlestring = "vim:" . expand("%:t")
if &term == "screen"
    set t_ts=^[k
    set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
    set title
endif

" Close Vim if the only buffer is a nerdtree
autocmd bufenter *
  \ if (winnr("$") == 1 && exists("b:NERDTreeType")
  \ && b:NERDTreeType == "primary")|
  \ q|
  \ endif
