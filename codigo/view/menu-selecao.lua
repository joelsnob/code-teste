
local widget = require( "widget" )
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local json = require("json")

local salvarLevel = {}
local fileExists = {}
local carregarLevel = {}

local levelAtual

local gameLevel = {
    level = 1,
}

local optionsGame = {
    effect = "fade",
    time = 400,
    params =
    {
        levelGame
    }
}

-- Cria cena de menu de opções
function scene:createScene( event )
    local group = self.view

    if fileExists('level_game.json') then
        print('Não existe')
        local valor = carregarLevel( "level_game" )
        print(valor.level)
        levelAtual = valor.level
    else
        print('Existe arquivo')
        salvarLevel(gameLevel ,"level_game")
        levelAtual = gameLevel.level
    end

    local background = display.newImage("images/background_main.png")

    local jogarBrasilHandler = function( event )
        optionsGame.params.levelGame = 1
        storyboard.gotoScene( "view.game-balloon", optionsGame )
    end

    local jogarEspanhaHandler = function( event )
        optionsGame.params.levelGame = 2
        storyboard.gotoScene( "view.game-balloon", optionsGame )
    end

    local jogarHolandaHandler = function( event )
        optionsGame.params.levelGame = 3
        storyboard.gotoScene( "view.game-balloon", optionsGame )
    end

    local jogarInglaterraHandler = function( event )
        optionsGame.params.levelGame = 4
        storyboard.gotoScene( "view.game-balloon", optionsGame )
    end
    local jogarPortugalHandler = function( event )
        optionsGame.params.levelGame = 5
        storyboard.gotoScene( "view.game-balloon", optionsGame )
    end
    local jogarItaliaHandler = function( event )
        optionsGame.params.levelGame = 6
        storyboard.gotoScene( "view.game-balloon", optionsGame )
    end
    local btnBrasil = display.newImage('images/botao_brasil.png')
    btnBrasil.x = display.contentWidth/2;    btnBrasil.y = (display.contentHeight / 2) - (btnBrasil.height + btnBrasil.height+60)
    btnBrasil:addEventListener('tap', jogarBrasilHandler)

    local btnEspanha
    if levelAtual>=2 then
        btnEspanha = display.newImage('images/botao_espanha_aberto.png')
        btnEspanha:addEventListener('tap', jogarEspanhaHandler)
    else
        btnEspanha = display.newImage('images/botao_espanha.png')
    end
    btnEspanha.x = display.contentWidth/2; btnEspanha.y = 130

    local btnHolanda
    if levelAtual>=3 then
        btnHolanda = display.newImage('images/botao_holanda_aberto.png')
        btnHolanda:addEventListener('tap', jogarHolandaHandler)
    else
        btnHolanda = display.newImage('images/botao_holanda.png')
    end
    btnHolanda.x = display.contentWidth/2;  btnHolanda.y = 200

    local btnInglaterra
    if levelAtual>=4 then
        btnInglaterra = display.newImage('images/botao_inglaterra_aberto.png')
        btnInglaterra:addEventListener('tap', jogarInglaterraHandler)
    else
        btnInglaterra = display.newImage('images/botao_inglaterra.png')
    end
    btnInglaterra.x = display.contentWidth/2; btnInglaterra.y = (display.contentHeight/2) + 38

    local btnPortugal
    if levelAtual>=5 then
        btnPortugal = display.newImage('images/botao_portugal_aberto.png')
        btnPortugal:addEventListener('tap', jogarPortugalHandler)
    else
        btnPortugal = display.newImage('images/botao_portugal.png')
    end
    btnPortugal.x = display.contentWidth/2; btnPortugal.y = (display.contentHeight/2) + 115

    local btnItalia
    if levelAtual>=6 then
        btnItalia = display.newImage('images/botao_italia_aberto.png')
        btnItalia:addEventListener('tap', jogarItaliaHandler)
    else
        btnItalia = display.newImage('images/botao_italia.png')
    end
    btnItalia.x = display.contentWidth/2; btnItalia.y = (display.contentHeight/2) + 190

    group:insert(background)
    group:insert(btnBrasil)
    group:insert(btnEspanha)
    group:insert(btnHolanda)
    group:insert(btnInglaterra)
    group:insert(btnPortugal)
    group:insert(btnItalia)

end

function fileExists(fileName, base)
    assert(fileName, "fileName is missing")
    local base = system.DocumentsDirectory
    local filePath = system.pathForFile( fileName, base )
    local exists = false

    if (filePath) then -- file may exist wont know until you open it
        local fileHandle = io.open( filePath, "r" )
        if (fileHandle) then -- nil if no file found
            exists = true
            io.close(fileHandle)
        end
    end

    return(exists)
end

function salvarLevel( data, pathname ) -- save a table to a file
    local success = false
    local path = system.pathForFile( pathname..".json", system.DocumentsDirectory  ) -- get the file path
    local fileHandle = io.open( path, "w" ) -- open the file
    if fileHandle then -- if it worked write the file
        fileHandle:write( json.encode( data ) ) -- encode the table into JSON, then write it to file
        io.close( fileHandle ) -- close the file
        success = true
    end
    return success --return true if it worked, false otherwise
end

function carregarLevel( pathname ) --load a table from a file, this is just one way to do saves
    local data = nil
    local path = system.pathForFile( pathname..".json", system.DocumentsDirectory ) --get the file path system.DocumentsDirectory
    print( path)
    local fileHandle = io.open( path, "r" ) -- open the file
    if fileHandle then -- if opening the file worked, read the file.
        data = json.decode( fileHandle:read( "*a" ) ) -- decode the JSON into a lua table
        io.close( fileHandle ) -- close the opened file
    end
    return data -- return the loaded table
end

scene:addEventListener( "createScene" )

return scene
