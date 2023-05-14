import Foundation
protocol MiniGames{
    func playGame()
    func getWin() -> Bool
}

class TicTacToe : MiniGames{
    
    var grid = [["-", "-", "-"], ["-", "-", "-"], ["-", "-", "-"]]
    var win = false

        

        func printGrid() {                                      //Printing of the grid
            for row in grid {
                print(row.joined(separator: " "))
            }
        }

        
        func isFree(row: Int, col: Int) -> Bool {               //Verification
            return grid[row][col] == "-"
        }

        
        func checkWin(player: String) -> Bool {                     //Win verification
            for row in grid {
                if row == [player, player, player] {
                    return true
                }
            }
            

            for col in 0..<3 {
                if grid[0][col] == player && grid[1][col] == player && grid[2][col] == player {
                    return true
                }
            }
            

            if grid[0][0] == player && grid[1][1] == player && grid[2][2] == player {
                return true
            }
            
            
            if grid[0][2] == player && grid[1][1] == player && grid[2][0] == player {
                return true
            }

            return false
        }
        
        
        func getWin() -> Bool{
            return win
        }

        
        let Nameplayer1 = "Pixel"
        let Nameplayer2 = "BOT"
        let player1 = "X"
        let player2 = "O"

        
        func playGame() {                               //Play Game function
            var currentPlayer = Nameplayer1
            var SymcurrentPlayer = player1
            
            while true {
            
                var i = 0
                
                var row = 0
                var col = 0
                
                while i == 0 {
                    printGrid()
                    
                    print("It's \(currentPlayer)'s (\(SymcurrentPlayer)) turn ! Enter the line and column (separated by space) : ")
                    
                    if let input = readLine(){
                        
                        let inputLength = input.count
                        
                        if inputLength == 3 && input.contains(" "){
                            let parts = input.components(separatedBy: " ")
                            let part1 = Int(parts[0])! - 1
                            let part2 = Int(parts[1])! - 1
                            if (part1 <= 3 && part2 <= 3){
                                row = part1
                                col = part2
                                i += 1
                            }else{
                                print("command do not exist")
                            }
                        }else{
                            print("command do not exist")
                        }
                        
                    }
                }
                
                
                if isFree(row: row, col: col) {
                    grid[row][col] = SymcurrentPlayer

                    
                    if checkWin(player: SymcurrentPlayer) {     //check win
                        printGrid()
                        print(" ")
                        self.win = true
                        print("\(currentPlayer) won !")
                        print("You can now enter into this room !")
                        break
                    }
                    
                    
                    if grid.flatMap({ $0 }).filter({ $0 == "-" }).isEmpty {
                        printGrid()
                        print(" ")
                        print("Draw !")
                        break
                    }
                    currentPlayer = currentPlayer == Nameplayer1 ? Nameplayer2 : Nameplayer1
                    SymcurrentPlayer = SymcurrentPlayer == player1 ? player2 : player1
                }else {
                    print("Square occupied !")
                }
                
                
                
            botplay()
            func botplay() {
                if currentPlayer == Nameplayer2 {
                    print("It's \(currentPlayer)'s (\(SymcurrentPlayer)) turn !")
                    
                    let row = Int.random(in:0..<3)
                    let col = Int.random(in:0..<3)
                    if isFree(row: row, col: col) {
                        grid[row][col] = SymcurrentPlayer
                        
                        if checkWin(player: currentPlayer) {
                            printGrid()
                            print(" ")
                            print("\(currentPlayer) won !")
                            return
                        }
                        if grid.flatMap({ $0 }).filter({ $0 == "-" }).isEmpty {
                            printGrid()
                            print(" ")
                            print("Draw !")
                            return
                        }
                        currentPlayer = currentPlayer == Nameplayer1 ? Nameplayer2 : Nameplayer1
                        SymcurrentPlayer = SymcurrentPlayer == player1 ? player2 : player1
                        }else {
                        botplay()
                        }
                    }
                }
            }
        }
}

class GuessTheNumber : MiniGames{               //Guess the number MiniGame
    let randomNumber = Int.random(in: 0...100)
    
    
    //pour regarder le nombre d'essais
    var numberOfGuesses = 0
    
    var playerWin = false
    
    
        func playGame(){                                //Play game function
        print("I'm thinking of a number between 0 and 100, would you be able to find it ?")
        while !playerWin {
            guard let input = readLine(), let guess = Int(input) else{
                print("Invalid Input, please enter an integer between 0 and 100")
                continue
            }
            
            if guess == randomNumber {
                playerWin = true
                print("Congrats!, the correct number was \(randomNumber)")
            }else if guess < randomNumber{
                print("The number I'm thinking of is higer than \(guess), try again")
            }else {
                print("The number I'm thinking of is lower than \(guess), try again")
            }
            
            numberOfGuesses += 1
        }
    }
    
    
    func getWin() -> Bool{
        return playerWin
    }
}


class Wordle : MiniGames{                               //Wordle MiniGame
    
    // Game roles
    let maxAttempts = 6
    let wordLength = 5
    
    let words = ["guard", "alarm", "floor", "stair", "alert", "haunt"]
    
    var targetWord = ""
    var secretWord = ""
    
    //Begining of the game
    var attempts = 0
    var guessedLetters = Set<Character>()
    
    var playerWin = false
    
    
    init(){
    targetWord = words.randomElement()!
    secretWord = String(repeating: "*", count: wordLength)
    }
        
    
    func playGame() {
        print("The word to Guess: \(secretWord)")

        while attempts < maxAttempts {
            print("Enter a letter: ")
            guard let guess = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines).first?.lowercased()
            else {
                print("Invalid input, please enter a letter.")
                continue
            }
            
            if guessedLetters.contains(Character(guess)){
                print("Letter already guessed")
                continue
            }
            guessedLetters.insert(Character(guess))
            
            var newSecretWord = ""
            var correctGuess = false
            
            for (index, letter) in targetWord.enumerated() {
                if String(letter) == guess {
                    newSecretWord += String(guess)
                    correctGuess = true
                } else {
                    let stringIndex = secretWord.index(secretWord.startIndex, offsetBy: index)
                    newSecretWord += String(secretWord[stringIndex])
                }
            }
            
            if !correctGuess {
                attempts += 1
                print("Incorect, you have \(maxAttempts - attempts) attempts left")
            } else {
                secretWord = newSecretWord
                print("correct !")
            }
            
            print("guess the word: \(secretWord)")
            
            if secretWord == targetWord {
                print("You Win !")
                playerWin = true
                return
            }
        }
        
        print("You lost, the word was \(targetWord)")
    }
    
    func getWin() -> Bool{
        return playerWin
    }
}


