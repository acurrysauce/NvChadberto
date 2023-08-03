--[[
M is a dictionary of key bindings organized by plugin.
{} can be either a dictionary or an array - it just depends how you use it.
Keys within a dictionary can be accessed with "." i.e. M.dap -> M['dap']

M = {
  plugin_1 = {
    key_bind_1 = {
      mapping_1,
      mapping_des_1
    }
  },
  plugin 2 = {...}
}
--]]

local M = {}

M.dap = {
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>", --> :DapToggleBreakpoint <Enter>
      "Toggle breakpoint"
    },
    ["<leader>dus"] = {
      function()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require('crates').update_all_crates()
      end,
      "update crates",
    }
  }
}

 return M

