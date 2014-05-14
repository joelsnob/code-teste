
local widget = require( "widget" )
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Cria cena de menu de opções
function scene:createScene( event )
    local group = self.view

    local background = display.newImage("images/tela_fim_de_jogo.png")

    local fimJogoHandler = function( event )
        storyboard.gotoScene( "view.menu", "fade", 400 )
    end

    local btnFimJogo = display.newImage('images/botao_retornar_menu.png', 20, display.contentHeight - 100)
    btnFimJogo:addEventListener('tap', fimJogoHandler)

    group:insert(background)
    group:insert(btnFimJogo)
end

scene:addEventListener( "createScene" )

return scene