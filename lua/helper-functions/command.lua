local helpers = {}

helpers.wrap_to_command = function(arr)
  for k, v in pairs(arr) do vim.api.nvim_command('command!' .. v[1] .. ' ' .. v[2]) end
end

return helpers
