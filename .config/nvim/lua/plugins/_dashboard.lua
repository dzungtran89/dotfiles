if vim.fn.PlugLoaded('dashboard-nvim') ~=1 then
  return
end

local db = require('dashboard')

db.custom_header = {
'                        _ooOoo_                             ',
'                       o8888888o                            ',
'                       88\" . \"88                            ',
'                       (| -_- |)                            ',
'                       O\\  =  /O                            ',
'                    ____/`---\'\\____                         ',
'                  .\'  \\\\|     |//  `.                       ',
'                 /  \\\\|||  :  |||//  \\                      ',
'                /  _||||| -:- |||||_  \\                     ',
'                |   | \\\\\\  -  /\'| |   |                     ',
'                | \\_|  `\\`---\'//  |_/ |                     ',
'                \\  .-\\__ `-. -\'__/-.  /                     ',
'              ___`. .\'  /--.--\\  `. .\'___                   ',
'           .\"\" \'<  `.___\\_<|>_/___.\' _> \\\"\".                ',
'          | | :  `- \\`. ;`. _/; .\'/ /  .\' ; |               ',
'          \\  \\ `-.   \\_\\_`. _.\'_/_/  -\' _.\' /               ',
'===========`-.`___`-.__\\ \\___  /__.-\'_.\'_.-\'================     ',
'                       `=--=-\'                               ',
'',
}

db.custom_center = {
  {icon = '  ',
    desc = 'Recently latest session                ',
    shortcut = 'SPC q o',
    action ='SessionLoad'},
  {icon = '  ',
    desc = 'Find Files                             ',
    shortcut = 'SPC e f'},
}

db.session_directory = '~/.config/nvim/sessions'
