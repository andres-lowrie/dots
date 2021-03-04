autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'metals',
      \ 'cmd': ['metals'],
      \ 'allowlist': ['scala', 'sbt'],
      \})

let b:ale_fixers = ['scalafmt']
