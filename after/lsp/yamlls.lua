local kubeschema = require("kubeschema")

return {
  on_attach = function(client, bufnr)
    kubeschema.on_attach(client, bufnr)
  end,
}
