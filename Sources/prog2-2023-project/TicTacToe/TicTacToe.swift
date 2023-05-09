//
//  TicTacToe.swift
//  Pixel Quest
//
//  Created by Michel Sem on 25/04/2023.
//

class Tictactoe {
var grid = [["-", "-", "-"], ["-", "-", "-"], ["-", "-", "-"]]
var win = false

    

    func printGrid() {
        for row in grid {
            print(row.joined(separator: " "))
        }
    }

    
    func isFree(row: Int, col: Int) -> Bool {
        return grid[row][col] == "-"
    }

    
    func checkWin(player: String) -> Bool {
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

    
    func playTicTacToe() {
        var currentPlayer = Nameplayer1
        var SymcurrentPlayer = player1
        
        while true {
            printGrid()
            print(" ")
                
            print("It's \(currentPlayer)'s (\(SymcurrentPlayer)) turn ! Enter the line and column (separated by space) : ")
            let input = readLine()!
            let parts = input.components(separatedBy: " ")
            let row = Int(parts[0])! - 1
            let col = Int(parts[1])! - 1
            
            
            if isFree(row: row, col: col) {
                grid[row][col] = SymcurrentPlayer

                
                if checkWin(player: SymcurrentPlayer) {     //check win
                    printGrid()
                    print(" ")
                    win = true
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
