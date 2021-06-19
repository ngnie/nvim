if has("syntax")
  syntax on
endif

imap ii <Esc>
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab autoindent smartindent
set nu rnu
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'
  Plug 'tpope/vim-classpath'
  Plug 'tpope/vim-surround'
  Plug 'morhetz/gruvbox'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neoclide/coc-java'
  Plug 'dansomething/coc-java-debug'
  Plug 'puremourning/vimspector'
  Plug 'jiangmiao/auto-pairs'
  Plug 'rstacruz/sparkup'
  Plug 'alvan/vim-closetag'
  Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
  Plug 'vim-airline/vim-airline'
  Plug 'vim-test/vim-test'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'benmills/vimux'
  Plug 'szw/vim-maximizer'
  Plug 'vim-syntastic/syntastic'
  Plug 'tpope/vim-fugitive'
  Plug 'christoomey/vim-conflicted'
  Plug 'leafgarland/typescript-vim'  
  "Plug 'preservim/nerdtree'
  Plug 'justinmk/vim-dirvish'
  "Plug 'rafaqz/ranger.vim'  
  "Plug 'vifm/neovim-vifm'
  "Plug 'vifm/vifm.vim'
  Plug 'TaDaa/vimade'
  Plug 'rhysd/clever-f.vim'
  "Plug 'dyng/ctrlsf.vim' "vim-easymotion virker bedre..
  Plug 'easymotion/vim-easymotion'
  "Plug 'nvim-lua/popup.nvim'
  "Plug 'nvim-lua/plenary.nvim'
  "Plug 'nvim-telescope/telescope.nvim'
  "Plug 'nvim-telescope/telescope-fzy-native.nvim'
  "Plug 'yuttie/comfortable-motion.vim'
  Plug 'KKPMW/vim-sendtowindow'
  Plug 'rakr/vim-one' 
call plug#end()


" For Fuzzy finder
nnoremap <silent> <space>f :Files<cr>
nnoremap <silent> <space>F :Files ~<cr>

set cursorline

" ThePrimeagen - block move
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" show matches during typing 
set incsearch
" highlight all matches
set hlsearch

"colorscheme gruvbox
colorscheme one
set background=dark
set termguicolors
set backspace=indent,eol,start

set scrolloff=12
set signcolumn=yes

set ignorecase
set smartcase
set autoread

let mapleader = " "

nnoremap <A-b> <C-w>
nnoremap <A-b>h <C-w>s

nnoremap <silent> <A-h> :exe "vertical resize -5"<CR>
nnoremap <silent> <A-j> :exe "resize +5"<CR>
nnoremap <silent> <A-k> :exe "resize -5"<CR>
nnoremap <silent> <A-l> :exe "vertical resize +5"<CR>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" setup mapping to call :LazyGit
nnoremap <silent> <leader>lg :LazyGit<CR>

" Prover at kommentere dette ud:
" let g:tmux_navigator_no_mappings = 1
" nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
" nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
" nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
" nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
"
" Nedstaaende var kommenteret ud fra start: 
" Disable tmux navigator when zooming the Vim pane
" let g:tmux_navigator_disable_when_zoomed = 1

set splitright
set splitbelow
set clipboard=unnamedplus

" Git
nnoremap <C-p> :GFiles<CR>

" Use tab and shift tab to scroll autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" ------------------------------------------------------
" coc
"
" Added from https://vimawesome.com/plugin/coc-nvim
"
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
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
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

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

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
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
" ------------------------------------------------------


" ------------------------------------------------------
" Example using vimux
noremap <leader>dd :VimuxRunCommand "java -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=5005,suspend=y Hello"<CR>


" ------------------------------------------------------
" vimspector
let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>ds :CocCommand java.debug.vimspector.start<CR>
nmap <leader>db <Plug>VimspectorToggleBreakpoint


let test#java#runner = 'gradletest'
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>


" Maximizer
nmap <silent> <leader>m :MaximizerToggle<CR>


" See buffers
nmap <silent> <leader>bu :Buffers<CR>

nmap <silent> <leader>rg :Rg<CR>
nmap <silent> <leader>ag :Ag<CR>

" Ranger filemanager
"
"let g:ranger_terminal = 'xterm -e'
"map <leader>rr :RangerEdit<cr>
"map <leader>rv :RangerVSplit<cr>
"map <leader>rs :RangerSplit<cr>
"map <leader>rt :RangerTab<cr>
"map <leader>ri :RangerInsert<cr>
"map <leader>ra :RangerAppend<cr>
"map <leader>rc :set operatorfunc=RangerChangeOperator<cr>g@
"map <leader>rd :RangerCD<cr>
"map <leader>rld :RangerLCD<cr>
"
"
nmap <silent> <leader>dv :Dirvish<CR>

" highlight windows
let g:vimade = {}
let g:vimade.fadelevel = 0.5
let g:vimade.enablesigns = 1

" Clever-f.. keep ; and ,
map ; <Plug>(clever-f-repeat-forward)
map , <Plug>(clever-f-repeat-back)

" Find files using Telescope command-line sugar.
"nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"From Code Smell
nnoremap ; :
vnoremap ; :

nmap <silent> <leader>p "0p
nmap <silent> <leader>P "0P

" me: nice but I dont want to forget the others..
"nmap <silent> <leader>' ysiw'
"nmap <silent> <leader>d' ds'
"nmap <silent> <leader>" ysiw"
"nmap <silent> <leader>d" ds"

let g:sendtowindow_use_defaults=0