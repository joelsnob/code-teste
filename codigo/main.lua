
-- hide device status bar
display.setStatusBar( display.HiddenStatusBar )

-- require controller module
local storyboard = require "storyboard"

-- load first scene
storyboard.gotoScene( "view.splash-screen", "fade", 400 )