return { "lambdalisue/fern.vim",
  config = function()
    -- Ctrl+nでファイルツリーを表示/非表示する
    vim.keymap.set('n', '<C-n>', ':Fern . -reveal=% -drawer -keep -toggle -width=40<CR>')

    -- 隠しフォルダ表示
    vim.g['fern#default_hidden'] = 1
    -- 表示しないファイル
    vim.g['fern#default_exclude'] = [[^\%(\.git\|.*\.swp\|\.jj\)$]]

    -- 以下、Claude による
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "fern",
      callback = function()
        vim.opt_local.winfixbuf = true
      end,
    })
  end
}
