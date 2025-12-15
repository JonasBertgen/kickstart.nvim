-- todo: Write first Line with weekday and current date

function Open_file()
  local directory = os.date '%Y_%m'
  local file = os.date '%d_%m'
  local full_file = (directory .. '/' .. file .. '.txt')
  vim.cmd 'bd'
  vim.cmd('e ' .. full_file)
end

function Write_first_line()
  vim.api.nvim_input('i' .. 'hello world' .. 'jjojj')
end

function Change_sway_lang_to_german()
  os.execute 'swaymsg input type:keyboard xkb_layout "de"'
end

function Set_up_tagebuch()
  vim.fn.chdir '/home/tace/neovim_plugins/'
  local language = os.execute 'swaymsg -t get_inputs | grep -m1 "xkb_active_layout_name"'
  Open_file()
  vim.cmd 'ZenMode'
  vim.cmd 'set spelllang=de'
  Change_sway_lang_to_german()
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
