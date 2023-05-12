import Foundation

let myMaze = Maze(x: 0, y: 0)
let movment = Moves()
let inventory = Inventory()
let PlayerCharacter = ChoseYourCharacter()



myMaze.playerPosition() //if delete it don't work
PlayerCharacter.choseCharacter()

myMaze.showMaze()
inventory.addWeapon(Weapons: .RPG)  //TODO CHANGE TO FIST AFTER TESTS
inventory.addWeapon(Weapons: .AK47) //TODO CHANGE TO FIST AFTER TESTS
inventory.addHeal(heal: .BANDAGES)

    while true{
        print("Enter the direction you wanna go: (Left = l) (Right = r) (Up = up) (Down = d) (Inventory = i)")


        if let way = readLine()?.lowercased() {
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
                    print("\t Weapons")
                    print("\t -------")
                    inventory.getWeapons()
                    print("\t Heals")
                    print("\t -----")
                    inventory.getHeals()
                default:
                    print("\(way) do not exsist")
            }
    myMaze.showMaze()
        }
}

//myMaze.find(character: "C")




