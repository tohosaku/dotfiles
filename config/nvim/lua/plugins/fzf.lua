return {
  "junegunn/fzf.vim",
  dependencies = {
    "junegunn/fzf"
  },
  config = function()
    ---- fzn.vim
    -- Ctrl+pでファイル検索を開く
    -- git管理されていれば:GFiles、そうでなければ:Filesを実行する
    vim.keymap.set('n', '<C-p>', function()
      local is_git = vim.fn.system('git status')
      if vim.v.shellerror then
        vim.cmd('Files')
      else
        vim.cmd('GFiles')
      end
    end)

    vim.api.nvim_create_user_command('Rg', function(opts)
      -- コマンドの引数 (<q-args>)
      local query = opts.args

      -- ! の有無 (<bang>)
      local bang = opts.bang

      -- rg のベースコマンド
      local command_fmt = 'rg --column --line-number --hidden --ignore-case --no-heading --color=always %s'
      local command = string.format(command_fmt, vim.fn.shellescape(query))

      -- プレビュー設定の作成
      local spec
      if bang then
        -- Rg! の場合: フルスクリーン、プレビューは上部に 60%
        spec = vim.fn['fzf#vim#with_preview']({
          options = { '--delimiter', ':', '--nth', '3..' }
        }, 'up:60%')
      else
        -- Rg の場合: プレビューは右側に 50% (初期状態は非表示)、'?' で切り替え
        spec = vim.fn['fzf#vim#with_preview']({
          options = { '--exact', '--delimiter', ':', '--nth', '3..' }
        }, 'right:50%:hidden', '?')
      end

      -- fzf#vim#grep(command, with_column, [spec], [bang])
      vim.fn['fzf#vim#grep'](command, 1, spec, bang)
    end, {
      bang = true,
      nargs = '*',
      desc = 'FZF Ripgrep with custom preview'
    })
    vim.keymap.set('n', '<C-g>', ':Rg<CR>')
    -- frでカーソル位置の単語をファイル検索する
    vim.keymap.set('n', 'fr', 'vawy:Rg <C-R>"<CR>')
    -- frで選択した単語をファイル検索する
    vim.keymap.set('x', 'fr', 'y:Rg <C-R>"<CR>')
    -- fbでバッファ検索を開く
    vim.keymap.set('n', 'fb', ':Buffers<CR>')
    -- fpでバッファの中で1つ前に開いたファイルを開く
    vim.keymap.set('n', 'fp', ':Buffers<CR><CR>')
    -- flで開いているファイルの文字列検索を開く
    vim.keymap.set('n', 'fl', ':BLines<CR>')
    -- fmでマーク検索を開く
    vim.keymap.set('n', 'fm', ':Marks<CR>')
    -- fhでファイル閲覧履歴検索を開く
    vim.keymap.set('n', 'fh', ':History<CR>')
    -- fcでコミット履歴検索を開く
    vim.keymap.set('n', 'fc', ':Commits<CR>')
  end
}
