""" Vim-Plug
call plug#begin()
" Aesthetics - Main
" Plug 'tribela/vim-transparent'
"Plug 'neoclide/coc.nvim', {'blanch':'release'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ThePrimeagen/vim-be-good'
Plug 'jacoborus/tender.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'xiyaowong/nvim-transparent'
Plug 'danilo-augusto/vim-afterglow'
Plug 'marko-cerovac/material.nvim'
Plug 'ajmwagar/vim-deus'
Plug 'chrisbra/unicode.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'folke/twilight.nvim'
Plug 'folke/zen-mode.nvim'
"Plug 'bryanmylee/vim-colorscheme-icons'
" Aethetics - Additional
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'godlygeek/tabular'
" Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'alexaandru/nvim-lspupdate'
Plug 'mhinz/vim-signify' 
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'sheerun/vim-polyglot'
Plug 'dm1try/golden_size'
Plug 'voldikss/vim-floaterm'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

set completeopt=menu,menuone,noselect
set runtimepath+=~/.config/nvim/plugged/nvim-colorizer.lua/
set winminwidth=15
set encoding=utf-8
""" Main Configurations
set wildmode=longest,list,full wildmenu
" Enable True Color Support (ensure you're using a 256-color enabled $TERM, e.g. xterm-256color)
set termguicolors
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\ 
set wrap breakindent
set syntax=on
set hidden number title nowrap
set mouse=a
set path+=.,**
set clipboard=unnamedplus
set complete=.,w,b,u,t,i,kspell
set relativenumber
set guifont=Iosevka:h8
" set guifont=Fira\ Sans:h21
set incsearch ignorecase smartcase hlsearch
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
filetype plugin indent on
set nobackup
set nowritebackup
set cmdheight=1
""" Neovide config 
" let g:neovide_cursor_vfx_mode = "torpedo"
let g:neovide_cursor_vfx_mode = "pixiedust"
" let g:neovide_cursor_vfx_mode = "sonicboom"
" let g:neovide_cursor_vfx_mode = "ripple"
" let g:neovide_cursor_vfx_mode = "wireframe"
let g:neovide_cursor_vfx_opacity=200.0
let g:neovide_cursor_vfx_particle_lifetime=1.2
let g:neovide_cursor_vfx_particle_density=7.0
let g:neovide_cursor_vfx_particle_speed=10.0
let g:neovide_cursor_vfx_particle_phase=1.5
let g:neovide_cursor_vfx_particle_phase=1.5
let g:neovide_cursor_vfx_particle_curl=1.0
let g:neovide_cursor_vfx_particle_curl=1.0
let g:material_style = 'deep ocean'
" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" Markdown previez stuff
let g:mkdp_auto_close = 0
" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<PageDown>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" List of colors that you do not want. ANSI code or #RRGGBB
" function! TransparentBackground()
"     highlight Normal guibg=NONE ctermbg=NONE
"     highlight LineNr guibg=NONE ctermbg=NONE
"     set fillchars+=vert:\│
"     highlight VertSplit gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray
" endfunction
let g:neovide_transparency=0.8
let g:transparent_enabled = v:true
" augroup pandoc_syntax
"     au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
" augroup END
" NERDTree
let NERDTreeShowHidden=1
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:completion_enable_snippet = 'UltiSnips'
" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 1 " Uncomment to display buffer tabline above

" Swap CAPS and ESC keyboard shortkeys
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
au VimEnter * ColorizerAttachToBuffer
" vim-pydocstring
"let g:pydocstring_doq_path = '~/.local/bin/doq'

" Supertab
let g:SuperTabDefaultCompletionType = "<C-n>"

" TagBar
let g:tagbar_width = 30

" Limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'gray'

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

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
if has("nvim-0.5.0") || has("patch-8.1.1564")
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
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

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

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
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

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

let g:signify_sign_add = '│'
let g:signify_sign_delete = '│'
let g:signify_sign_change = '│'
hi DiffDelete guifg=#ff5555 guibg=none

" FixCursorHold for better performance
let g:cursorhold_updatetime = 100

" context.vim
" let g:context_nvim_no_redraw =1

""" Filetype-Specific Configurations

" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2
" autocmd FileType * lua require'colorizer'.setup([filetypes={'*'}[, default_options]])
autocmd FileType * ColorizerAttachToBuffer
""" Custom Functions

function! FindExecuteCommand()
    let line = search('\S*!'.'!:.*')
    if line > 0
        let command = substitute(getline(line), "/S*!"."!:*", "", "")
        execute "silent !".commands
        execute "normal gg0"
        redraw
    endif
endfunction

" save any 5+ Jump
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/
" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Move by line
nnoremap j gjzz
nnoremap k gkzz
" TelescopeStuff
nnoremap <leader>mf <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" FloattermStuff
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
nnoremap <C-J> <C-W><C-J>M
nnoremap <C-K> <C-W><C-K>M
nnoremap <C-L> <C-W><C-L>M
nnoremap <C-H> <C-W><C-H>M
nnoremap <F6> :UndotreeToggle<CR>
" Execute python scripts.
nnoremap <F5> <Esc>:w<CR>:!clear;python %<CR>
" nnoremap <C-i> :MarkdownPreview<CR>
"Custom Mappings
let mapleader=","
nmap <leader>x1 :.!toilet -w 200 -f term -F border<CR>
nmap <leader>x3 :.!figlet -c -f Poison<CR>
nmap <leader>x2 :.!figlet -c -f emboss<CR>
nmap <leader>x4 :.!figlet -c -f Fraktur<CR>
nmap <leader>x5 :.!figlet -c -f pagga<CR>
nmap <leader>x6 :.!figlet -c -f sblood<CR>
nmap <leader>x7 :.!figlet -c -f Alligator<CR>
nmap <leader>x8 :.!figlet -c -f Alligator2<CR>
nmap <leader>x9 :.!figlet -c -f Computer<CR>
nmap <leader>x0 :.!figlet -c -f usaflag<CR>
nnoremap Y y$
vmap <leader>Y gg"+yG 
vmap <leader>P "+p 
nmap <leader>Y gg"+yG 
nmap <leader>P "+p 
nnoremap <F10> :%y+<CR>
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap <F11> :TagbarToggle<CR>
nmap <leader>$s <C-w>s<C-w>j:terminal<CR>:set nonumber<CR><S-a>
nmap <leader>$v <C-w>v<C-w>l:terminal<CR>:set nonumber<CR><S-a>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>w :TransparentToggle<CR>
nmap <leader>l :TwilightEnable<CR>
nmap <leader>L :TwilightDisable<CR>
nmap <leader>z :ZenMode<CR>
nmap <leader>s :lua require('material.functions').toggle_style()<CR>
nmap <leader>; :ColorizerToggle<CR>
nmap <leader>e0 :AirlineTheme deus<CR>
nmap <leader>e1 :colorscheme material<CR>
nmap <leader>e2 :colorscheme peachpuff<CR>
nmap <leader>e3 :colorscheme deus<CR>
nmap <leader>e4 :colorscheme evening<CR>
nmap <leader>e5 :colorscheme desert<CR>
nmap <leader>e6 :colorscheme tender<CR>
nmap <leader>e7 :colorscheme delek<CR>
nmap <leader>e8 :colorscheme darkblue<CR>
nmap <leader>e9 :colorscheme gruvbox<CR>
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
xmap <leader>ag gaip*
nmap <leader>ag gaip*
nmap <leader>F :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>c :Colors<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap <C-c> "+y
vnoremap <C-v> "+p
inoremap <C-j> <esc>:m .+1<CR>==i
inoremap <C-k> <esc>:m .-2<CR>==i
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
colorscheme gruvbox
