import Foundation
    
class Maze {

    var x: Int
    var y: Int
    
    var xCharacter = 0
    var yCharacter = 0
    
    init(x: Int, y: Int){
        self.x = x
        self.y = y
    }
    //Maze array
    var mazeArray = [
"+-  ----------------------------------------------------------------------------+",
"|           |     H    h      H    H        b         b |H          |H          |",
"|           +---------------+               +-------+   |   +---+   +-------+   |",
"|                           |   h           |   H   |   |   |   |   |       |   |",
"|                           +-------+  b    +---+ b +   |   | H |   +   +   +   |",
"|                           B       |           |       |   |   |       |   b   |",
"|-------------------------------+   +-------+   |   +---+   |   +-----------+   |",
"|A          H                   |   b          h|   |       |       |           |",
"|    H                      +   +---------------|   +---+   |---+   |   +-------|",
"|                           |                   |         b |    b  |          H|",
"|                           +---------------+   +-----------+   +---|    b      |",
"|                    H     B#       |    b  |           |           |           |",
"|                   +-----------+   |   +   +-------+   +-------+   +-------+   |",
"|                   |H         h|   |   |           |        b  |       |h      |",
"|                   |   +---+   |   |   +---+   +-----------+   +   +   |   +---|",
"|         H     H   |      H|   |   |       |       |   b   |       |   |       |",
"|   +-----------------------+   |   +-------|   +   +   +   +-------|   |---+   |",
"|           |H       b          |   b       |   |       |           |   |H      |",
"|-------+   |---+   +---------------+   +   +-------+   |-------+   +   |       |",
"| H |       |       | H            h|   |           |   |     b |       | b     |",
"|   +   +---+   +   |               +---|   +---+   |   |   +   +-------|       |",
"|   B           |   |                   |      H|   |   |   |       |   |h      |",
"|   +-------------------+      b        +-------+   |   +   |---+   +   +---+   |",
"|      H|               #                b          |       |               |   |",
"|   +---+           +   +---------------------------------------------------+   |",
"|___+   #B          | H |h                     b   H|      H|          H| b     |",
"|       +   +-----------|   +-------------------+   +   +   |   +---+   |   +---|",
"|      h|   |H         H|   |  A               H|      h|   |   | H |   |   | H |",
"| b +---+   |   +---+   +   +-------+           +-------+   |   |   |   |   |   |",
"|   |A      |      h|     b |       |          B#   |H      |   |   |   |   |   |",
"|   +-----------+   |-------+   +   +-----------+   |   |   |   |   |   +   |   |",
"|         b        H|    b      |           |       |   |   |   |   |       |   |",
"|   +-----------------------+   +-------+   |   +   |   +---|   +   +-------+   |",
"|    h  |h  |                   |H    A |   |   |   |  b   H|          h| H     |",
"|       |   +   +   +-----------|   +---+   |  h|   |---+   +-------+   |---+   |",
"|     H |H    H |               |   |       |   | b | h |h             H|       |",
"|   +---------------+   +---+   |   |   +---+   |   |   +---------------+       |",
"|   |H     H       H|       |   |   |    b  H  H|   | H        b    |           |",
"|   +     b         +-------+   |   +-----------+   +-------+   +   +    @      |",
"|                               |H   B          #               |              h|",
"+-------------------------------------------------------------------------------+",
]

    func find(character: String){       //Used to get the coordonates of diffrent characters needed
    for (rowIndex, row) in mazeArray.enumerated() {
        for (colIndex, col) in row.enumerated() {
            if String(col) == character {
                print("Coordonnées de \(character): (\(colIndex), \(rowIndex))")
                }
            }
        }
    }
    
    
    func showCharacter(axis: (Int, Int)) -> String{     //shows the character at special coordonates
        let (xPosition, yPosition) = axis
        let row = mazeArray[yPosition]
        let index = row.index(row.startIndex, offsetBy: xPosition)
        let character = String(row[index])
        return character
    }
    
    
    func remplaceCharacter(axis: (Int, Int, String)){   //Remplace character in the maze function
        let (x, y, character) = axis
        var row = mazeArray[y]
        let index = row.index(row.startIndex, offsetBy: x)
        row = row.replacingOccurrences(of: String(row[index]), with: character, range: index..<row.index(after: index))
        mazeArray[y] = row
    }
        
    
    func showMaze(){            //Printing of the map
        for line in mazeArray{
            print(line)
        }
    }
    
    
    func playerPosition() -> (Int, Int){        //Player position function
        for (rowIndex, row) in mazeArray.enumerated() {
            for (colIndex, col) in row.enumerated() {
                if col == "@" {
                    y = rowIndex
                    x = colIndex
                }
            }
        }
        return (x, y)
    }
    
    
    func getPlayerPosition() -> (Int, Int){
        return (x, y)
    }
    
    
    func getPlayerXPosition() -> (Int){
        return x
    }
    
    
    func getPlayerYPosition() -> (Int){
        return y
    }
    
    
    func newPlayerPosition(to newPosition:(Int, Int)) {     //Player position after a movement
        let (newx, newy) = newPosition
        x += newx
        y += newy
    }
}

    
