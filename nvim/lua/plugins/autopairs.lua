-- Auto insert pairs for braces and brackets and whatnot
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = true,
  opts = {
    check_ts = true, -- enable treesitter
    ts_config = {
      lua = { "string" }, -- don't add pairs in lua string treesitter nodes
      javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
      java = false, -- don't check treesitter on java
    },
  },
  -- this is equivalent to setup({}) function
}
