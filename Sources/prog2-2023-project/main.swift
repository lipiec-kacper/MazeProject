import Foundation

//TIC TAC TOE
//let play = Tictactoe()
//play.playTicTacToe()

let myMaze = Maze(x: 0, y: 0)
let movment = Moves()
print("Position du joueur", myMaze.playerPosition())
movment.moveLeft(Maze: myMaze)
print("Nouvelle position du joueur", myMaze.getPlayerPosition())
