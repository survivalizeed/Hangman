function main()
    while true
        println("Input a Word: ")
        word = readline()
        lowercase(word)
        encrypt = Vector{Char}("-" ^ length(word))
        println("The Word: " * join(encrypt) * " | There are only small letters allowed")
        state = false
        lives::Int = floor(Int, length(word) / 2)
        while 0 < lives
            while true
                global input = readline()
                lowercase(input)
                length(input) == 1 && break
                println("Wrong input")
            end
            for i in 1:length(word)
                if word[i] == input[1]
                    encrypt[i] = word[i]
                    state = true
                end
            end
            !state && (lives -= 1)
            if word == join(encrypt)
                println("You Won! The word was: " * word)
                break
            end
            println("The word: " * join(encrypt) * " ", lives, " lives remaining!")
            state = false
        end
        lives <= 0 && println("You lost! The word was: " * word)
        println("Play again? j to play again!")
        readline() != "j" && break;
    end
end

main()
