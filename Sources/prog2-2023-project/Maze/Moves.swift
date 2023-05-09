import Foundation

class Moves{

let door1 = Tictactoe() //(48,39)
let door2 = Tictactoe() //(48,29)
let door3 = Tictactoe() //(8,25)
let door4 = Tictactoe() //(24,23)

let door5 = Tictactoe() //(28,11)
                                    

// A2 = (31,27)
// A3 = (5, 29)
    

    func moveForward(Maze: Maze)  {
        var character = Maze.showCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()-1))
    
        if character != "|" && character != "+" && character != "-"{// TODO add diffrent from # and A
        Maze.newPlayerPosition(to: (0, -1))
        Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
        Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()+1, " "))
        
        
        }else if character == "#"{
            //minigame()
        }else{
            print("You cannot move Forward")
        }
    }

    
    func moveBack(Maze: Maze) {
        var character = Maze.showCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()+1))
        
        if character != "|" && character != "+" && character != "-"{// TODO add diffrent from # and A
            Maze.newPlayerPosition(to: (0, 1))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()-1, " "))
        
        }else if character == "#"{
            //minigame()
        }else{
            print("You cannot move back")
        }
    }

    
    func moveLeft(Maze: Maze) {
        var character = Maze.showCharacter(axis: (Maze.getPlayerXPosition()-1, Maze.getPlayerYPosition()))
            
            
        if character != "|" && character != "+" && character != "#" && character != "A"{
            Maze.newPlayerPosition(to: (-1, 0))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
        }
        
        else if character == "#" && door1.getWin() == false && Maze.playerPosition() == (49, 39){
            minigame(TictacToe: door1)
        }else if character == "#" && door1.getWin() == true && Maze.playerPosition() == (49, 39){       //door1
            Maze.newPlayerPosition(to: (-1, 0))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
        }
        
        
        else if character == "#" && door2.getWin() == false && Maze.playerPosition() == (49, 29){
            minigame(TictacToe: door2)
        }else if character == "#" && door2.getWin() == true && Maze.playerPosition() == (49, 29){           //door2
            Maze.newPlayerPosition(to: (-1, 0))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
        }
        
        
        else if character == "#" && door5.getWin() == false && Maze.playerPosition() == (29, 11){
            minigame(TictacToe: door5)
        }else if character == "#" && door5.getWin() == true && Maze.playerPosition() == (29, 11){           //door5
            Maze.newPlayerPosition(to: (-1, 0))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
        }
        
        
        else if character == "A" && Maze.playerPosition() == (32, 27){
            takeWeapon(Inventory: inventory, Weapon: .GLOCK)                //weapon1
        }
        else if character == "A" && Maze.playerPosition() == (6, 29){
            takeWeapon(Inventory: inventory, Weapon: .M4A1)                //weapon3
        }
        
        
        
        else{
            print("You cannot move Left")
        }
    }

    
    func moveRight(Maze: Maze) {
        var character = Maze.showCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition()))
            
            
        if character != "|" && character != "+" && character != "#" && character != "A"{ 
            Maze.newPlayerPosition(to: (1, 0))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()-1, Maze.getPlayerYPosition(), " "))
        
            
        }else if character == "#" && door3.getWin() == false && Maze.playerPosition() == (7, 25){
            minigame(TictacToe: door3)
        }else if character == "#" && door3.getWin() == true && Maze.playerPosition() == (7, 25){           //door3
            Maze.newPlayerPosition(to: (1, 0))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()-1, Maze.getPlayerYPosition(), " "))
        }
        
        
        else if character == "#" && door4.getWin() == false && Maze.playerPosition() == (23, 23){
            minigame(TictacToe: door4)
        }else if character == "#" && door4.getWin() == true && Maze.playerPosition() == (23, 23){           //door4
            Maze.newPlayerPosition(to: (1, 0))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()-1, Maze.getPlayerYPosition(), " "))
        }
        
        
        else if character == "#" && door5.getWin() == false && Maze.playerPosition() == (27, 11){
            minigame(TictacToe: door5)
        }else if character == "#" && door5.getWin() == true && Maze.playerPosition() == (27, 11){           //door5
            Maze.newPlayerPosition(to: (1, 0))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()-1, Maze.getPlayerYPosition(), " "))
        }
        
        
        else if character == "A" && Maze.playerPosition() == (37, 33){      //take weapon
            takeWeapon(Inventory: inventory, Weapon: .KNIFE)
        }
        
        
        else{
            print("You cannot move Right")
        }
    }
    
    
    func minigame(TictacToe : Tictactoe){
        print("You just found a room, are you sure you wanna go in ? (Y-N)")
        
        if let ans = readLine(){
            switch ans {
            case "Y":
                print("To enter this room, you have to win this minigame first !")
                TictacToe.playTicTacToe()
            case "N":
                print("You don't wanna enter the room")
                
            default:
                print("\(ans) command do not exsist")
            }
        }
    }
    
    
    
    func takeWeapon(Inventory : Inventory, Weapon : WeaponsAvalaible){
        print("You have found a weapon, do you want to take it ? (Y-N)")
        
        if let ans = readLine(){
            switch ans {
            case "Y":
                print("The weapon has been added to your inventory")
                Inventory.addWeapon(Weapons: Weapon)
            case "N":
                print("You don't want to take the weapon")
                
            default:
                print("\(ans) command do not exsist")
            }
        }
    }
    
    
}
