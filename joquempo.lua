jogadas = {
    ["pedra"] = "pedra",
    ["papel"] = "papel",
    ["tesoura"] = "tesoura",
}
jogadas2 = {
    "pedra",
    "papel",
    "tesoura",
}
modalidades = {
    "Jogador X Jogador",
    "Jogador X Maquina",
    "Maquina X Maquina"
}
ganha = {
    ["pedra"] = "tesoura",
    ["tesoura"] = "papel",
    ["papel"] = "pedra"
}
local pontuacoes = {
    0,0
}


function  Sleep(seconds)
    -- Verifica o sistema operacional
    local os_type = package.config:sub(1,1) == '\\' and 'windows' or 'unix'

    -- Comando do timeout baseado no sistema operacional
    local timeout_command = os_type == 'windows' and 'timeout ' or 'sleep '

    -- Executa o comando de timeout
    os.execute(timeout_command .. seconds .. (os_type == 'windows' and ' > nul' or ' > /dev/null'))
end


function gerajogada()
    local jogada = jogadas2[math.random(1,3)]
    print("a maquina escolheu " .. jogada .. "\n")
    Sleep(2)
    return jogada
end


function getjogada()
    while true do
        print("Escolha uma jogada, digite (Pedra, Papel ou Tesoura)")
        local jogada = string.lower(io.read())
        if jogadas[jogada] ~= nil then
            print("Voce escolheu " .. jogadas[jogada] .. "\n")
            Sleep(2)
            return jogadas[jogada]
        else
            print("jogada invalida")
        end
    end
end

function qmganha(jogada1, jogada2)
    if jogada1 == jogada2 then
        print("Empate, os 2 escolheram " .. jogada1 .. "\n")
    elseif ganha[jogada1] == jogada2 then
        print("Jogador1 Ganhou, pois " .. jogada1 .. " ganha de " .. jogada2 .. "\n")
        pontuacoes[1] = pontuacoes[1] + 1
    else
        print("Jogador2 Ganhou, pois " .. jogada2 .. " ganha de " .. jogada1 .. "\n")
        pontuacoes[2] = pontuacoes[2] + 1
    end
end

function getmodalidade()
    while true do
        for i, v in pairs(modalidades) do
            print(i .. " " .. v)
        end
        print("Escolha uma modalidade, digite (1, 2 ou 3)")
        local modalidae = tonumber(io.read())
        if modalidades[modalidae] ~= nil then
            print("\n\n")
            print("Jogando na Modadeliade: " ..  modalidades[modalidae] .. "\n\n\n")
            Sleep(5)
            return tonumber(modalidae)
        else
            print("Modalidae invalida")
        end
    end
end



function game()
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
    local modalidade = getmodalidade()
    while true do 
        print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")

        Sleep(1)

        local jogada1
        local jogada2

        if modalidade == 1 then
            jogada1 = getjogada()
            jogada2 = getjogada()
        elseif modalidade == 2 then
            jogada1 = getjogada()
            jogada2 = gerajogada()
        else
            jogada1 = gerajogada()
            jogada2 = gerajogada()
        end

        
        qmganha(jogada1, jogada2)

        Sleep(1)

        while true do
            print("Quer continuar ? (Sim ou Nao)")
            local continuar = string.lower(io.read())
            if continuar == "sim" then
                break
            elseif continuar == "nao" then
                goto final
            end
        end
    end

    ::final::

    print("\n\n\n\n")
    print("-----------Pontos--------")
    print("jogador1 = " .. pontuacoes[1])
    print("jogador2 = " .. pontuacoes[2])
    print("-------------------------")
end

game()