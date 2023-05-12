import Foundation

class Moves{

let door1 = Tictactoe() //(48,39)
let door2 = Tictactoe() //(48,29)
let door3 = Tictactoe() //(8,25)
let door4 = Tictactoe() //(24,23)
let door5 = Tictactoe() //(28,11)
                                    
let fight = Fight()
    
var take = false
    
    
    
let mobs = [BossType.Slime, BossType.RatKing, BossType.ChainChomper, BossType.LivingShadow, BossType.WanderingEye]
    

    func moveForward(Maze: Maze)  {
        let character = Maze.showCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()-1))
    
        if character != "|" && character != "+" && character != "-" && character != "b" && character != "A" && character != "H" && character != "h"{// TODO add diffrent from # and A
        Maze.newPlayerPosition(to: (0, -1))
        Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
        Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()+1, " "))
        
        }
        
        
        else if character == "b"{
            let randomMob = Int.random(in: 0...4)
            fight.start(character: PlayerCharacter, boss: mobs[randomMob], inventory: inventory)
            if fight.getWin() == true{
                Maze.newPlayerPosition(to: (0, -1))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))           //mob attack
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()+1, " "))
            }else{
                print("You cannot pass, you lost the fight")
            }
        }
        
        
        else if character == "A" && Maze.playerPosition() == (1, 8){
            takeWeapon(Inventory: inventory, Weapon: .RPG)
            if take == true{
                Maze.newPlayerPosition(to: (0, -1))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))       //weapon4
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()+1, " "))
            }
        }
        
        
        else if character == "H" {
            takeHeal(Inventory: inventory, Heal: .MEDIKIT)
                     if take == true{
                         Maze.newPlayerPosition(to: (0, -1))
                         Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))       //MEDIKIT
                         Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()+1, " "))
                     }
        }
        
        
        else if character == "h"{
            takeHeal(Inventory: inventory, Heal: .BANDAGES)
                     if take == true{
                         Maze.newPlayerPosition(to: (0, -1))
                         Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))       //BANDAGES
                         Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()+1, " "))
                     }
        }
        
        else{
            print("You cannot move Forward")
        }
    }

    
    func moveBack(Maze: Maze) {
        let character = Maze.showCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()+1))
        
        if character != "|" && character != "+" && character != "-" && character != "b" && character != "H" && character != "h"{// TODO add diffrent from # and A
            Maze.newPlayerPosition(to: (0, 1))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()-1, " "))
        
        }
        
        
        else if character == "b"{
            let randomMob = Int.random(in: 0...4)
            fight.start(character: PlayerCharacter, boss: mobs[randomMob], inventory: inventory)
            if fight.getWin() == true{
                Maze.newPlayerPosition(to: (0, 1))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()-1, " "))
            }else{
                print("You cannot pass, you lost the fight")
            }
        }
        
        
        else if character == "H" {
            takeHeal(Inventory: inventory, Heal: .MEDIKIT)
                     if take == true{
                         Maze.newPlayerPosition(to: (0, 1))
                         Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))          //MEDIKIT
                         Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()-1, " "))
                     }
        }
        
        
        else if character == "h"{
            takeHeal(Inventory: inventory, Heal: .BANDAGES)
                     if take == true{
                         Maze.newPlayerPosition(to: (0, 1))
                         Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))          //BANDAGES
                         Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()-1, " "))
                     }
        }
        
        
        else{
            print("You cannot move back")
        }
    }

    
    func moveLeft(Maze: Maze) {
        let character = Maze.showCharacter(axis: (Maze.getPlayerXPosition()-1, Maze.getPlayerYPosition()))
            
            
        if character != "|" && character != "+" && character != "#" && character != "A" && character != "B" && character != "b" && character != "H" && character != "h"{
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
            takeWeapon(Inventory: inventory, Weapon: .GLOCK)
            if take == true{
                Maze.newPlayerPosition(to: (-1, 0))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))           //weapon1
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
            }
        }
        else if character == "A" && Maze.playerPosition() == (6, 29){
            takeWeapon(Inventory: inventory, Weapon: .AK47)
            if take == true{
                Maze.newPlayerPosition(to: (-1, 0))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))            //weapon3
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
            }
        }else if character == "A" && Maze.playerPosition() == (2, 7){
            takeWeapon(Inventory: inventory, Weapon: .RPG)
            if take == true{
                Maze.newPlayerPosition(to: (-1, 0))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))            //weapon4
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
            }
        }
        
        
        else if character == "B"{
            fight.start(character: PlayerCharacter, boss: .Slime, inventory: inventory)
            if fight.getWin() == true{
                Maze.newPlayerPosition(to: (-1, 0))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))       //BOSS
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
            }else{
                print("you cannot pass, you lost the fight")
            }
        }
        
        
        else if character == "b"{
            let randomMob = Int.random(in: 0...4)
            fight.start(character: PlayerCharacter, boss: mobs[randomMob], inventory: inventory)
            if fight.getWin() == true{
                Maze.newPlayerPosition(to: (-1, 0))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
            }else{
                print("You cannot pass, you lost the fight")
            }
        }
        
        
        
        else if character == "H" {
            takeHeal(Inventory: inventory, Heal: .MEDIKIT)
                     if take == true{
                         Maze.newPlayerPosition(to: (-1, 0))
                         Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))          //MEDIKIT
                         Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
                     }
        }
        
        
        else if character == "h"{
            takeHeal(Inventory: inventory, Heal: .BANDAGES)
                     if take == true{
                         Maze.newPlayerPosition(to: (-1, 0))
                         Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))          //BANDAGES
                         Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
                     }
        }
        
        
        else{
            print("You cannot move Left")
        }
    }

    
    func moveRight(Maze: Maze) {
        let character = Maze.showCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition()))
            
            
        if character != "|" && character != "+" && character != "#" && character != "A" && character != "b" && character != "H" && character != "h"{
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
        
        
        else if character == "A" && Maze.playerPosition() == (37, 33){
            takeWeapon(Inventory: inventory, Weapon: .KNIFE)
            if take == true{
                Maze.newPlayerPosition(to: (1, 0))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))           //Weapon1
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()-1, Maze.getPlayerYPosition(), " "))
            }
        }
        
        
        else if character == "b"{
            let randomMob = Int.random(in: 0...4)
            fight.start(character: PlayerCharacter, boss: mobs[randomMob], inventory: inventory)
            if fight.getWin() == true{
                Maze.newPlayerPosition(to: (1, 0))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))       //FIGHT
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()-1, Maze.getPlayerYPosition(), " "))
            }else{
                print("You cannot pass, you lost the fight")
            }
        }

        
        else if character == "H" {
            takeHeal(Inventory: inventory, Heal: .MEDIKIT)
                     if take == true{
                         Maze.newPlayerPosition(to: (-1, 0))
                         Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))          //MEDIKIT
                         Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
                     }
        }
        
        
        else if character == "h"{
            takeHeal(Inventory: inventory, Heal: .BANDAGES)
                     if take == true{
                         Maze.newPlayerPosition(to: (-1, 0))
                         Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))          //BANDAGES
                         Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
                     }
        }
        
        
        else{
            print("You cannot move Right")
        }
    }
    
    
    func minigame(TictacToe : Tictactoe){
        print("You just found a room, are you sure you wanna go in ? (Y-N)")
        
        if let ans = readLine()?.uppercased(){
            switch ans {
            case "Y":
                print("To enter this room, you have to win this minigame first !")          //play mini game
                TictacToe.playTicTacToe()
            case "N":
                print("You don't wanna enter the room")
                
            default:
                print("\(ans) command do not exsist")
            }
        }
    }
    
    
    
    func takeWeapon(Inventory : Inventory, Weapon : WeaponsAvalaible){
        while true{
            print("You have found a weapon, do you want to take it ? (Y-N)")
            if let ans = readLine()?.uppercased(){
                switch ans {
                case "Y":
                    print("The weapon has been added to your inventory")
                    Inventory.addWeapon(Weapons: Weapon)
                    take = true
                    return
                case "N":                                                           //take weapon
                    print("You chose to not pick the heal")
                    take = false
                    return
                
                default:
                    print("\(ans) command do not exsist")
                }
            }
        }
    }
    
    
    func takeHeal(Inventory : Inventory, Heal : HealAvalaible){
        while true{
            print("You have found heal, do you want to take it ? (Y-N)")
            if let ans = readLine()?.uppercased(){
                switch ans {
                case "Y":
                    print("The heal has been added to your inventory")
                    Inventory.addHeal(heal: Heal)
                    take = true
                    return
                case "N":                                                           //take heal
                    print("You chose to not pick the heal")
                    take = false
                    return
                
                default:
                    print("\(ans) command do not exsist")
                }
            }
        }
    }
}

