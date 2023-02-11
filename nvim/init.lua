require('pk.base')
require('pk.highlights')
require('pk.maps')
require('pk.initPlug')

local has = vim.fn.has
-- local is_mac = has "macunix"
local is_win = has "win32"

if is_win then
  require('pk.windows')
end
