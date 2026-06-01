vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = { 'ucs-bom', 'utf-8', 'iso-2022-jp', 'euc-jp', 'cp932' }
vim.opt.fileformat = 'unix'
vim.opt.fileformats = { 'unix', 'dos' }
vim.opt.ambiwidth = 'double'
vim.opt.listchars = { tab = ':>' , trail = '⋅' }
vim.opt.list = true
vim.opt.smartindent = true

vim.opt.laststatus = 2
-- vim.opt.statusline = "%f %{'['.(&fenc!=''?&fenc:&enc).','.&ff.']'}%m%r%h%w%=%l,%2v%6P"

vim.opt.tabstop = 2       -- <tab>1文字分の幅を半角2文字分に設定
vim.opt.shiftwidth = 2    -- インデントをスペース2つずつに設定
vim.opt.expandtab = true  -- <tab>文字を使わず全てスペースで記述
vim.opt.autoindent = true -- 新しい行を入力するときに自動的にインデント

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, 'lineNr', { ctermfg = 8 })
    vim.api.nvim_set_hl(0, 'NonText', { ctermbg = 'None' })
  end
  })
vim.cmd.colorscheme('desert')

-- syntax on
vim.cmd.highlight({'JpSpace', 'term=underline ctermbg=238'})
vim.api.nvim_create_autocmd({'BufRead', 'BufNew'}, {
  pattern = '*',
  callback = function()
    vim.cmd.match('JpSpace /　/')
  end
})

vim.opt.wrap = false
vim.opt.compatible = false

vim.cmd('filetype on')
vim.cmd('filetype indent on')
vim.cmd('filetype plugin on')
vim.keymap.set('', '<C-l>', ':tabnext<CR>')
vim.keymap.set('', '<C-h>', ':tabprevious<CR>')

vim.g.mapleader = ","

vim.keymap.set('n', '<Leader>a', ':echo "Hello"<CR>')
vim.opt.number = true
-- set cursorline
-- hi clear CursorLine

-- """""""""""
-- " QuickFix
-- """""""""""
-- " 前へ
vim.keymap.set('n', '[q', ':cprevious<CR>')
-- " 次へ
vim.keymap.set('n', ']q', ':cnext<CR>')
-- " 最初へ
vim.keymap.set('n', '[Q', ':<C-u>cfirst<CR>')
-- " 最後へ
vim.keymap.set('n', ']Q', ':<C-u>clast<CR>')

-- """"""""""
-- " ripgrep
-- """"""""""
if vim.fn.executable('rg') == 1 then
  vim.opt.grepprg = 'rg --vimgrep --hidden -g "!.git/"'
  vim.opt.grepformat = '%f:%l:%c:%m'
end

vim.opt.laststatus = 2
vim.opt.statusline = '%F%m%r%h%w [POS=%04l,%04v] [%p%%] [LEN=%L]'
--[[

" Ctrl+gで文字列検索を開く
" <S-?>でプレビューを表示/非表示する
"command! -bang -nargs=* Rg
"\ call fzf#vim#grep(
"\ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
"\ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}, 'up:60%')
"\ : fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
"\ <bang>0)
"vim.keymap.set('n', '<C-g> :Rg<CR>
"
"vim.keymap.set('n', 'fr vawy:Rg <C-R>"<CR>
"xnoremap fr y:Rg <C-R>"<CR>

" execute "set statusline +=" . gitBranch
]]--

require('config.lazy')
