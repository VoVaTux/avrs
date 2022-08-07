local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-orgmode/orgmode'
Plug 'beardedfoo/vim-colemak'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

vim.call('plug#end')

require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via ``disable`` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/Dropbox/org/refile.org',
})

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

require('lualine').setup {}

require('orgmode').setup({
  org_custom_exports = {
    f = {
      label = 'Export to HTML+Pandoc',
      action = function(exporter)
        local current_file = vim.api.nvim_buf_get_name(0)
        local target = vim.fn.fnamemodify(current_file, ':p:r')..'.html'
        local command = {'pandoc', current_file, '-o', target}
        local on_success = function(output)
          print('Success!')
          vim.api.nvim_echo({{ table.concat(output, '\n') }}, true, {})
        end
        local on_error = function(err)
          print('Error!')
          vim.api.nvim_echo({{ table.concat(err, '\n'), 'ErrorMsg' }}, true, {})
        end
        return exporter(command , target, on_success, on_error)
      end
    }
  }
})


