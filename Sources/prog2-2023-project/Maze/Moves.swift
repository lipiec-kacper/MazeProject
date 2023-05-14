import Foundation

class Moves{

var door1 = TicTacToe() //(48,39)
var door2 = GuessTheNumber()  //(48,29)
var door3 = TicTacToe() //(8,25)
var door4 = GuessTheNumber()  //(24,23)
var door5 = Wordle()  //(28,11)
                                    
let fight = Fight()
    
let xpPoints = XpPoints()
    
var take = false

var GameFinished = false
    
    
    
let mobs = [BossType.Slime, BossType.RatKing, BossType.ChainChomper, BossType.LivingShadow, BossType.WanderingEye]
    

    func moveForward(Maze: Maze)  {                                                                                 //Move Forward case
        let character = Maze.showCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()-1))
    
        if character != "|" && character != "+" && character != "-" && character != "b" && character != "A" && character != "H" && character != "h" && Maze.playerPosition() != (2, 1) && Maze.playerPosition() != (3, 1){
        Maze.newPlayerPosition(to: (0, -1))
        Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))                   //default case
        Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()+1, " "))
        }
        
        
        else if character == "b"{
            let randomMob = Int.random(in: 0...4)
            fight.start(character: PlayerCharacter, boss: mobs[randomMob], inventory: inventory)
            if fight.getWin() == true{
                Maze.newPlayerPosition(to: (0, -1))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))           //mob attack
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()+1, " "))
                xpPoints.addXp(type: .Mob)
                fight.setWinFalse()
                
            }else{
                print("You cannot pass, you lost the fight")
            }
        }
        
        
        else if character == " " && Maze.playerPosition() == (2, 1){
            xpPoints.addXp(type: .FinalExit)                                    //exit
            
            GameFinished = true
        }
        
        
        else if character == " " && Maze.playerPosition() == (3, 1){
            xpPoints.addXp(type: .FinalExit)
                                                                            //exit
            GameFinished = true
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

    
    func moveBack(Maze: Maze) {                                                                             //Move back case
        let character = Maze.showCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()+1))
        
        if character != "|" && character != "+" && character != "-" && character != "b" && character != "H" && character != "h"{// TODO add diffrent from # and A
            Maze.newPlayerPosition(to: (0, 1))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()-1, " "))     //Default case
        
        }
        
        
        else if character == "b"{
            let randomMob = Int.random(in: 0...4)
            fight.start(character: PlayerCharacter, boss: mobs[randomMob], inventory: inventory)
            if fight.getWin() == true{
                Maze.newPlayerPosition(to: (0, 1))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition()-1, " "))     //mobs case
                xpPoints.addXp(type: .Mob)
                fight.setWinFalse()
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
            print("You cannot move Backward")
        }                                                                           //error case
    }

    
    func moveLeft(Maze: Maze) {                                                                     //move left case
        let character = Maze.showCharacter(axis: (Maze.getPlayerXPosition()-1, Maze.getPlayerYPosition()))
            
            
        if character != "|" && character != "+" && character != "#" && character != "A" && character != "B" && character != "b" && character != "H" && character != "h"{
            Maze.newPlayerPosition(to: (-1, 0))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))               //Default case
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
        }
        
        else if character == "#" && door1.getWin() == false && Maze.playerPosition() == (49, 39){
            minigame(door: door1)
        }else if character == "#" && door1.getWin() == true && Maze.playerPosition() == (49, 39){       //door1
            Maze.newPlayerPosition(to: (-1, 0))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
            xpPoints.addXp(type: .MiniGame)
        }
        
        
        else if character == "#" && door2.getWin() == false && Maze.playerPosition() == (49, 29){
            minigame(door: door2)
        }else if character == "#" && door2.getWin() == true && Maze.playerPosition() == (49, 29){           //door2
            Maze.newPlayerPosition(to: (-1, 0))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
            xpPoints.addXp(type: .MiniGame)
        }
        
        
        else if character == "#" && door5.getWin() == false && Maze.playerPosition() == (29, 11){
            minigame(door: door5)
        }else if character == "#" && door5.getWin() == true && Maze.playerPosition() == (29, 11){           //door5
            Maze.newPlayerPosition(to: (-1, 0))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
            xpPoints.addXp(type: .MiniGame)
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
        
        
        else if character == "B" && Maze.playerPosition() == (38, 39){
            fight.start(character: PlayerCharacter, boss: .HypnoticSpecter, inventory: inventory)
            if fight.getWin() == true{
                Maze.newPlayerPosition(to: (-1, 0))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))       //BOSS 1
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
                xpPoints.addXp(type: .Boss)
                fight.setWinFalse()
            }else{
                print("you cannot pass, you lost the fight")
            }
        }
        
        
        else if character == "B" && Maze.playerPosition() == (48, 29){
            fight.start(character: PlayerCharacter, boss: .MargittheFellOmen, inventory: inventory)
            if fight.getWin() == true{
                Maze.newPlayerPosition(to: (-1, 0))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))       //BOSS 2
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
                xpPoints.addXp(type: .Boss)
                fight.setWinFalse()
            }else{
                print("you cannot pass, you lost the fight")
            }
        }
        
        
        else if character == "B" && Maze.playerPosition() == (28, 11){
            fight.start(character: PlayerCharacter, boss: .RennalaQueenoftheFullMoon, inventory: inventory)
            if fight.getWin() == true{
                Maze.newPlayerPosition(to: (-1, 0))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))       //BOSS 4
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
                xpPoints.addXp(type: .Boss)
                fight.setWinFalse()
            }else{
                print("you cannot pass, you lost the fight")
            }
        }
        
        
        else if character == "B" && Maze.playerPosition() == (29, 5){
            fight.start(character: PlayerCharacter, boss: .RedWolfofRadagon, inventory: inventory)
            if fight.getWin() == true{
                Maze.newPlayerPosition(to: (-1, 0))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))       //BOSS 4
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
                xpPoints.addXp(type: .Boss)
                fight.setWinFalse()
            }else{
                print("you cannot pass, you lost the fight")
            }
        }
        
        
        else if character == "B" && Maze.playerPosition() == (5, 21){
            fight.start(character: PlayerCharacter, boss: .RennalaQueenoftheFullMoon, inventory: inventory)
            if fight.getWin() == true{
                Maze.newPlayerPosition(to: (-1, 0))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))       //BOSS 4
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
                xpPoints.addXp(type: .Boss)
                fight.setWinFalse()
            }else{
                print("you cannot pass, you lost the fight")
            }
        }

        
        
        else if character == "b"{
            let randomMob = Int.random(in: 0...4)
            fight.start(character: PlayerCharacter, boss: mobs[randomMob], inventory: inventory)
            if fight.getWin() == true{
                Maze.newPlayerPosition(to: (-1, 0))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))           //Mobs
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition(), " "))
                xpPoints.addXp(type: .Mob)
                fight.setWinFalse()
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
            print("You cannot move to the Left")                                                                    //Error case
        }
    }

            
    func moveRight(Maze: Maze) {                                                                        //Move right case
        let character = Maze.showCharacter(axis: (Maze.getPlayerXPosition()+1, Maze.getPlayerYPosition()))
            
            
        if character != "|" && character != "+" && character != "#" && character != "A" && character != "b" && character != "H" && character != "h" && character != "B"{
            Maze.newPlayerPosition(to: (1, 0))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))           //default case
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()-1, Maze.getPlayerYPosition(), " "))
        
            
        }else if character == "#" && door3.getWin() == false && Maze.playerPosition() == (7, 25){
            minigame(door: door3)
        }else if character == "#" && door3.getWin() == true && Maze.playerPosition() == (7, 25){           //door3
            Maze.newPlayerPosition(to: (1, 0))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()-1, Maze.getPlayerYPosition(), " "))
            xpPoints.addXp(type: .MiniGame)
        }
        
        
        else if character == "#" && door4.getWin() == false && Maze.playerPosition() == (23, 23){
            minigame(door: door4)
        }else if character == "#" && door4.getWin() == true && Maze.playerPosition() == (23, 23){           //door4
            Maze.newPlayerPosition(to: (1, 0))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()-1, Maze.getPlayerYPosition(), " "))
            xpPoints.addXp(type: .MiniGame)
        }
        
        
        else if character == "#" && door5.getWin() == false && Maze.playerPosition() == (27, 11){
            minigame(door : door5)
        }else if character == "#" && door5.getWin() == true && Maze.playerPosition() == (27, 11){           //door5
            Maze.newPlayerPosition(to: (1, 0))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))
            Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()-1, Maze.getPlayerYPosition(), " "))
            xpPoints.addXp(type: .MiniGame)
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
                xpPoints.addXp(type: .Mob)
                fight.setWinFalse()
            }else{
                print("You cannot pass, you lost the fight")
            }
        }

        
        else if character == "H" {
            takeHeal(Inventory: inventory, Heal: .MEDIKIT)
                     if take == true{
                         Maze.newPlayerPosition(to: (1, 0))
                         Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))      //MEDIKIT
                         Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()-1, Maze.getPlayerYPosition(), " "))
                     }
        }
        
        
        else if character == "h"{
            takeHeal(Inventory: inventory, Heal: .BANDAGES)
                     if take == true{
                         Maze.newPlayerPosition(to: (1, 0))
                         Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))          //BANDAGES
                         Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()-1, Maze.getPlayerYPosition(), " "))
                     }
        }
        
        
        else if character == "B" && Maze.playerPosition() == (8, 25){
            fight.start(character: PlayerCharacter, boss: .GelatinousCube, inventory: inventory)
            if fight.getWin() == true{
                Maze.newPlayerPosition(to: (1, 0))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))       //BOSS3
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()-1, Maze.getPlayerYPosition(), " "))
                xpPoints.addXp(type: .Boss)
                fight.setWinFalse()
            }else{
                print("you cannot pass, you lost the fight")
            }
        }
        
        
        else if character == "B" && Maze.playerPosition() == (3, 21){
            fight.start(character: PlayerCharacter, boss: .RennalaQueenoftheFullMoon, inventory: inventory)
            if fight.getWin() == true{
                Maze.newPlayerPosition(to: (1, 0))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))       //BOSS4
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()-1, Maze.getPlayerYPosition(), " "))
                xpPoints.addXp(type: .Boss)
                fight.setWinFalse()
            }else{
                print("you cannot pass, you lost the fight")
            }
        }
        
        
        else if character == "B" && Maze.playerPosition() == (26, 11){
            fight.start(character: PlayerCharacter, boss: .RennalaQueenoftheFullMoon, inventory: inventory)
            if fight.getWin() == true{
                Maze.newPlayerPosition(to: (1, 0))
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition(), Maze.getPlayerYPosition(), "@"))       //BOSS4
                Maze.remplaceCharacter(axis: (Maze.getPlayerXPosition()-1, Maze.getPlayerYPosition(), " "))
                xpPoints.addXp(type: .Boss)
                fight.setWinFalse()
            }else{
                print("you cannot pass, you lost the fight")
            }
        }

        
        else{
            print("You cannot move to the Right")                           //Error case
        }
    }
    
    
    func minigame(door : MiniGames){
        
        print("You just found a room, are you sure you wanna go in ? (Y-N)")
        
        if let ans = readLine()?.uppercased(){
            switch ans {
            case "Y":
                print("To enter this room, you have to win this minigame first !")          //play mini game
                door.playGame()
            case "N":
                print("You don't wanna enter the room")
                
            default:
                print("\(ans) command does not exsist")
            }
        }
    }
    
    
    
    func takeWeapon(Inventory : Inventory, Weapon : WeaponsAvalaible){
        while true{
            print("You found a weapon, do you want to take it ? (Y-N)")
            if let ans = readLine()?.uppercased(){
                switch ans {
                case "Y":
                    print("The weapon has been added to your inventory")
                    Inventory.addWeapon(Weapons: Weapon)
                    take = true
                    return
                case "N":                                                           //take weapon
                    print("You chose not to pick the heal")
                    take = false
                    return
                
                default:
                    print("\(ans) command does not exsist")
                }
            }
        }
    }
    
    
    func takeHeal(Inventory : Inventory, Heal : HealAvalaible){ 
        while true{
            print("You found heal, do you want to take it ? (Y-N)")
            if let ans = readLine()?.uppercased(){
                switch ans {
                case "Y":
                    print("The heal has been added to your inventory")
                    Inventory.addHeal(heal: Heal)
                    take = true
                    return
                case "N":                                                           //take heal
                    print("You chose not to pick the heal")
                    take = false
                    return
                
                default:
                    print("\(ans) command does not exsist")
                }
            }
        }
    }
}

