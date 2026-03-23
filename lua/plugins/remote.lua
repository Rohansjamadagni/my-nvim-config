-- Remote editing via local-first sync
return {
  {
    "rohansjamadagni/nvim-client-render",
    lazy = false,
    opts = {},
    cmd = { "RemoteOpen", "RemoteStatus", "RemoteSync", "RemoteDisconnect", "RemoteRetry" },
  },
}
