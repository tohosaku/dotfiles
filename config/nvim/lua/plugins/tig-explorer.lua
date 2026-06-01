return { "iberianpig/tig-explorer.vim",
  config = function()
    -- tig-explorer
    -- open tig with current file
    vim.keymap.set('n', '<Leader>T', ':TigOpenCurrentFile<CR>')

    -- open tig with Project root path
    vim.keymap.set('n', '<Leader>t', ':TigOpenProjectRootDir<CR>')

    -- open tig grep
    vim.keymap.set('n', '<Leader>g', ':TigGrep<CR>')

    -- resume from last grep
    vim.keymap.set('n', '<Leader>r', ':TigGrepResume<CR>')

    -- open tig grep with the selected word
    vim.keymap.set('v', '<Leader>g', 'y:TigGrep<Space><C-R>"<CR>')

    -- open tig grep with the word under the cursor
    vim.keymap.set('n', '<Leader>cg', ':<C-u>:TigGrep<Space><C-R><C-W><CR>')

    -- open tig blame with current file
    vim.keymap.set('n', '<Leader>b', ':TigBlame<CR>')
  end
}
