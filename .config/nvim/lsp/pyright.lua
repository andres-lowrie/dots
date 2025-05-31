return {
  cmd = { "pyright" },
  filetypes = { "python" },
  root_markers = {
    ".git",
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "venv"
  },
  settings = {
    logLevel = "debug",
    pyright = {
      disableOrganizeImports = true
    },
  },
}
