--- -------
--- Plugins
--- 
--- -------
local plugins = {
  "nvim-tree/nvim-web-devicons",
  "nvim-tree/nvim-tree.lua",
  {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed, not both.
    "ibhagwan/fzf-lua",              -- optional
  },
  config = true
  }
}

--- -------
--- Plugin Instalation
--- -------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup(plugins)

require("nvim-tree").setup({
	filters = {
		dotfiles = true,
	},
})

require("nvim-tree").setup({
	filters = {
		dotfiles = true,
	},
})

