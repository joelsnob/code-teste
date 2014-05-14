
local widget = require( "widget" )
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local options = {
    effect = "fade",
    time = 400,
    params =
    {
        value
    }
}

-- Cria cena de menu de opções
function scene:createScene( event )
    local group = self.view

    local background = display.newImage("images/tela_pause.png")

    local voltarHandler = function( event )
        options.params.value = true
        storyboard.gotoScene( "view.game-balloon", options )
    end

    local menuHandler = function( event )
        storyboard.removeScene("view.game-balloon")
        storyboard.gotoScene( "view.menu", "fade", 400 )
    end

    local btnMenuJogo = display.newImage('images/botao_menu.png', 20, 130)
    btnMenuJogo:addEventListener('tap', menuHandler)

    local btnContinuar = display.newImage('images/botao_continuar.png', 20, 260)
    btnContinuar:addEventListener('tap', voltarHandler)

    group:insert(background)
    group:insert(btnMenuJogo)
    group:insert(btnContinuar)
end

scene:addEventListener( "createScene" )

return scene