""" Vim-Plug
call plug#begin()
" Aesthetics - Main
" Plug 'tribela/vim-transparent'
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
lua << EOF
require'colorizer'.setup({
  '*'; -- Highlight all files, but customize some others.
  css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
  html = { names = false; } -- Disable parsing "names" like Blue or Gray})
})
require('material').setup()
require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be clear
    -- In particular, when you set it to 'all', that means all avaliable groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})

require("twilight").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
}
require("zen-mode").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
}

require'lspconfig'.pyright.setup{}
require'lspconfig'.pylsp.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.java_language_server.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.perlls.setup{}
require'lspconfig'.phpactor.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.sqlls.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.rls.setup{}

-- require'lspconfig'.rust_analyzer.setup{}
local nvim_lsp = require('lspconfig')
local lsp_installer = require("nvim-lsp-installer")

-- lsp provider to find the cursor word definition and reference
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'C-m', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local servers = {'pyright'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
vim.lsp.set_log_level("debug")
require'colorizer'.attach_to_buffer(0)
EOF
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
colors tender
set hidden number title nowrap
set mouse=a
set path+=.,**
set clipboard=unnamedplus
set complete=.,w,b,u,t,i,kspell
set relativenumber
set guifont=Droid\ Sans\ Mono\ Nerd\ Font:h17
" set guifont=Fira\ Sans:h21
set incsearch ignorecase smartcase hlsearch
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
filetype plugin indent on
set nobackup
set nowritebackup
set cmdheight=1
""" Neovide config 
let g:neovide_refresh_rate=140
let g:neovide_no_idle=v:true
let g:neovide_transparency=0.55
let g:neovide_no_idle=v:true
" let g:neovide_fullscreen=v:true
let neovide_remember_window_size = v:true
let g:neovide_cursor_animation_length=0.15
let g:neovide_cursor_trail_length=0.9
let g:neovide_cursor_antialiasing=v:true
let g:neovide_cursor_vfx_mode = "railgun"
" let g:neovide_cursor_vfx_mode = "torpedo"
" let g:neovide_cursor_vfx_mode = "pixiedust"
" let g:neovide_cursor_vfx_mode = "sonicboom"
" let g:neovide_cursor_vfx_mode = "ripple"
" let g:neovide_cursor_vfx_mode = "wireframe"
" let g:neovide_cursor_vfx_opacity=200.0
" let g:neovide_cursor_vfx_particle_lifetime=1.2
" let g:neovide_cursor_vfx_particle_density=7.0
" let g:neovide_cursor_vfx_particle_speed=10.0
" let g:neovide_cursor_vfx_particle_phase=1.5
" let g:neovide_cursor_vfx_particle_phase=1.5
" let g:neovide_cursor_vfx_particle_curl=1.0
" let g:neovide_cursor_vfx_particle_curl=1.0
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
let g:UltiSnipsListSnippets="<c-;>"
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

let g:transparent_enabled = v:true
" augroup pandoc_syntax
"     au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
" augroup END
" NERDTree
let NERDTreeShowHidden=1
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 1 " Uncomment to display buffer tabline above

" Swap CAPS and ESC keyboard shortkeys
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
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

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
    "  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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
" nnoremap j gjzz
" nnoremap k gkzz
" TelescopeStuff
nnoremap <leader>ff <cmd>Telescope find_files<cr>
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
" Custom Mappings
let mapleader=","
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
nmap <leader>e0 :AirlineTheme gruvbox<CR>
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
xmap <leader>ag gaip*
nmap <leader>ag gaip*
nmap <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>c :Colors<CR>
colorscheme gruvbox

" Move text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==i
inoremap <C-k> <esc>:m .-2<CR>==i
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
