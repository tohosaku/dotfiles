function setup(config)
  config.action("open-file", function()
    local file = context.file()
    if not file then
        flash("No file selected")
        return
    end
    -- or your editor
    exec_shell("rvim " .. file)
  end, {
    desc = "Open File",
    key  = "O",
    scope = "revisions.details",
  })
end
