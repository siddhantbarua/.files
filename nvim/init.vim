" Install Vim Plug Plugin manager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
        silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
  
" Make directory for plugins
if empty(glob('~/.local/share/nvim/plugged'))     
        !mkdir "$HOME/.local/share/nvim/plugged"
endif


""" Plugins{{{
call plug#begin("$HOME/.local/share/nvim/plugged/")

" Ayu theme for vim
Plug 'https://github.com/ayu-theme/ayu-vim'
" Indent line
Plug 'https://github.com/Yggdroot/indentLine'
" Airline
Plug 'https://github.com/vim-airline/vim-airline'
" NerdTree file systen explorer
Plug 'https://github.com/preservim/nerdtree'
" Gigutter for tracking edits in git files
Plug 'https://github.com/airblade/vim-gitgutter'
" Auto pairs for brackets
Plug 'https://github.com/jiangmiao/auto-pairs'
" fzf fuzzyfinder
Plug 'https://github.com/junegunn/fzf.vim'
" COC for completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" }}}

""" Colors{{{
" Ayu theme
set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
colorscheme ayu
" enable syntax processing
syntax enable
"}}}

"""Spaces and Tabs{{{
" number of visual spaces per TAB
set tabstop=4
" number of spaces in TAB when editing
set softtabstop=4
" convert tabs to spaces
set expandtab
"}}}

"""UI{{{
" show line numbers
set number
nnoremap <F2> :set number!<CR>
" toggle relative number
nnoremap <F3> :set relativenumber!<CR>
" show command in bottom bar
set showcmd
" highlight current line
set cursorline
" load filetype-specific indents
filetype indent on
" visual autocomplete for command menu
set wildmenu
" redraw only when need to
set lazyredraw
" match parenthesis
set showmatch
" Reducing update time from 4s to 100ms
set updatetime=100
"IndentLine 
let g:indentLine_char = '|'
let g:indentLine_first_char = '|'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" Use mouse
set mouse=a
"}}}

"" Leader shortcuts{{{
" change leader to comma
let mapleader=","
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
"}}}

"""Search{{{
" Search as characters are entered
set incsearch
" highlight matches
set hlsearch
" turn off search highlight 
nnoremap <leader><space> :nohlsearch<CR>
" Nerd-Tree toggle
map <C-n> :NERDTreeToggle<CR>
" Trigger fzf
nnoremap <silent> <leader>o :Files<CR>
nnoremap <silent> <leader>O :Files!<CR>

"}}}

""" Folding{{{
" enable folding
set foldenable
" open most folds by default
" set foldlevelstart=10
" max 10 nested folds
set foldnestmax=10
" space opens and closes folds 
nnoremap <Space> za
" fold based on indent level
set foldmethod=indent
"}}}

""" Key Bindings{{{
" move vertically by visual line 
nnoremap j gj
nnoremap k gk
" move to beginning of line 
nnoremap B ^
nnoremap E $
" disable $/^
nnoremap $ <nop>
nnoremap ^ <nop>
"highlight last inserted text
nnoremap gV '[v']
"}}}

"" Tmux{{{
"allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
"}}}
"
"" Completion{{{
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"}}}





" vim:foldmethod=marker:foldlevel=0
