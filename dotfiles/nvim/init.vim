call plug#begin('~/.config/nvim')

Plug 'sheerun/vim-polyglot'
Plug 'pineapplegiant/spaceduck'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'

call plug#end()

" Enable linenumbers
set number
" textwrap
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.tex setlocal textwidth=80
au BufRead,BufNewFile *.md setlocal wrap

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

colorscheme spaceduck

let g:lualine = {
      \'options' : {
      \  'theme' : 'spaceduck',
      \  'section_separators' : '',
      \  'component_separators' : '',
      \  'icons_enabled' : v:true,
      \},
      \'sections' : {
      \  'lualine_a' : [ ['mode', {'upper': v:true,},], ],
      \  'lualine_b' : [ ['branch', {'icon': '',}, ], ],
      \  'lualine_c' : [ ['filename', {'file_status': v:true,},], ],
      \  'lualine_x' : [ 'encoding', 'fileformat', 'filetype' ],
      \  'lualine_y' : [ 'progress' ],
      \  'lualine_z' : [ 'location'  ],
      \},
      \'inactive_sections' : {
      \  'lualine_a' : [  ],
      \  'lualine_b' : [  ],
      \  'lualine_c' : [ 'filename' ],
      \  'lualine_x' : [ 'location' ],
      \  'lualine_y' : [  ],
      \  'lualine_z' : [  ],
      \},
      \'extensions' : [ 'fzf' ],
      \}

  lua require("lualine").setup()

" NERDTREE

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
let NERDTreeShowHidden=1

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
