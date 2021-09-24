local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local util = require('lspconfig.util')

-- Check if it's already defined for when reloading this file.
configs.tailwind = {
  default_config = {
    cmd = {'node', vim.g.lsp_servers_dir .. 'tailwindcss-language-server/tailwindServer.js', '--stdio'},
    filetypes = {
      -- html
      'aspnetcorerazor',
      'blade',
      'django-html',
      'edge',
      'ejs',
      'erb',
      'gohtml',
      'haml',
      'handlebars',
      'hbs',
      'html',
      'html-eex',
      'jade',
      'leaf',
      'liquid',
      'markdown',
      'mdx',
      'mustache',
      'njk',
      'nunjucks',
      'php',
      'razor',
      'slim',
      'twig',
      -- css
      'css',
      'less',
      'postcss',
      'sass',
      'scss',
      'stylus',
      'sugarss',
      -- js
      -- 'javascript',
      -- 'typescript',
      'javascriptreact',
      'reason',
      'rescript',
      'typescriptreact',
      -- mixed
      'vue',
      'svelte'
    },
    root_dir = function(fname)
      return util.root_pattern('tailwind.config.js')(fname) or util.root_pattern('package.json', 'jsconfig.json', '.git', 'tsconfig.json')(fname)
    end,
    log_level = vim.lsp.protocol.MessageType.Log,
    -- settings = {},
    settings = {
      tailwindCSS = {
        experimental = {
          classRegex = {
            [[tw`([^`]*)]],
            [[tw\\..+`([^`]*)]],
            [[tw\\(.*?\\).*?`([^`]*)]],
            [[css`([^`]*)]],
            [[css\\..+`([^`]*)]],
            [[css\\(.*?\\).*?`([^`]*)]],
            [[tw`([^`]*)]],
            [[tw=\"([^\"]*)]],
            [[tw={\"([^\"}]*)]],
            [[tw\\.\\w+`([^`]*)]],
            [[tw\\(.*?\\)`([^`]*)]]
          }
        }
      }
    },
    handlers = {
      ['tailwindcss/getConfiguration'] = function(_, _, params, _, bufnr, _)
        -- tailwindcss lang server waits for this response before providing hover
        vim.lsp.buf_notify(bufnr, 'tailwindcss/getConfigurationResponse', {_id = params._id})
      end
    }
  }
}

lspconfig.tailwind.setup({})
