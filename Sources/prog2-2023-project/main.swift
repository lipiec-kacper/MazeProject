import Foundation

let myMaze = Maze(x: 0, y: 0)
let movment = Moves()
let inventory = Inventory()

myMaze.playerPosition() //if delete it don't work


myMaze.showMaze()


    while true{
        print("Enter the direction you wanna go: (Left = l) (Right = r) (Up = up) (Down = d) (Inventory = i)")


        if let way = readLine() {
            switch way{
                case "up" :
                    movment.moveForward(Maze: myMaze)
                case "d" :
                    movment.moveBack(Maze: myMaze)
                case "l" :
                    movment.moveLeft(Maze: myMaze)
                case "r" :
                    movment.moveRight(Maze: myMaze)
                case "i" :
                    inventory.getWeapons()
                default:
                    print("\(way) do not exsist")
            }
    myMaze.showMaze()
        }
}

//myMaze.find(character: "A")
