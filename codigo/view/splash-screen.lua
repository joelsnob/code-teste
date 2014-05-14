
local widget = require( "widget" )
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- create a constant for the left spacing of the row content
local LEFT_PADDING = 10

-- Our scene
function scene:createScene( event )
    local group = self.view
    local title = display.newImage("images/tela_splash.png")

    local loadMenu = function()
        title = nil
        storyboard.gotoScene( "view.menu", "fade", 400 )
    end

    local initVars = function ()
        group:insert(title)

        title.x = 160
        title.y = 200

        timer.performWithDelay(2000, loadMenu)
    end

    initVars()

end

scene:addEventListener( "createScene" )

return scene