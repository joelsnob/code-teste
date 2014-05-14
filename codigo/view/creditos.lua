
local widget = require( "widget" )
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Cria cena de menu de opções
function scene:createScene( event )
    local group = self.view

    local background = display.newImage("images/tela_creditos.png")

    local menuHandler = function( event )
        storyboard.gotoScene( "view.menu", "fade", 400 )
    end

    local btnMenu = widget.newButton
        {
            id = "btnMenu",
            defaultFile = "images/botao_menu.png",
            overFile = "images/botao_menu.png",
            emboss = true,
            onEvent = menuHandler,
        }

    btnMenu.x = display.contentWidth/2; btnMenu.y = display.contentHeight - 45

    group:insert(background)
    group:insert(btnMenu)

end


-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
    local group = self.view
    print('passando willEnterScene ')

end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    local group = self.view
    print('passando enterScene ')
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
    local group = self.view
    print('passando exitScene ')
end


-- Called AFTER scene has finished moving offscreen:
function scene:didExitScene( event )
    local group = self.view
    print('passando didExitScene ')
    -----------------------------------------------------------------------------

    --      This event requires build 2012.782 or later.

    -----------------------------------------------------------------------------

end

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene" )

-- "willEnterScene" event is dispatched before scene transition begins
scene:addEventListener( "willEnterScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "didExitScene" event is dispatched after scene has finished transitioning out
scene:addEventListener( "didExitScene", scene )

return scene