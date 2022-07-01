-- delete all the stuff after a word. Useful for creating columns of text:
--   for example:
--     foo fadf adf adfdfaf      
--     bar        
--
--   you can select all of it and do `:normal @e` and you'll get
--     foo
--     bar
vim.fn.setreg('e', 'elDj^')
