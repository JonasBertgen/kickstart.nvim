function Open_file()
  local directory = os.date '%Y_%m'
  local file = os.date '%d_%m'
  local full_file = (directory .. '/' .. file .. '.txt')
  vim.cmd 'bd'
  vim.cmd('e ' .. full_file)
end

function Set_up_tagebuch()
  vim.fn.chdir '/home/tace/neovim_plugins/'
  Open_file()
  vim.cmd 'ZenMode'
  vim.cmd 'set spelllang=de'
  vim.cmd 'set spell'
end

return {
  'nvim-lua/plenary.nvim', -- needed
  name = 'tagebuch',
  config = function()
    vim.api.nvim_create_user_command('Tagebuch', function()
      Set_up_tagebuch()
    end, {})
  end,
}
