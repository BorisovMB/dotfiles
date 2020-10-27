"                        _           
"                       (_)          
"  _ __   ___  _____   ___ _ __ ___  
" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \ 
" | | | |  __/ (_) \ V /| | | | | | |
" |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"
"============================================
"== 			Plugin section             ==
"============================================
"
call plug#begin('~/.config/nvim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-css-color'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'lervag/vimtex'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
"Plug 'mhinz/vim-startify'
Plug 'hardcoreplayers/dashboard-nvim'
Plug 'honza/vim-snippets'
Plug 'junegunn/goyo.vim'
Plug 'unblevable/quick-scope'
"Plug 'hardcoreplayers/spaceline.vim'
Plug 'mhartington/oceanic-next'
Plug 'rhysd/vim-clang-format'
Plug 'kana/vim-operator-user'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()
"============================================
"== 			Basic settings             ==
"============================================

let mapleader="," 									" Setting mapleader
set number relativenumber                    		" Relativenumbers on lines
set noshowmode                               		" We don't need to see things like -- INSERT -- anymore
set wildmenu                                 		" Menu at the bottom
set ruler                                    		" Show the cursor position all the time
set nostartofline                            		" Stop certain movements from always going to the first character of a line
set textwidth=100							 		" Max length of line is 100 symbols
set backspace=indent,eol,start 				 		" Backspace behaviour
set showcmd									 		" Show command line
set viminfo='100,n$HOME/.config/nvim/info/viminfo 	" Viminfo path
set incsearch 										
set hlsearch                                        " Search highlighting
set ignorecase 									    " Search ignore case
set smartcase
set showmatch
set nobackup 										" This is recommended by coc and no more useless files
set nowritebackup 									" This is recommended by coc and no more useless files
set noswapfile 										" No more swap files
set smarttab 										" Makes tabbing smarter
set shiftwidth=4 									
set tabstop=4
set autoindent 										" Good auto indent
set splitbelow                          			" Horizontal splits will automatically be below
set splitright                          			" Vertical splits will automatically be to the right
set laststatus=2 									" Always show statusline
set encoding=utf-8 									" The encoding displayed
set showtabline=2 									" Always show tabline
set hidden 											" This is recommended by coc
set cmdheight=2 									" More space for displaying messages"
set updatetime=300 									" Shorter updatetime
set shortmess+=c 									" Don't pass messages to |ins-completion-menu|
set conceallevel=1
set clipboard^=unnamed,unnamedplus

"============================================
"== 			 Key bindings  	           ==
"============================================
nnoremap <silent><leader>fb :Buffers<CR>
nnoremap <silent><leader>ff :Files<CR>
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :History<CR>
nnoremap <silent> <Leader>fc :Colors<CR>
nnoremap <silent> <Leader>fa :Rg<CR>
map <silent><leader>n :NERDTreeToggle<CR>
map <Leader>lc :VimtexCompile<CR>
imap ii <ESC>
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
map <silent><C-m> :nohl<CR>
map <silent><leader>] :bnext<CR>
map <silent><leader>[ :bprevious<CR>
map <silent><leader>. :tabn<CR>
map <silent><leader>, :tabp<CR>
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d
nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"============================================
"== 			Theme settings             ==
"============================================
syntax on
set background=dark
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif
colorscheme OceanicNext
set cursorline
set winbl=10 "float window is transparent"

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standart = 1
let g:cpp_experimental_template_highlight = 1
let g:load_doxygen_syntax = 1
let c_no_curly_error = 1
"============================================
"== 		   Airline settings            ==
"============================================
let g:airline_theme = 'space'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tabs_label = 'tabs'
let g:airline#extensions#tabline#buffers_label = 'buffers'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tab_count = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_min_count = 1
let g:airline#extensions#tabline#show_tab_type = 1

let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
let g:airline_filetype_overrides = {
  \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', ''), '' ],
  \ 'list': [ '%y', '%l/%L'],
  \ }
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_highlighting_cache = 1
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
"let g:airline_extensions = ['branch', 'hunks', 'coc']
let g:airline_section_z = airline#section#create(['linenr'])
" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1

"============================================
"== 			LaTeX settings             ==
"============================================

let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_latexmk_options='-pdf -pdflatex="xelatex -synctex=1 \%S \%O" -verbose -file-line-error -interaction=nonstopmode'
let g:tex_conceal='abdmg'
let g:livepreview_previewer = 'zathura'

"============================================
"== 			  Fzf settings             ==
"============================================
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6 } }


"============================================
"== 			  Coc settings             ==
"============================================
"Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
	\ pumvisible() ? coc#_select_confirm() :
	\ coc#expandableOrJumpable() ?
	\ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
 
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

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

" Add `:Fold` command to foldcurrent buffer.
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

"============================================
"== 		   NerdTree settings           ==
"============================================
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

"============================================
"== 			Notes settings             ==
"============================================
let g:notes_directories = ["~/documents/notes"]
let g:notes_suffix = '.txt'
let g:notes_unicode_enabled = 1

"============================================
"== 	      Dashboard settings           ==
"============================================
"let g:startify_session_dir='~/.config/nvim/session'
"let g:startify_bookmarks = [ '~/.config/nvim/init.vim', '~/.config/zsh/.zshrc', '~/.config/qtile/config.py' ]
"let g:webdevicons_enable_startify = 1
"let g:startify_change_to_dir = 1
"let g:startify_lists = [
"          \ { 'type': 'dir',       'header': ['                                                                                Current Directory '. getcwd()] },
"          \ { 'type': 'files',     'header': ['                                                                                Recent Files']                        },
"          \ { 'type': 'sessions',  'header': ['                                                                                Sessions']                     },
"          \ { 'type': 'bookmarks', 'header': ['                                                                                Bookmarks']                    },
"          \ ]
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
let g:dashboard_default_executive ='fzf'

let g:dashboard_custom_shortcut={
  \ 'last_session'       : 'LDR s l',
  \ 'find_history'       : 'LDR f h',
  \ 'find_file'          : 'LDR f f',
  \ 'change_colorscheme' : 'LDR f c',
  \ 'find_word'          : 'LDR f a',
  \ 'book_marks'         : 'LDR f b',
  \ }

"============================================
"== 	    Clang-Format settings          ==
"============================================
"
let g:clang_format#style_options = {
              \ "AccessModifierOffset" : -4,
              \ "AllowShortIfStatementsOnASingleLine" : "true",
              \ "AlwaysBreakTemplateDeclarations" : "true",
              \ "Standard" : "C++11"}

autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)

highlight cBlock ctermfg=68 ctermbg=235
