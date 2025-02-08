require('awful.autofocus')

require('error-handler').setup()
require('theme').setup()
require('tag-layout').setup()
require('keybindings').setup()
require('statusbar').setup()
require('signals').setup()
require('rules').setup()
require('notification').setup()

require('awful').spawn('setwal')
