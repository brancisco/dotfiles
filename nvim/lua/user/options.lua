options = {
  number = true,
  relativenumber = true,

  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  expandtab = true,

  smartindent = true,

  wrap = false,

  swapfile = false,
  backup = false,
  undodir = os.getenv("HOME") .. "/.vim/undodir",
  undofile = true,

  hlsearch = false,
  incsearch = true,

  termguicolors = true,

  scrolloff = 8,
  signcolumn = "yes",

  updatetime = 1000,

  colorcolumn = "80",
}

vim.g.mapleader = ' ' 

for name, value in pairs(options) do
  vim.opt[name] = value
end
