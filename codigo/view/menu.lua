
local widget = require( "widget" )
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Cria cena de menu de opções
function scene:createScene( event )
    local group = self.view

    local background = display.newImage("images/background_main.png")

    local jogarHandler = function( event )
        storyboard.gotoScene( "view.menu-selecao", "fade", 400 )
    end

    local tutorialHandler = function( event )
        storyboard.gotoScene( "view.tutorial", "fade", 400 )
    end

    local creditosHandler = function( event )
        storyboard.gotoScene( "view.creditos", "fade", 400 )
    end

    local btnJogar = widget.newButton
    {
        id = "btnJogar",
        defaultFile = "images/botao_jogar.png",
        overFile = "images/botao_jogar.png",
        emboss = true,
        onEvent = jogarHandler,
    }

    local btnTutorial = widget.newButton
    {
        id = "btnTutorial",
        defaultFile = "images/botao_tutorial.png",
        overFile = "images/botao_tutorial.png",
        emboss = true,
        onEvent = tutorialHandler,
    }

    local btnCreditos = widget.newButton
    {
        id = "btnCreditos",
        defaultFile = "images/botao_credito.png",
        overFile = "images/botao_credito.png",
        emboss = true,
        onEvent = creditosHandler,
    }

    btnJogar.x = display.contentWidth/2;    btnJogar.y = (display.contentHeight / 2) - btnTutorial.height + 10
    btnTutorial.x = display.contentWidth/2; btnTutorial.y = display.contentHeight/2 + 20
    btnCreditos.x = display.contentWidth/2; btnCreditos.y = display.contentHeight/2 + btnCreditos.height + 30

    group:insert(background)
    group:insert(btnJogar)
    group:insert(btnTutorial)
    group:insert(btnCreditos)

end

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene" )

return scene
