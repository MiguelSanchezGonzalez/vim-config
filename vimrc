"
" Vimrc
" Author: Miguel Sanchez Gonzalez <miguelsanychez@gmail.com>
"


" Important {{{

    " VIM
    set nocompatible

    set encoding=utf-8
    filetype plugin indent on
    syntax on

" }}}


" Plug {{{

    call plug#begin('~/.vim/plugged')

        " Themes
        Plug 'chriskempson/vim-tomorrow-theme'

        " Airline
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'

        " Custom icons
        Plug 'ryanoasis/vim-devicons'

        " Git
        Plug 'tpope/vim-fugitive'
        Plug 'airblade/vim-gitgutter'

        " JavaScript
        Plug 'pangloss/vim-javascript'
        Plug 'mxw/vim-jsx'
        Plug 'styled-components/vim-styled-components'

        " Navigation
        Plug 'ctrlpvim/ctrlp.vim'
        Plug 'ddrscott/vim-side-search'

    call plug#end()

    " Configuration {{{

        " Airline {{{

            " Lets choose what we really want to load
            let g:airline_extensions = [ 'whitespace', 'tabline' ]

            " Use a custom theme in case we are running the gui version since
            " the default one looks pretty nice in terminal
            if has( 'gui_running' )
                let g:airline_theme = 'tomorrow'
            else
                let g:airline_theme = 'dark'
            endif

            " Enable the powerline symbols
            let g:airline_powerline_fonts = 1

            " Extensions - Whitespce
            let g:airline#extensions#whitespace#checks = [ 'indent',
                        \'trailing', 'mixed-indent-file' ]
            let g:airline#extensions#whitespace#trailing_format = 'Ξ [%s]'
            let g:airline#extensions#whitespace#mixed_indent_format = '» [%s]'

            " Extensions - Tabline
            let g:airline#extensions#tabline#close_symbol = 'Ϟ'
            " splits and tab number
            let g:airline#extensions#tabline#tab_nr_type = 2

        " }}}

        " GitGutter {{{

            " Disable all key bindings provided by this plugin
            let g:gitgutter_map_keys = 0

        " }}}

        " CtrlP {{{

            let g:ctrlp_user_command = 'ag %s -l --follow --nocolor -g ""'
            let g:ctrlp_use_caching = 0

        " }}}

        " SideSearch {{{
    
            let g:side_search_split_pct = 0.25
            let g:side_search_splitter = 'new'

        " }}}

        " Netrw {{{

            " Disable the plugin
            let g:loaded_netrw = 1
            let g:loaded_netrwPlugin = 1

        " }}}

    " }}}

" }}}


" Moving around {{{

    " Don't move to the next previous line with any key
    set whichwrap=
    " Move the cursor to the first non-blank character of the line on some jump
    " commands
    set startofline

" }}}


" Searching {{{

    " This settings enable a more efficient/time saving searching on Vim.
    " The Vim '/' search is going to start again from the beginning when reaches
    " the end of the current file, use the case smartly if an upper-case
    " character is in the keyword to search, and perform a highlighted and
    " progressive search.
    set wrapscan
    set ignorecase
    set smartcase
    set hlsearch
    set incsearch

    " When a bracket is inserted, jump to the matching one for the 'matchtime'
    " time
    set showmatch
    set matchtime=2

" }}}


" Displaying text {{{

    " Always show at least 5 lines above and below the cursor.
    set scrolloff=5
    " Lines longer than the current width of the buffer should wrap instead of
    " creating an horizontal scroll.
    set wrap
    " Wrap the line at the 'breakat' characters showing the 'showbreak'
    " character at the beginning of the line.
    set linebreak
    set showbreak=↪
    " The list chars should be disabled and enabled manually if you want to use them
    " because they where causing performance issues when I was in insert mode.
    set nolist
    set listchars=eol:¬,tab:▸\ ,trail:·
    " Don't redraw the screen while executing macros.
    set lazyredraw
    " Show the line numbers relative to the current cursor position, and in the
    " current cursor position show the real line number.
    set number
    set relativenumber
    " Concealed text is completely hidden unless it has a custom replacement
    set conceallevel=2

" }}}


" File management {{{

    " Reload the current file automatically if has been modified outside of Vim
    set autoread
    " Do not write the contents of the file until I want to do it.
    set noautowrite
    set noautowriteall

" }}}


" Indentation {{{

    " Four 'smart' spaces wide
    set smartindent
    set autoindent
    set smarttab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set shiftround

" }}}


" Color options {{{

    " Highglight the line where the cursor is.
    set cursorline
    " Highlight the column after the 'textwidht' option.
    set colorcolumn=+1

" }}}


" Spelling options {{{

    " Disable de spell highlighting by default.
    set nospell
    set spelllang=en_gb
    set spellfile=$HOME/.vim/spell/en.utf-8.add
    " Show the ten best suggestions
    set spellsuggest=best,10

" }}}


" Multiple windows {{{

    " Show always the statusline
    set laststatus=2
    " Preserve the same size of the windows
    set equalalways
    set eadirection=both

    " Keep the buffers hidden when abandoned.
    set bufhidden=hide

    " When open a new split window split it below or on the right side of the
    " current window
    set splitbelow
    set splitright

    " Show always the tab line
    set showtabline=2

"}}}


" Terminal {{{

    " Send more characters to the terminal, and make it faster and smoother
    set ttyfast

    if !has( 'gui_running' )

        " Fix the escape delay in terminal mode
        augroup FastEscape
            autocmd!
            autocmd InsertEnter * set timeoutlen=0
            autocmd InsertLeave * set timeoutlen=1000
        augroup END

    endif

" }}}


" Gui {{{

    " Custom font mind the setup is different for macos and linux
    if has( 'macunix' )
        set guifont=HackNerdFontComplete-Regular:h11
    else
        set guifont=Hack\ Nerd\ Font:1
    endif

    " Actual colorscheme
    set background=light
    colorscheme Tomorrow

    " Only set this options if graphical vim is running.
    if has( 'gui_running' )
        " Enable autoselect in visual and modeless selection and show console
        " dialogs instead of popups.
        set guioptions=aAc
    endif

" }}}


" Mouse options {{{

    " The focus don't follow the mouse.
    set nomousefocus
    " Hide the mouse while typing
    set mousehide

" }}}


" Messages and info {{{

    " The confirmation prompts sucks...
    " x - Use the short version of the OS in the format
    " o - Overwrite message for writing a file with subsequent message for
    "     reading a file
    " A - Don't give the message when an existing swap file is found
    " I - No intro message
    set shortmess=xoAIWt
    " Show partial information of the command keys in the statusline
    set showcmd
    " Don't show the current mode in th status line I already have one
    set noshowmode
    " Suppress all the bells
    set novisualbell
    set noerrorbells
    " Show the current position of the cursor
    set ruler
    " Let me read all the options until I press more
    set more
    " Don't start a dialog when a command fails
    set noconfirm

" }}}


" Selecting text {{{

    set clipboard=unnamedplus,unnamed

" }}}


" Editing text {{{

    " Set a maximum width of 80 cols per row
    set textwidth=80
    " Allow backspace to delete the end and start of lines and the indentation
    set backspace=eol,indent,start
    " Use the format options by default only for comments
    " c - Wrap comments using 'textwidth'.
    " r - Insert the current comment leader after hitting <Enter>. The
    "     behaviour is different if you hit 'o' in normal mode it will open a
    "     new line without the comment leader.
    " q - Allow format comments with gq.
    " j - Remove the leading comment chars when joining two commented lines.
    set formatoptions=crqj
    " Don't add two spaces after a dot when joining lines
    set nojoinspaces

" }}}


" Completion {{{

    " . - The current buffer
    " w - Buffers in other windows
    " b - Other loaded buffers
    " u - Unloaded buffers
    " t - Tags
    set complete=.,w,b,u,t,kspell

    " menuone - Show the menu even if there is only one result
    " longest - Insert the longest common text of the matches
    " preview - Show information about the selected word
    set completeopt=menuone,longest,preview

    " Show a maximum of 10 elements in the popup menu
    set pumheight=10

" }}}


" Backup, undo and swap settings {{{

    set backup
    set undofile
    set noswapfile

    " Directories and extension for the backup files
    set backupext='.bak'
    set backupdir=$HOME/.vim/backups,/tmp
    au BufWritePre * let &bex = '-'.strftime("%Y%b%d%X") . '.bak'

    " Let me undo as much as I want
    set undolevels=10000
    set undoreload=10000
    set undodir=$HOME/.vim/undo

" }}}


" Folding methods {{{

    " Don't fold the files automatically
    set nofoldenable
    " Use markers to define folding
    set foldmethod=marker
    " Triple braces specify the folding marker
    set foldmarker={{{,}}}
    " Fold until the fifth nested fold
    set foldnestmax=5
    " Use two columns to indicate folds
    set foldcolumn=2

" }}}


" Wild mode!!! {{{

    " Remember mostly all the commands
    set history=1000
    " Trigger the command line completion with the tab key
    set wildchar=<Tab>
    set wildmenu
    set wildignorecase
    set wildmode=list:full
    set wildignore+=*.aux,*.out,*.toc
    set wildignore+=*.jpg,*.bmp,*.gif,*.png
    set wildignore+=*.mp3,*.avi
    set wildignore+=*.pdf
    set wildignore+=*.luac,*.pyc
    set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
    set wildignore+=*.spl,*.sw
    set wildignore+=*/.hg/*,*/.svn/*
    set wildignore+=*/node_modules/*,*/bower_components/*

" }}}


" Misc {{{

    " Dont use the paste mode by default.
    set nopaste
    " Toggle between paste mode.
    set pastetoggle=<F11>

" }}}


" Mappings {{{

    let mapleader = '\'

    " Push me to be quick between mapping and keycodes
    set timeout
    set ttimeout

    " Windows {{{

        " Quick movement between split windows
        nnoremap <C-h> <C-w>h
        nnoremap <C-j> <C-w>j
        nnoremap <C-k> <C-w>k
        nnoremap <C-l> <C-w>l

        " Increase or decrease the height of a window
        nnoremap - <C-W>-
        nnoremap + <C-W>+

    " }}}

    " Tabs {{{

        " Open and close tabs
        nnoremap <silent> <C-w>t :tabnew<Cr>
        nnoremap <silent> <C-w>c :tabclose<Cr>

        " Quick movement between tabs
        nnoremap <silent> H :tabprevious<Cr>
        nnoremap <silent> L :tabnext<Cr>

    " }}}

    " Moving between wrapped lines {{{

        nnoremap j gj
        nnoremap k gk

    " }}}

    " Terminal {{{

        " Switch to normal mode in a more convinient way
        tnoremap <Esc> <C-W>N

    " }}}

    " Useful mappings {{{

        " IMO hex mode is useless so let's map something more useful to Q
        nnoremap Q gq
        " Quick access to the vimrc
        nnoremap <F12> :tabnew $HOME/.vimrc<Cr>

        " Clear the actual highlighted search
        nnoremap <leader>/ :nohlsearch<Cr>
        " Remove the number column when not need
        nnoremap <leader>n :setlocal number!<Cr> :setlocal relativenumber!<Cr>
        " remove the trail white spaces
        nnoremap <leader>w mx:%s/\s\+$//e<Cr>:nohl<Cr>`x
        " breaks the current line without need to enter in insert mode
        nnoremap <leader><cr> i<Cr><esc>
        " Toggle the spell checker in the current buffer
        nnoremap <leader>s :setlocal spell!<Cr>
        " Togggle the listchar option
        nnoremap <leader>l :setlocal list!<Cr>

        " When moving to next or previous occurrence centre the window.
        nnoremap n nzz
        nnoremap N Nzz

        " Don't move the cursor on whole word search.
        nnoremap * *<C-o>

        " Write a file in sudo mode even if you forgot the sudo.
        " cnoremap w!! w !sudo tee > /dev/null %

        " Indents the selected block preserving the actual selection
        vnoremap > >gv
        vnoremap < <gv

        " 'Kill the actual window.
        nnoremap K :bwipeout<Cr>

        " Select and copy all the text in the current buffer
        nnoremap <C-a> :%y+<Cr>

    " }}}

    " Plugins {{{

        " CtrlP {{{

            nnoremap <leader>f :let g:ctrlp_default_input = expand('<cword>')<Cr>:CtrlP<Cr>
            nnoremap <leader>p :let g:ctrlp_default_input = ''<Cr>:CtrlP<Cr>

        " }}}

        " SideSearch {{{
        "
            nnoremap <Leader>g :SideSearch <C-r><C-w><CR> | wincmd p

        " }}}

    " }}}

" }}}

" Autocommands {{{

    " Resize the windows to the same size on vim resize
    autocmd VimResized * :wincmd =

    " Fix the css - separated properties
    autocmd FileType css setlocal iskeyword+=-

    " Enable by default the spellchecker in markdown file
    autocmd FileType modula2 set filetype=markdown
    autocmd FileType markdown setlocal spell

" }}}
