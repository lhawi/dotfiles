" ===========================
" OBSIDIAN VIMRC
" Diadaptasi dari .ideavimrc
" ===========================

" Leader key
let mapleader = " "

" Plugin (aktifkan via Settings)
set surround
set easymotion

" Matikan Esc default
noremap <Esc> <nop>

" ===========================
" ESCAPE SHORTCUTS
" ===========================
inoremap ii <Esc>
inoremap jk <Esc>
inoremap kj <Esc>
vnoremap jk <Esc>
vnoremap kj <Esc>

" ===========================
" ENTER SHORTCUTS
" ===========================
nmap <S-CR> O<Esc>
nmap <CR> o<Esc>

" ===========================
" MOVE LINES
" ===========================
nnoremap <C-j> :m +1<CR>
nnoremap <C-k> :m -2<CR>
inoremap <C-j> <Esc>:m +1<CR>gi
inoremap <C-k> <Esc>:m -2<CR>gi

" ===========================
" SYSTEM CLIPBOARD
" ===========================
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>y "+yy
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

" ===========================
" SCROLLING
" ===========================
nmap <leader>d <C-d>
nmap <leader>u <C-u>
vmap <leader>d <C-d>
vmap <leader>u <C-u>

" ===========================
" ACTIONS (via exmap)
" Pengganti <action>() IdeaVim
" ===========================
exmap nextTab obcommand workspace:next-tab
exmap prevTab obcommand workspace:previous-tab
exmap closeTab obcommand workspace:close
exmap search obcommand global-search:open
exmap gotoNextError obcommand obsidian-linter:lint-file
exmap commandPalette obcommand command-palette:open
exmap quickSwitch obcommand switcher:open
exmap dailyNote obcommand daily-notes
exmap graph obcommand graph:open
exmap back obcommand app:go-back
exmap toggleFold obcommand editor:fold-all
exmap unfold obcommand editor:unfold-all

" Map actions ke shortcut
nmap <leader>h :prevTab<CR>
nmap <leader>l :nextTab<CR>
nmap <leader>bd :closeTab<CR>
nmap <leader>/ :search<CR>
nmap <leader>e :gotoNextError<CR>
nmap <leader><leader> :commandPalette<CR>
nmap <leader>o :quickSwitch<CR>
nmap <leader>df :dailyNote<CR>
nmap <leader>g :graph<CR>
nmap <BS> :back<CR>
nmap <leader>tf :toggleFold<CR>
nmap <leader>uf :unfold<CR>

" ===========================
" OBSIDIAN SPECIFIC
" Pengganti NERDTree & fitur IDE
" ===========================
exmap fileExplorer obcommand file-explorer:open
exmap newNote obcommand app:create-new-note
exmap renameFile obcommand workspace:edit-file-title
exmap backlinks obcommand backlink:open
exmap outgoing obcommand outgoing-links:open
exmap template obcommand insert-template

nmap <leader>e :fileExplorer<CR>
nmap <leader>n :newNote<CR>
nmap <leader>r :renameFile<CR>
nmap <leader>b :backlinks<CR>
nmap <leader>tp :template<CR>

" ===========================
" MARKDOWN HELPERS
" ===========================
" Toggle checkbox
exmap toggleCheck obcommand editor:toggle-checklist-status
nmap <leader>x :toggleCheck<CR>

" Bold / italic
nmap <leader>mb viw<Esc>a**<Esc>hbi**<Esc>
nmap <leader>mi viw<Esc>a_<Esc>hbi_<Esc>

" Heading navigation
nmap ]] /^#<CR>
nmap [[ ?^#<CR>

" Awal akhir baris
nmap H ^
nmap L $
vmap H ^
vmap L $
