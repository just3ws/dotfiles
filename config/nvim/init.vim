set encoding=utf-8

if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('tpope/vim-sensible')

  call dein#add('arcticicestudio/nord-vim')
  call dein#add('dense-analysis/ale')
  call dein#add('kana/vim-textobj-user')
  call dein#add('mhinz/vim-startify')
  call dein#add('mileszs/ack.vim')
  call dein#add('nelstrom/vim-textobj-rubyblock')
  call dein#add('pangloss/vim-javascript')
  call dein#add('pbrisbin/vim-mkdir')
  call dein#add('preservim/nerdtree')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('sjl/vitality.vim')
  call dein#add('tek/vim-textobj-ruby')
  call dein#add('tpope/vim-bundler')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-dispatch')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-eunuch')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-git')
  call dein#add('tpope/vim-projectionist')
  call dein#add('tpope/vim-ragtag')
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-rake')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-rhubarb')
  call dein#add('tpope/vim-surround')
  call dein#add('vim-ruby/vim-ruby')

  " if filereadable(expand("~/.vimrc.bundles"))
  "   source ~/.vimrc.bundles
  " endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

runtime! plugin/sensible.vim
colorscheme nord

" 
" " Leader
let mapleader = ";"

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" 
" set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline
 


" augroup vimrcEx
"   autocmd!
" 
"   " When editing a file, always jump to the last known cursor position.
"   " Don't do it for commit messages, when the position is invalid, or when
"   " inside an event handler (happens when dropping a file on gvim).
"   autocmd BufReadPost *
"     \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
"     \   exe "normal g`\"" |
"     \ endif
" 
"   " Set syntax highlighting for specific file types
"   autocmd BufRead,BufNewFile *.md set filetype=markdown
"   autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
"   autocmd BufRead,BufNewFile aliases.local,zshrc.local,*/zsh/configs/* set filetype=sh
"   autocmd BufRead,BufNewFile gitconfig.local set filetype=gitconfig
"   autocmd BufRead,BufNewFile tmux.conf.local set filetype=tmux
"   autocmd BufRead,BufNewFile vimrc.local set filetype=vim
" augroup END
" 
 " ALE linting events
 augroup ale
   autocmd!
 
   if g:has_async
     autocmd VimEnter *
       \ set updatetime=1000 |
       \ let g:ale_lint_on_text_changed = 0
     autocmd CursorHold * call ale#Queue(0)
     autocmd CursorHoldI * call ale#Queue(0)
     autocmd InsertEnter * call ale#Queue(0)
     autocmd InsertLeave * call ale#Queue(0)
   else
     echoerr "The thoughtbot dotfiles require NeoVim or Vim 8"
   endif
 augroup END
 
" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1
 
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
" 
" " Display extra whitespace
" set list listchars=tab:»·,trail:·,nbsp:·
" 
" Use one space, not two, after punctuation.
set nojoinspaces
" 
" " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
" if executable('ag')
"   " Use Ag over Grep
"   set grepprg=ag\ --nogroup\ --nocolor
" 
"   " Use ag in fzf for listing files. Lightning fast and respects .gitignore
"   let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'
" 
"   if !exists(":Ag")
"     command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
"     nnoremap \ :Ag<SPACE>
"   endif
" endif
" 
" " Make it obvious where 80 characters is
" set textwidth=80
" set colorcolumn=+1
" 
" " Numbers
" set number
" set numberwidth=5
" 
" " Tab completion
" " will insert tab at beginning of line,
" " will use completion if not at beginning
" set wildmode=list:longest,list:full
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<Tab>"
"     else
"         return "\<C-p>"
"     endif
" endfunction
" inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
" inoremap <S-Tab> <C-n>
" 
" " Switch between the last two files
" nnoremap <Leader><Leader> <C-^>
" 
" " Get off my lawn
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>
" 
" " vim-test mappings
" nnoremap <silent> <Leader>t :TestFile<CR>
" nnoremap <silent> <Leader>s :TestNearest<CR>
" nnoremap <silent> <Leader>l :TestLast<CR>
" nnoremap <silent> <Leader>a :TestSuite<CR>
" nnoremap <silent> <Leader>gt :TestVisit<CR>
" 
" " Run commands that require an interactive shell
" nnoremap <Leader>r :RunInInteractiveShell<Space>
" 
" " Treat <li> and <p> tags like the block tags they are
" let g:html_indent_tags = 'li\|p'
" 
" " Set tags for vim-fugitive
" set tags^=.git/tags
" 
" " Open new split panes to right and bottom, which feels more natural
" set splitbelow
" set splitright
" 
" " Quicker window movement
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l
" 
" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>
" 
" " Map Ctrl + p to open fuzzy find (FZF)
" nnoremap <c-p> :Files<cr>
" 
" " Set spellfile to location that is guaranteed to exist, can be symlinked to
" " Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
" set spellfile=$HOME/.vim-spell-en.utf-8.add
" 
" " Autocomplete with dictionary words when spell check is on
" set complete+=kspell
" 
" " Always use vertical diffs
" set diffopt+=vertical
" 
" " Local config
" if filereadable($HOME . "/.vimrc.local")
"   source ~/.vimrc.local
" endif
