vim.cmd [[
try
  let g:nord_italic = 1
  colorscheme nord
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
