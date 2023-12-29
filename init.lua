-- Configure for gui
if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    vim.o.guifont = "JetBrainsMono Nerd Font:h10"
    vim.opt.linespace = 3
    vim.g.neovide_scroll_animation_length = 0
    vim.g.neovide_cursor_vfx_mode = "torpedo"
    vim.g.neovide_cursor_vfx_particle_speed = 10.0
end

-- Configure for Nvy
if vim.g.nvy then
    -- Put anything you want to happen only in Neovide here
    vim.o.guifont = "JetBrainsMono Nerd Font:h16"
    vim.opt.linespace = 3
end

-- disable wrap
vim.opt.wrap = false

-- Set the shell to PowerShell
vim.o.shell = "pwsh.exe"

-- Set the shell command flag to "-command"
vim.o.shellcmdflag = "-command"

-- Set the shell quote to "\""
vim.o.shellquote = "\\\""

-- Set the shell external quote to an empty string
vim.o.shellxquote = ""

-- set columns limitations
vim.opt.colorcolumn = "120"

-- disable virtual_text
vim.diagnostic.config({
  signs = true, -- Disable diagnostic signs in the gutter
  underline = true,
  virtual_text = true,})

-- autoread
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})


