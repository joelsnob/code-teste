
local widget = require( "widget" )
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Cria cena de menu de opções
function scene:createScene( event )
    local group = self.view

    local background = display.newImage("images/tela_tutorial.png")

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

    btnMenu.x = display.contentWidth/2; btnMenu.y = display.contentHeight - 50

    group:insert(background)
    group:insert(btnMenu)


end

scene:addEventListener( "createScene" )

return scene