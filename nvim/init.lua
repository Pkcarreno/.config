require('pk.base')
require('pk.highlights')
require('pk.maps')
require('pk.initPlug')

local has = vim.fn.has
-- local is_mac = has "macunix"
local is_win = has "win32"
local is_wsl = has "wsl"

if is_win == 1 then
  require('pk.windows')
end
if is_wsl == 1 then
  require('pk.wsl')
end
