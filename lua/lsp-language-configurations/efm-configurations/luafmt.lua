-- https://github.com/luarocks/luarocks/wiki/installation-instructions-for-unix
-- luarocks install --server=https://luarocks.org/dev luaformatter
return {formatCommand = 'lua-format -i -c ~/.config/nvim/utils/linter-config/luaformat.yml', formatStdin = true}
