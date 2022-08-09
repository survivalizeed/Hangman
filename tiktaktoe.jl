display(field) = print(field[1], "|", field[2], "|", field[3], "\n",
    field[4], "|", field[5], "|", field[6], "\n", field[7], "|", field[8], "|", field[9])

clear() = run(`cmd /c cls`)

function takeInput()::Int8
    while true
        input = readline()
        try 1 <= parse(Int8, input) <= 3 && return parse(Int8, input)
        catch 
            println("Invalid input!") 
        end
        print("Try a number between 1 and 3: ")
    end
end

function player(field, currentPlayer)
    while true
        print("\nPlayer ", currentPlayer, ":\nRow: ")
        row = takeInput()
        print("Column: ")
        column = takeInput()
        if field[row, column] == '-'
            currentPlayer == 1 && (field[row, column] = 'X')
            currentPlayer == 2 && (field[row, column] = 'O')
            break
        end
        print("Field already used!")
        clear()
    end
end

function checkWin(field)::Int8
    for w in 1:2, i in 0:3:6
        w == 1 ? char = 'X' : char = 'O'
        if field[1+i] == char && field[2+i] == char && field[3+i] == char
            return w
        end
    end
    for w in 1:2, i in 0:2
        w == 1 ? char = 'X' : char = 'O'
        if field[1+i] == char && field[4+i] == char && field[7+i] == char
            return w
        end
    end
    for w in 1:2
        w == 1 ? char = 'X' : char = 'O'
        if field[1] == char && field[5] == char && field[9] == char
            return w
        end
        if field[3] == char && field[5] == char && field[7] == char
            return w
        end
    end
    return 0
end

function main()
    field = fill('-', (3, 3))
    println("Always Enter numbers between 1 and 3 incl.")
    cPlayer = 2
    while true
        cPlayer == 2 ? cPlayer = 1 : cPlayer = 2    
        display(field)
        player(field, cPlayer)
        clear()
        checkWin(field) == cPlayer && (println("\nPlayer ", cPlayer, " won!"); break)
    end
end
main()
