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
    
    var mazeArray = [
"+-  ----------------------------------------------------------------------------+",
"|           |                 H    H        b           |           |           |",
"|           +---------------+               +-------+   |   +---+   +-------+   |",
"|                           |   h           |       |   |   |   |   |       |   |",
"|                           +-------+       +---+   +   |   | H |   +   +   +   |",
"|                           B       |           |       |   |   |       |   b   |",
"|-------------------------------+   +-------+   |   +---+   |   +-----------+   |",
"|A                              |   b           |   |       |       |           |",
"|    H                      +   +---------------|   +---+   |---+   |   +-------|",
"|                           |                   |         b |       |           |",
"|                           +---------------+   +-----------+   +---|    b      |",
"|                          B#       |       |           |           |           |",
"|                   +-----------+   |   +   +-------+   +-------+   +-------+   |",
"|                   |           |   |   |           |           |       |       |",
"|                   |   +---+   |   |   +---+   +-----------+   +   +   |   +---|",
"|               H   |       |   |   |       |       |   b   |       |   |       |",
"|   +-----------------------+   |   +-------|   +   +   +   +-------|   |---+   |",
"|           |        b          |   b       |   |       |           |   |       |",
"|-------+   |---+   +---------------+   +   +-------+   |-------+   +   |       |",
"|   |       |       |              h|   |           |   |     b |       |       |",
"|   +   +---+   +   |               +---|   +---+   |   |   +   +-------|       |",
"|   B           |   |                   |      H|   |   |   |       |   |       |",
"|   +-------------------+               +-------+   |   +   |---+   +   +---+   |",
"|      H|               #                b          |       |               |   |",
"|   +---+           +   +---------------------------------------------------+   |",
"|___+   #B          | H |                      b    |       |           | b     |",
"|       +   +-----------|   +-------------------+   +   +   |   +---+   |   +---|",
"|      h|   |           |   |  A               H|       |   |   |   |   |   | H |",
"| b +---+   |   +---+   +   +-------+           +-------+   |   |   |   |   |   |",
"|   |A      |       |     b |       |          B#   |       |   |   |   |   |   |",
"|   +-----------+   |-------+   +   +-----------+   |   |   |   |   |   +   |   |",
"|         b         |    b      |           |       |   |   |   |   |       |   |",
"|   +-----------------------+   +-------+   |   +   |   +---|   +   +-------+   |",
"|       |h  |                   |     A |   |   |   |  b    |           |       |",
"|       |   +   +   +-----------|   +---+   |   |   |---+   +-------+   |---+   |",
"|       |       |               |   |       |   | b | h |               |       |",
"|   +---------------+   +---+   |   |   +---+   |   |   +---------------+       |",
"|   |               |       |   |   |    b      |   |     b    b    |           |",
"|   +     b         +-------+   |   +-----------+   +-------+   +   +           |",
"|                               |H   B          #    @          |               |",
"+-------------------------------------------------------------------------------+",
]

    func find(character: String){
    for (rowIndex, row) in mazeArray.enumerated() {
        for (colIndex, col) in row.enumerated() {
            if String(col) == character {
                print("Coordonnées de \(character): (\(colIndex), \(rowIndex))")
                }
            }
        }
    }
    
    
    func showCharacter(axis: (Int, Int)) -> String{
        let (xPosition, yPosition) = axis
        let row = mazeArray[yPosition]
        let index = row.index(row.startIndex, offsetBy: xPosition)
        let character = String(row[index])
        return character
    }
    
    
    func remplaceCharacter(axis: (Int, Int, String)){
        let (x, y, character) = axis
        var row = mazeArray[y]
        let index = row.index(row.startIndex, offsetBy: x)
        row = row.replacingOccurrences(of: String(row[index]), with: character, range: index..<row.index(after: index))
        mazeArray[y] = row
    }
        
    
    func showMaze(){
        for line in mazeArray{
            print(line)
        }
    }
    
    
    func playerPosition() -> (Int, Int){
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
    
    
    func newPlayerPosition(to newPosition:(Int, Int)) {
        let (newx, newy) = newPosition
        x += newx
        y += newy
    }
}

    
