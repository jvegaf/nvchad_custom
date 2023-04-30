
local host = vim.loop.os_uname().sysname

if host == 'Linux' then
  require('custom.linux')
  return
end

require('custom.windows')
