
local widget = require( "widget" )
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local jog1
local jog2
local jog3
local jog4
local jog5
local jog6
local jog7
local jog8
local jog9
local jog10
local jog11

local gameLevel = {
    level,
}

local levelAtual

local json = require("json")

local salvarLevel = {}
local fileExists = {}
local carregarLevel = {}
local menuSucessoHandler = {}
local prosseguirJogoHandler = {}

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
    local jogadores = event.params.value

    local background = display.newImage("images/background_main.png")

    if jogadores[1] then
        jog1 = display.newImage(jogadores[1], 140, 2)
    else
        jog1 = display.newImage('images/balao_not.png', 140, 2)
    end

    if jogadores[2] then
        jog2 = display.newImage(jogadores[2], 80, 50)
    else
        jog2 = display.newImage('images/balao_not.png', 80, 50)
    end

    if jogadores[3] then
        jog3 = display.newImage(jogadores[3], 208, 50)
    else
        jog3 = display.newImage('images/balao_not.png', 208, 50)
    end

    if jogadores[4] then
        jog4 = display.newImage(jogadores[4], 18, 90)
    else
        jog4 = display.newImage('images/balao_not.png', 18, 90)
    end

    if jogadores[5] then
        jog5 = display.newImage(jogadores[5], 268, 90)
    else
       jog5 = display.newImage('images/balao_not.png', 268, 90)
    end

    if jogadores[6] then
        jog6 = display.newImage(jogadores[6], 88, 170)
    else
        jog6 = display.newImage('images/balao_not.png', 88, 170)
    end

    if jogadores[7] then
        jog7 = display.newImage(jogadores[7], 198, 170)
    else
        jog7 = display.newImage('images/balao_not.png', 198, 170)
     end

    if jogadores[8] then
        jog8 = display.newImage(jogadores[8], 30, 250)
    else
        jog8 = display.newImage('images/balao_not.png', 198, 170)
    end

    if jogadores[9] then
        jog9 = display.newImage(jogadores[9], 248, 250)
    else
        jog9 = display.newImage('images/balao_not.png', 248, 250)
    end

    if jogadores[10] then
        jog10 = display.newImage(jogadores[10], 80, 340)
    else
        jog10 = display.newImage('images/balao_not.png', 80, 340)
    end

    if jogadores[11] then
        jog11 = display.newImage(jogadores[11], 208, 340)
    else
        jog11 = display.newImage('images/balao_not.png', 208, 340)
    end

    local btnProsseguir = display.newImage('images/botao_prosseguir.png', 165, 415)
    btnProsseguir:addEventListener('tap', prosseguirJogoHandler)

    local btnSucessoMenu = display.newImage('images/botao_menu_sucesso.png', 5, 415)
    btnSucessoMenu:addEventListener('tap', menuSucessoHandler)

    group:insert(background)
    group:insert(jog1)
    group:insert(jog2)
    group:insert(jog3)
    group:insert(jog4)
    group:insert(jog5)
    group:insert(jog6)
    group:insert(jog7)
    group:insert(jog8)
    group:insert(jog9)
    group:insert(jog10)
    group:insert(jog11)
    group:insert(btnProsseguir)
    group:insert(btnSucessoMenu)
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

function menuSucessoHandler( event )
    local valor = carregarLevel( "level_game" )

    levelAtual = valor.level

    gameLevel.level = levelAtual + 1

    salvarLevel(gameLevel ,"level_game")

    storyboard.gotoScene( "view.menu", "fade", 400 )
    storyboard.removeScene("view.game-sucesso")
    storyboard.removeScene("view.menu-selecao")
end

function prosseguirJogoHandler()
    local valor = carregarLevel( "level_game" )

    levelAtual = valor.level
    levelAtual = levelAtual + 1
    gameLevel.level = levelAtual

    salvarLevel(gameLevel ,"level_game")
    optionsGame.params.levelGame = levelAtual
    storyboard.gotoScene("view.game-balloon", optionsGame)
    storyboard.removeScene("view.game-sucesso")
    storyboard.removeScene("view.menu-selecao")
end

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene" )

return scene
