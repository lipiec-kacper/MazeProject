import Foundation

let myMaze = Maze(x: 0, y: 0)
let movment = Moves()
let inventory = Inventory()
let PlayerCharacter = ChoseYourCharacter()
let xpPoints = XpPoints()


myMaze.playerPosition() //if delete it don't work
PlayerCharacter.choseCharacter(Inventory: inventory)

myMaze.showMaze()



while true {
        print("Enter the direction you want to go: (Left = l) (Right = r) (Up = u) (Down = d) (Inventory = i) (Help = h)")


        if let way = readLine()?.lowercased() {
            switch way{
                case "u" :
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
                    print("\t ----- \n")
                    inventory.getHeals()
                    print("To contine type ( Q )")
                if let resume = readLine()?.lowercased(){
                    if resume == "q"{
                        myMaze.showMaze()
                        continue
                        
                    }
                }
                case "h" :
                    print("\t A are Weapons")
                    print("\t b are Mobs")
                    print("\t B are Bosses")
                    print("\t h are Bandages")
                    print("\t H are MediKits")
                    print("\t # are doors")
                    print("\t @ is the player \n")
                    print("To contine type ( Q )")
                if let resume = readLine()?.lowercased(){
                    if resume == "q"{
                        myMaze.showMaze()
                        continue
                        
                    }
                }
                    
                default:
                    print("\(way) does not exsist")
            }
    myMaze.showMaze()
        }
    if movment.GameFinished == true{
        break
    }
}
print("")
print("\t\t\t YOU FINISHED THE GAME !!!!!!!!")













