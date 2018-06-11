-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--Texto do Jogo

jogador = " "
placarX=0
placarO=0
quantidadaJogadas = 0 


tabuleiroJogadas = {{" "," "," "},
			       {" "," "," "},
                   {" "," "," "}}

function inicioJogo()

    limparRetangulo = display.newRect(100,230,410,280)
    limparRetangulo.strokeWidth = 0 
    limparRetangulo:setFillColor( 0 )
    limparRetangulo:setStrokeColor(0 , 0 ,0 )

    limparPontuacao = display.newRect(20,430,600,80)
    limparPontuacao.strokeWidth = 4
    limparPontuacao:setFillColor( 0 )
    limparPontuacao:setStrokeColor( 0, 0, 0 )

    jogador = " "
    placar1=0
    placar2=0
    quantidadaJogadas = 0 
    
    
    tabuleiroJogadas = {{" "," "," "},
                       {" "," "," "},
                       {" "," "," "}}
    
    
    local myText = display.newText( "Escolha o elemento de jogada: ", 165, 160, native.systemFont, 20 )
    myText:setFillColor(1,1,1)

    local myText = display.newText( "Jogo da Velha", 170, 40, native.systemFont, 32)
    myText:setFillColor(1,0,0)

    --Opções de Jogada
    --O
    retanguloO = display.newRect(237,230,130,50)
    retanguloO.strokeWidth = 4
    retanguloO:setFillColor( 1,1,1 )
    retanguloO:setStrokeColor( 1, 0, 0 )
    function retanguloO:touch( event )
        if event.phase == "ended" then
            jogador="O"
            limparButoes()
            return true
        end
    end
    retanguloO:addEventListener( "touch",retanguloO)
   

    local myCircle = display.newCircle( 237,230, 15, 15 )
    myCircle:setFillColor( 1 )
    myCircle.strokeWidth = 4
    myCircle:setStrokeColor( 1, 0 ,0 )


    --X
    retanguloX = display.newRect(100,230,130,50)
    retanguloX.strokeWidth = 4
    retanguloX:setFillColor( 1,1,1 )
    retanguloX:setStrokeColor( 1, 0, 0 )

    function retanguloX:touch( event )
        if event.phase == "ended" then
            jogador="X"
            limparButoes()
            return true
        end
    end
    retanguloX:addEventListener( "touch",retanguloX)

    local Vertical1 = display.newLine( 110, 250, 90, 210)
    Vertical1.strokeWidth = 4
    Vertical1:setStrokeColor(1 , 0 ,0 )  

    local Vertical2 = display.newLine(  90, 250, 110, 210)
    Vertical2.strokeWidth = 4   
    Vertical2:setStrokeColor(1 , 0 ,0 ) 

end 


inicioJogo()

--Limpar Butões--
function limparButoes()
    limparRetangulo = display.newRect(100,230,410,280)
    limparRetangulo.strokeWidth = 0 
    limparRetangulo:setFillColor( 0 )
    limparRetangulo:setStrokeColor(0 , 0 ,0 )
    tabuleiro()
    

end

--Desenhar Tabuleiro

function tabuleiro()
    --Linha vertical

    local linhaVertical1 = display.newLine( 200, 337, 200, 103)
    linhaVertical1.strokeWidth = 4
        
    local linhaVertical2 = display.newLine( 120, 337, 120, 103)
    linhaVertical2.strokeWidth = 4   
        
    --Linha Horizontal

    local linhaHorizontal1 = display.newLine( 43, 180, 277, 180 )
    linhaHorizontal1.strokeWidth = 3

    local linhaHorizontal2= display.newLine( 43, 260, 277, 260 )
    linhaHorizontal2.strokeWidth = 3.5
    Quadrados()

    placar()
end




function placar()
    retanguloO = display.newRect(237,430,120,38)
    retanguloO.strokeWidth = 4
    retanguloO:setFillColor( 1,1,1 )
    retanguloO:setStrokeColor( 1, 0, 0 )
    
    retanguloX = display.newRect(100,430,120,38)
    retanguloX.strokeWidth = 4
    retanguloX:setFillColor( 1,1,1 )
    retanguloX:setStrokeColor( 1, 0, 0 )
    
    
    jogadorX1="X"    
    vitoriaX= jogadorX1.."               "..placarX
    
    local options = 
    {
        text = vitoriaX,     
        x = 220,
        y = 433,
        width = 128,
        font = native.systemFont,   
        fontSize = 18,
        align = "right"
    }
    local myText = display.newText(options )
    myText:setFillColor( 1, 0, 0 )
           
    jogadorO1 = "O"
    vitoriaO= jogadorO1.."               "..placarO
    
    local options2 = 
    {
        text = vitoriaO,     
        x = 83,
        y = 433,
        width = 128,
        font = native.systemFont,   
        fontSize = 18,
        align = "right"
    }
    local myText = display.newText( options2 )
    myText:setFillColor( 1, 0, 0 )
end

function mudarJogador() 
    if(jogador=="X") then
        jogador="O"
    else
        jogador="X"
    end
end  

function verificarVitoria()

    if(quantidadaJogadas<=8) then

        if(tabuleiroJogadas[1][1] ~= " " and tabuleiroJogadas[1][1] == tabuleiroJogadas[1][2] 
            and tabuleiroJogadas[1][2] == tabuleiroJogadas[1][3])then
            vencedor()
        elseif(tabuleiroJogadas[2][1] ~= " " and tabuleiroJogadas[2][1] == tabuleiroJogadas[2][2] 
                and tabuleiroJogadas[2][2] == tabuleiroJogadas[2][3]) then
            vencedor()
        elseif (tabuleiroJogadas[3][1] ~= " " and tabuleiroJogadas[3][1] == tabuleiroJogadas[3][2] 
                and tabuleiroJogadas[3][2] == tabuleiroJogadas[3][3]) then
            vencedor()
        elseif(tabuleiroJogadas[1][1] ~= " " and tabuleiroJogadas[1][1] == tabuleiroJogadas[2][1] 
                and tabuleiroJogadas[2][1] == tabuleiroJogadas[3][1]) then
            vencedor()
        elseif(tabuleiroJogadas[1][2] ~=" " and tabuleiroJogadas[1][2] == tabuleiroJogadas[2][2] 
                and tabuleiroJogadas[2][2] == tabuleiroJogadas[3][2]) then
            vencedor()
        elseif(tabuleiroJogadas[1][3] ~= " " and tabuleiroJogadas[1][3] == tabuleiroJogadas[2][3] 
                and tabuleiroJogadas[2][3] == tabuleiroJogadas[3][3]) then
            vencedor()
        elseif(tabuleiroJogadas[1][1] ~= " " and tabuleiroJogadas[1][1] == tabuleiroJogadas[2][2]
                and tabuleiroJogadas[2][2] == tabuleiroJogadas[3][3]) then
            vencedor()
        elseif(tabuleiroJogadas[3][1] ~= " " and tabuleiroJogadas[3][1] == tabuleiroJogadas[2][2] 
                and tabuleiroJogadas[2][2] == tabuleiroJogadas[1][3]) then
            vencedor()
        end
    else
        empate()
	end
end

function limparTabuleiro()
    tabuleiroJogadas = {{" "," "," "},
                       {" "," "," "},
                       {" "," "," "}}

    limparRetangulo2 = display.newRect(100,230,410,280)
    limparRetangulo2.strokeWidth = 0 
    limparRetangulo2:setFillColor( 0 )
    limparRetangulo2:setStrokeColor(0 , 0 ,0 )
    quantidadaJogadas = 0 
    tabuleiro()
end

function novoJogo()

    limparRetangulo2 = display.newRect(100,230,410,280)
    limparRetangulo2.strokeWidth = 0 
    limparRetangulo2:setFillColor( 0 )
    limparRetangulo2:setStrokeColor(0 , 0 ,0 )

    local myText = display.newText( "Deseja jogar novamente: ", 165, 160, native.systemFont, 20 )
    myText:setFillColor(1,1,1)
    
    retanguloSim = display.newRect(100,230,130,50)
    
    function retanguloSim:touch( event )
        if event.phase == "ended" then
            mudarJogador()
            limparTabuleiro()
            return true
        end
    end
    
    retanguloSim:addEventListener( "touch",retanguloSim)
   
    retanguloNao = display.newRect(237,230,130,50)
    function retanguloNao:touch( event )
        if event.phase == "ended" then
            placarO=0
            placarX=0
            inicioJogo()
            return true
        end
    end
    retanguloNao:addEventListener( "touch",retanguloNao)

    local textSim = display.newText( "SIM", 100, 234, native.systemFont, 18)
        textSim:setFillColor(1,0,0)

    local textNao = display.newText( "NÃO", 240, 234, native.systemFont, 18)
    textNao:setFillColor(1,0,0)
    
end

function vencedor()
    if(jogador == "X") then
        placarX = placarX +1
        placar()
       
    else 
        placarO = placarO +1
        placar()
    end
        novoJogo()
        venc = "Vencedor "..jogador
        
        local options = 
        {
            text = venc,     
            x = 170,
            y = 100,
            width = 128,
            font = native.systemFont,   
            fontSize = 20,
            align = "right"
        }
        local myText = display.newText( options )
        myText:setFillColor( 1, 0, 0 )
end

function empate()
    novoJogo()
    local myText = display.newText( "Jogo Empatado!!", 170, 100, native.systemFont, 20 )
    myText:setFillColor(1,0,0)
end  

function Jogada1(jogador) 
    if(tabuleiroJogadas[1][1]==" ")then
        if(jogador=="O")then
            local myCircle = display.newCircle( 80, 140, 30 )
            myCircle:setFillColor( 1 )
            myCircle.strokeWidth = 4
            myCircle:setStrokeColor( 1, 1 , 1 )
            
            tabuleiroJogadas[1][1] = jogador
            quantidadaJogadas = quantidadaJogadas + 1
            verificarVitoria()
            mudarJogador()

        else    
            local Vertical1 = display.newLine( 50, 110, 115, 175)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 1 ,1 )  

            local Vertical1 = display.newLine( 115, 110, 50, 175)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 1 ,1 ) 

            tabuleiroJogadas[1][1] = jogador
            quantidadaJogadas = quantidadaJogadas + 1
            verificarVitoria()
            mudarJogador()

        end 
    end    
end   

function Jogada2(jogador) 

    if(tabuleiroJogadas[1][2]==" ")then
        if(jogador=="O")then
            local myCircle = display.newCircle( 160, 140, 30 )
            myCircle:setFillColor( 1 )
            myCircle.strokeWidth = 4
            myCircle:setStrokeColor( 1, 1 , 1 )
            
            tabuleiroJogadas[1][2]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            verificarVitoria()
            mudarJogador()
        else 
            local Vertical1 = display.newLine( 198,180, 120, 110)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 1 ,1 )

            local Vertical1 = display.newLine(120 ,180, 198, 110)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 1 ,1 ) 

            tabuleiroJogadas[1][2]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            verificarVitoria()
            mudarJogador()
            

        end
    end
end 

function jogada3(jogador)
    if (tabuleiroJogadas[1][3]==" ")then
        if(jogador=="O")then
            local myCircle = display.newCircle( 240, 140, 30 )
            myCircle:setFillColor( 1 )
            myCircle.strokeWidth = 4
            myCircle:setStrokeColor( 1, 1 , 1 )

            tabuleiroJogadas[1][3]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            verificarVitoria()
            mudarJogador()
            
        else  
            local Vertical1 = display.newLine( 200,180, 275, 110)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 1 ,1 )

            local Vertical1 = display.newLine( 275,180, 200, 110)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 1 ,1 )

            tabuleiroJogadas[1][3]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            verificarVitoria()
            mudarJogador()

        end    
    end
end

function jogada4(jogador)
    if (tabuleiroJogadas[2][1]==" ")then
        if(jogador=="O")then
            local myCircle = display.newCircle( 80, 220, 30 )
            myCircle:setFillColor( 1 )
            myCircle.strokeWidth = 4
            myCircle:setStrokeColor( 1, 1 , 1 )

            tabuleiroJogadas[2][1]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            verificarVitoria()
            mudarJogador()
        else  
            local Vertical1 = display.newLine( 50, 250, 115, 185)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 1 ,1 )

            local Vertical1 = display.newLine( 115, 250, 50, 185)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 1 ,1 )

            tabuleiroJogadas[2][1]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            verificarVitoria()
            mudarJogador()
        end    
    end
end


function jogada5(jogador)
    if (tabuleiroJogadas[2][2]==" ")then
        if(jogador=="O")then
            local myCircle = display.newCircle( 160, 220, 30 )
            myCircle:setFillColor( 1 )
            myCircle.strokeWidth = 4
            myCircle:setStrokeColor( 1, 1 , 1 )

            tabuleiroJogadas[2][2]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            verificarVitoria()
            mudarJogador()
        else 
            local Vertical1 = display.newLine( 125,180, 200, 255)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 1 ,1 )

            local Vertical1 = display.newLine( 200,180, 125, 255)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 1 ,1 )

            tabuleiroJogadas[2][2]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            verificarVitoria()
            mudarJogador()
        end    
    end
end

function jogada6(jogador)
    if (tabuleiroJogadas[2][3]==" ")then
        if(jogador=="O")then
            local myCircle = display.newCircle( 240, 220, 30 )
            myCircle:setFillColor( 1 )
            myCircle.strokeWidth = 4
            myCircle:setStrokeColor( 1, 1 , 1 )

            tabuleiroJogadas[2][3]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            verificarVitoria()
            mudarJogador()
        else 
            local Vertical1 = display.newLine( 200, 180, 280, 260)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 1 ,1 )

            local Vertical1 = display.newLine( 280, 180, 200, 260)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 1 ,1 )

            tabuleiroJogadas[2][3]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            verificarVitoria()
            mudarJogador()
        end    
    end
end

function jogada7(jogador)
    if (tabuleiroJogadas[3][1]==" ")then
        if(jogador=="O")then
            local myCircle = display.newCircle( 80,300, 30 )
            myCircle:setFillColor( 1 )
            myCircle.strokeWidth = 4
            myCircle:setStrokeColor( 1, 1 , 1 )

            tabuleiroJogadas[3][1]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            verificarVitoria()
            mudarJogador()
            
        else
            local Vertical1 = display.newLine( 50, 335, 115, 270)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 1 ,1 ) 

            local Vertical1 = display.newLine( 115, 335, 50, 270)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 1 ,1 )
            tabuleiroJogadas[3][1]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            verificarVitoria()
            mudarJogador()

        end    
    end
end

function jogada8(jogador)
    if (tabuleiroJogadas[3][2]==" ")then
        if(jogador=="O")then
            local myCircle = display.newCircle( 160,300, 30 )
            myCircle:setFillColor( 1 )
            myCircle.strokeWidth = 4
            myCircle:setStrokeColor( 1, 1 , 1 )

            tabuleiroJogadas[3][2]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            verificarVitoria()
            mudarJogador()
        else   
            local Vertical1 = display.newLine( 128, 335, 200, 265)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 1 ,1 )
            
            local Vertical1 = display.newLine( 200, 335, 128, 265)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 1 ,1 )

            tabuleiroJogadas[3][2]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            verificarVitoria()
            mudarJogador()
        end    
    end
end

function jogada9(jogador)
    if (tabuleiroJogadas[3][3]==" ")then
        if(jogador=="O")then
            local myCircle = display.newCircle( 240,300, 30 )
            myCircle:setFillColor( 1 )
            myCircle.strokeWidth = 4
            myCircle:setStrokeColor( 1, 1 , 1 )

            tabuleiroJogadas[3][3]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            verificarVitoria()
            mudarJogador()
        else 
            local Vertical1 = display.newLine( 210, 335, 280, 265)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 1 ,1 )

            local Vertical1 = display.newLine( 280, 335, 210, 265)
            Vertical1.strokeWidth = 4
            Vertical1:setStrokeColor(1 , 1 ,1 )

            tabuleiroJogadas[3][3]=jogador
            quantidadaJogadas = quantidadaJogadas + 1
            verificarVitoria()
            mudarJogador()
        end    
    end
end

function Quadrados()
    --Quadrado
    -- 1 Linha

    local quadrado1 = display.newRect( 80,140, 70, 70 )
    quadrado1.strokeWidth = 3
    quadrado1:setFillColor( 0 )
    quadrado1:setStrokeColor( 0, 0, 0 )
    
    function quadrado1:touch( event )
        if event.phase == "ended" then
            Jogada1(jogador)
            return true
        end
    end
     
    quadrado1:addEventListener( "touch",quadrado1)
    

    local quadrado2 = display.newRect( 160,140, 70, 70 )
    quadrado2.strokeWidth = 3
    quadrado2:setFillColor( 0 )
    quadrado2:setStrokeColor( 0, 0, 0 )

    function quadrado2:touch( event )
        if event.phase == "ended" then
            Jogada2(jogador)
            return true
        end
    end
     
    quadrado2:addEventListener( "touch",quadrado2)

    local quadrado3 = display.newRect( 240,140, 70, 70 )
    quadrado3.strokeWidth = 3
    quadrado3:setFillColor( 0 )
    quadrado3:setStrokeColor( 0, 0, 0 )

    function quadrado3:touch( event )
        if event.phase == "ended" then
            jogada3(jogador)
            return true
        end
    end
     
    quadrado3:addEventListener( "touch",quadrado3)

    local quadrado4 = display.newRect( 80,220, 70, 70 )
    quadrado4.strokeWidth = 3
    quadrado4:setFillColor( 0 )
    quadrado4:setStrokeColor( 0, 0, 0 )

    function quadrado4:touch( event )
        if event.phase == "ended" then
            jogada4(jogador)
            return true
        end
    end
     
    quadrado4:addEventListener( "touch",quadrado4)


    local quadrado5 = display.newRect( 160,220, 70, 70 )
    quadrado5.strokeWidth = 3
    quadrado5:setFillColor( 0 )
    quadrado5:setStrokeColor( 0, 0, 0 )

    function quadrado5:touch( event )
        if event.phase == "ended" then
            jogada5(jogador)
            return true
        end
    end
     
    quadrado5:addEventListener( "touch",quadrado5)

    local quadrado6 = display.newRect( 240,220, 70, 70 )
    quadrado6.strokeWidth = 3
    quadrado6:setFillColor( 0 )
    quadrado6:setStrokeColor( 0, 0, 0 )

    function quadrado6:touch( event )
        if event.phase == "ended" then
            jogada6(jogador)
            return true
        end
    end
     
    quadrado6:addEventListener( "touch",quadrado6)


    -- 3 Linha

    local quadrado7 = display.newRect( 80,300, 70, 70 )
    quadrado7.strokeWidth = 3
    quadrado7:setFillColor( 0 )
    quadrado7:setStrokeColor( 0, 0, 0 )

    function quadrado7:touch( event )
        if event.phase == "ended" then
            jogada7(jogador)
            return true
        end
    end
     
    quadrado7:addEventListener( "touch",quadrado7)

    local quadrado8 = display.newRect( 160,300, 70, 70 )
    quadrado8.strokeWidth = 3
    quadrado8:setFillColor( 0 )
    quadrado8:setStrokeColor( 0, 0, 0 )

    function quadrado8:touch( event )
        if event.phase == "ended" then
            jogada8(jogador)
            return true
        end
    end
     
    quadrado8:addEventListener( "touch",quadrado8)


    local quadrado9  = display.newRect( 240,300, 70, 70 )
    quadrado9.strokeWidth = 3
    quadrado9:setFillColor( 0)
    quadrado9:setStrokeColor( 0, 0, 0 )

    function quadrado9:touch( event )
        if event.phase == "ended" then
            jogada9(jogador)
            return true
        end
    end
     
    quadrado9:addEventListener( "touch",quadrado9)
 
end
