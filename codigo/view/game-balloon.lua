
local widget = require( "widget" )
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Generate Physics Engine
local physics = require("physics")

local pause

local popSound = audio.loadStream("audio/pop.wav")

local level = 1

local vida = 3;

local v1
local v2
local v3

local contador = 33

local tempo
local labelTempo

-- 3. Find device display height and width
local largura = display.contentWidth;
local altura = display.contentHeight;

-- 10. Generate math equation for randomization
local random = math.random;

local showGameBar = {}
local criaFronteiraGame = {}
local criaBalaoGame = {}
local removeBalao = {}
local pausarGame = {}
local gerarBaloesRandom = {}
local gameOver = {}
local onTouchBalao = {}
local gameSucesso = {}
local retornarBalao = {}
local controlarVida = {}
local baloesAcertos = {}

local contadorTimeCorrente = 0;
local contadorBalaoAcerto = 0

local timeSelecionado
local jogadoresSelecionado

local optionsSucesso = {
    effect = "fade",
    time = 400,
    params =
    {
        value,
        level
    }
}

local brasil = {
    { codigo = 1,  balao = "images/selecao/brasil/1.png" },
    { codigo = 2,  balao = "images/selecao/brasil/2.png"},
    { codigo = 3,  balao = "images/selecao/brasil/3.png" },
    { codigo = 4,  balao = "images/selecao/brasil/4.png" },
    { codigo = 5,  balao = "images/selecao/brasil/5.png" },
    { codigo = 6,  balao = "images/selecao/brasil/6.png" },
    { codigo = 7,  balao = "images/selecao/brasil/7.png" },
    { codigo = 8,  balao = "images/selecao/brasil/8.png" },
    { codigo = 9,  balao = "images/selecao/brasil/9.png" },
    { codigo = 10, balao = "images/selecao/brasil/10.png" },
    { codigo = 11, balao = "images/selecao/brasil/11.png" }
}

local espanha = {
    { codigo = 1,  balao = "images/selecao/espanha/1.png" },
    { codigo = 2,  balao = "images/selecao/espanha/2.png"},
    { codigo = 3,  balao = "images/selecao/espanha/3.png" },
    { codigo = 4,  balao = "images/selecao/espanha/4.png" },
    { codigo = 5,  balao = "images/selecao/espanha/5.png" },
    { codigo = 6,  balao = "images/selecao/espanha/6.png" },
    { codigo = 7,  balao = "images/selecao/espanha/7.png" },
    { codigo = 8,  balao = "images/selecao/espanha/8.png" },
    { codigo = 9,  balao = "images/selecao/espanha/9.png" },
    { codigo = 10, balao = "images/selecao/espanha/10.png" },
    { codigo = 11, balao = "images/selecao/espanha/11.png" }
}

local holanda = {
    { codigo = 1,  balao = "images/selecao/holanda/1.png" },
    { codigo = 2,  balao = "images/selecao/holanda/2.png"},
    { codigo = 3,  balao = "images/selecao/holanda/3.png" },
    { codigo = 4,  balao = "images/selecao/holanda/4.png" },
    { codigo = 5,  balao = "images/selecao/holanda/5.png" },
    { codigo = 6,  balao = "images/selecao/holanda/6.png" },
    { codigo = 7,  balao = "images/selecao/holanda/7.png" },
    { codigo = 8,  balao = "images/selecao/holanda/8.png" },
    { codigo = 9,  balao = "images/selecao/holanda/9.png" },
    { codigo = 10, balao = "images/selecao/holanda/10.png" },
    { codigo = 11, balao = "images/selecao/holanda/11.png" }
}

local inglaterra = {
    { codigo = 1,  balao = "images/selecao/inglaterra/1.png" },
    { codigo = 2,  balao = "images/selecao/inglaterra/2.png"},
    { codigo = 3,  balao = "images/selecao/inglaterra/3.png" },
    { codigo = 4,  balao = "images/selecao/inglaterra/4.png" },
    { codigo = 5,  balao = "images/selecao/inglaterra/5.png" },
    { codigo = 6,  balao = "images/selecao/inglaterra/6.png" },
    { codigo = 7,  balao = "images/selecao/inglaterra/7.png" },
    { codigo = 8,  balao = "images/selecao/inglaterra/8.png" },
    { codigo = 9,  balao = "images/selecao/inglaterra/9.png" },
    { codigo = 10, balao = "images/selecao/inglaterra/10.png" },
    { codigo = 11, balao = "images/selecao/inglaterra/11.png" }
}

local portugal = {
    { codigo = 1,  balao = "images/selecao/portugal/1.png" },
    { codigo = 2,  balao = "images/selecao/portugal/2.png"},
    { codigo = 3,  balao = "images/selecao/portugal/3.png" },
    { codigo = 4,  balao = "images/selecao/portugal/4.png" },
    { codigo = 5,  balao = "images/selecao/portugal/5.png" },
    { codigo = 6,  balao = "images/selecao/portugal/6.png" },
    { codigo = 7,  balao = "images/selecao/portugal/7.png" },
    { codigo = 8,  balao = "images/selecao/portugal/8.png" },
    { codigo = 9,  balao = "images/selecao/portugal/9.png" },
    { codigo = 10, balao = "images/selecao/portugal/10.png" },
    { codigo = 11, balao = "images/selecao/portugal/11.png" }
}

local italia = {
    { codigo = 1,  balao = "images/selecao/italia/1.png" },
    { codigo = 2,  balao = "images/selecao/italia/2.png"},
    { codigo = 3,  balao = "images/selecao/italia/3.png" },
    { codigo = 4,  balao = "images/selecao/italia/4.png" },
    { codigo = 5,  balao = "images/selecao/italia/5.png" },
    { codigo = 6,  balao = "images/selecao/italia/6.png" },
    { codigo = 7,  balao = "images/selecao/italia/7.png" },
    { codigo = 8,  balao = "images/selecao/italia/8.png" },
    { codigo = 9,  balao = "images/selecao/italia/9.png" },
    { codigo = 10, balao = "images/selecao/italia/10.png" },
    { codigo = 11, balao = "images/selecao/italia/11.png" }
}

local group

-- Cria cena de menu de opções
function scene:createScene( event )
    group = self.view
    local params = event.params

    if params then
        if params.levelGame then
            level = params.levelGame
            print('Carregou level do arquivo')
        end
    end

    if(level == 1)then
        timeSelecionado = 'brasil'
        jogadoresSelecionado = brasil
    end
    if(level == 2)then
        timeSelecionado = 'espanha'
        jogadoresSelecionado = espanha
    end
    if(level == 3)then
        timeSelecionado = 'holanda'
        jogadoresSelecionado = holanda
    end
    if(level == 4)then
        timeSelecionado = 'inglaterra'
        jogadoresSelecionado = inglaterra
    end
    if(level == 5)then
        timeSelecionado = 'portugal'
        jogadoresSelecionado = portugal
    end
    if(level == 6)then
        timeSelecionado = 'italia'
        jogadoresSelecionado = italia
    end

    -- 1. Enable drawing mode for testing, you can use "normal", "debug" or "hybrid"
    physics.setDrawMode("normal")

    -- 2. Enable multitouch so more than 1 balloon can be touched at a time
    --system.activate("multitouch");

    -- 1. Start the physics engine
    physics.start()

    -- 2. Set gravity to be inverted
    physics.setGravity(0, -0.4)

    criaFronteiraGame(group)

    showGameBar(group)
end

-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
    local group = self.view
end

function retornarBalao()
    timer.resume( tempo )
    physics.start()
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    local group = self.view

    if event.params then
        if event.params.value then
            print('passou passou')
            retornarBalao()
        end
    end
end

function removeBalao(balao)
    balao.isVisible = false
    display.remove(balao)
    balao = nil
end

function onTouchBalao(event)
    local bal = event.target
    bal.isVisible = false

    removeBalao(bal)

    if(bal.name == timeSelecionado) then
        contadorBalaoAcerto = contadorBalaoAcerto + 1
        baloesAcertos[contadorBalaoAcerto] = bal.caminho
    else
        print('errou')
        vida = vida - 1

        if vida == 2 then
            v1 = display.newImage('images/bola_errada.png', display.contentWidth - 40, 5)
            group:insert(v1)
        elseif vida == 1 then
            v2 = display.newImage('images/bola_errada.png', display.contentWidth - 80, 5)
            group:insert(v2)
        else
            v3 = display.newImage('images/bola_errada.png', display.contentWidth - 120, 5)
            group:insert(v3)
            gameOver()
        end
    end
end

function controlarVida(bal)
    if(bal.name == timeSelecionado) then
        baloesAcertos[contadorTimeCorrente] = bal
    else
        print('errou')
        vida = vida - 1

        if vida == 2 then
            v1 = display.newImage('images/bola_errada.png', display.contentWidth - 40, 5)
            group:insert(v1)
        elseif vida == 1 then
            v2 = display.newImage('images/bola_errada.png', display.contentWidth - 80, 5)
            group:insert(v2)
        else
            v3 = display.newImage('images/bola_errada.png', display.contentWidth - 120, 5)
            group:insert(v3)
            gameOver()
        end
    end
end

function criaBalaoGame(group, imagem, selecao)
    local balao = display.newImageRect(imagem, 50, 50);
    balao.caminho = imagem
    balao.name = selecao
    -- 4. Set the reference point to the center of the image

    balao:setReferencePoint(display.CenterReferencePoint);
    -- 5. Generate balloons randomly on the X-coordinate
    balao.x = random(50, largura-50);

    balao.y = random(altura-100, altura);

    -- 7. Apply physics engine to the balloons, set density, friction, bounce and radius
    physics.addBody(balao, "dynamic", {density=0.1, friction=0.0, bounce=0.9, radius=25});

    balao:addEventListener( 'collision', balao)
    balao:addEventListener("touch", onTouchBalao)

    function balao:collision(event)
        local bal = event.target
        if event.other.name == 'topGame' then
            removeBalao(bal)
            audio.play(popSound)
        end
    end

    group:insert(balao)
end

function criaFronteiraGame(group)
    --> cria as paredes para limitar o espaço dos baloes
    local lefWall = display.newRect( 0, 0, 1, display.contentHeight)
    local rightWall = display.newRect(display.contentWidth,0,1, display.contentHeight)
    local celling = display.newRect(0 ,38, display.contentWidth, 1)
    celling.name = 'topGame'

    --> torna as paredes em corpos fisicos
    physics.addBody(lefWall, "static", {bounce = 0.1 })
    physics.addBody(rightWall, "static", {bounce = 0.1 })
    physics.addBody(celling, "static", {bounce = 0.1 })

    group:insert(lefWall)
    group:insert(rightWall)
    group:insert(celling)
end

function pausarGame()
    physics.pause()
    timer.pause( tempo )
    storyboard.gotoScene( "view.pause-game", "fade", 400 )
end

function gerarBaloesRandom(group)
    if contador % 3 == 0 then
        contadorTimeCorrente = contadorTimeCorrente + 1
        criaBalaoGame(group, jogadoresSelecionado[contadorTimeCorrente].balao, timeSelecionado)
    end
    if(level~=2)then
        local posJogador = random(1, 11)
        criaBalaoGame(group, espanha[posJogador].balao, 'espanha')
    else
        local posJogador = random(1, 11)
        criaBalaoGame(group, brasil[posJogador].balao, 'brasil')
    end
end

function gameOver()
    timer.cancel(tempo)
    storyboard.gotoScene( "view.game-over", "fade", 400 )
    storyboard.removeScene("view.game-balloon")
end

function gameSucesso()
    timer.cancel(tempo)
    optionsSucesso.params.value = baloesAcertos
    optionsSucesso.params.level = level

    storyboard.gotoScene( "view.game-sucesso", optionsSucesso )
    storyboard.removeScene("view.game-balloon")
end

function showGameBar(group)
    local background = display.newImage("images/background_main.png")

    local v1 = display.newImage('images/bola.png', display.contentWidth - 40, 5)
    local v2 = display.newImage('images/bola.png', display.contentWidth - 80, 5)
    local v3 = display.newImage('images/bola.png', display.contentWidth - 120, 5)

    labelTempo = display.newText( 'TIME - 0.30', 10, 10, native.systemFont, 20 )
    labelTempo:setTextColor( 255, 255, 0 ) -- Cor do texto (RGB)

    pause = display.newImage("images/imagen_pause.png", labelTempo.contentWidth + 20, 6)
    pause:addEventListener('tap', pausarGame)

    -- Função que incrementa o contador de 1 em 1 e mostra ele no texto
    local function executaTime()
        contador = contador - 1 -- Incrementa o contador
        if contador >= 0 then
            gerarBaloesRandom(group)
            labelTempo.text = 'TIME - 0.' .. tostring(contador) -- Mostra o contador no Texto
        else
            if contadorBalaoAcerto < 8 then
                gameOver()
            else
                gameSucesso()
            end
        end
    end

    -- Timer que chama a função a cada 1 segundo
    -- Parâmetros ( Delay em milisegundos, Função que irá chamar, Quantidade de vezes que irá chamar )
    tempo = timer.performWithDelay( 1000, executaTime, -1 )

    group:insert(background)
    group:insert(v1)
    group:insert(v2)
    group:insert(v3)
    group:insert(labelTempo)
    group:insert(pause)
end

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene" )

-- "willEnterScene" event is dispatched before scene transition begins
scene:addEventListener( "willEnterScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

return scene