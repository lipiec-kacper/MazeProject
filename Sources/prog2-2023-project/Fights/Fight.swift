import Foundation
class Fight{
    
    var win = false
    
    func start(character : ChoseYourCharacter, boss: BossType, inventory : Inventory){
        var turn = 0
        var exist = 0
        
        let bossinfos = Boss()      //importation of diffrent classes
        let weapons = Weapons()
        let heal = Heal()
        
        var Player1Health = character.Nameplayer1.health    //Players informations
        
        let Player2Name = bossinfos.bossName(bossType: boss)
        var Player2Health = bossinfos.bossHealth(bossType: boss)
        let Player2Attack = bossinfos.bossDamage(bossType: boss)
        
        
        print("\(Player2Name) wants to fight with you (Attack = a) (Heal = h)")
        
            
        while Player2Health >= 0 || Player1Health >= 0{     //Begining of the fight
            if turn > 0{
                print("Your turn! Attack Or Heal ? (Attack = a) (Heal = h)")
            }
            if exist > 0{
                print("\(Player2Name) wants to fight you (Attack = a) (Heal = h)")
            }
            if let input = readLine()?.lowercased(){
                if input == "a"{        //attack case
                    var j = 1
                    exist = 0
                    
                    let weaponsLength = inventory.inventory[0].count
                    
                    print("Choose the weapon you want to use")
                    
                    for i in inventory.inventory[0]{    // Inventory printing
                        print(j,": ",i)
                        j += 1
                    }
                    if let choice = readLine(), let choiceInt = Int(choice), choiceInt <= weaponsLength {
                        
                    let weaponChoice = inventory.inventory[0][choiceInt-1]
                    
                    print("You chose the number \(choiceInt) which is a \(inventory.inventory[0][choiceInt-1])")

                    print("")
                        
                    Player2Health -= weapons.weaponDamage(weaponType: weaponChoice as! String)
                        
                    if Player2Health <= 0 { //Kill the Boss case
                        self.win = true
                        print("You killed \(Player2Name)")
                        break
                    }
                    
                    else{
                        print("He now has \(Player2Health)hp")  //Hit case
                        turn += 1

                        botplay()
                                
                        if Player1Health <= 0{      //Figth lost case
                            print("You lost the fight")
                            break
                        }
                        
                        else{
                            print("You now have \(Player1Health)hp")
                        }
                    }
                }else{
                    print("command does not exist")     //error case
                    turn += 1
                }
            }else if input == "h"{      //heal case
                var k = 1
                exist = 0
                
                let healLength = inventory.inventory[1].count
        
                if healLength == 0{ //If not have any heal in the inventory case
                    print("You don't have any heals")
                    turn += 1
                }else{
                    print("choose the heal you want to use, if you don't want to heal type any key you want")   //heal choice
                        
                    for i in inventory.inventory[1]{
                        print(k,": ",i)                         //inventory printing
                        k += 1
                    }
                    
                    if let healChoice = readLine(), let healChoiceInt = Int(healChoice),  healChoiceInt <= healLength{      //User choice and choice deleting from the inventory
                            
                        let healChosen = inventory.inventory[1][healChoiceInt-1]
                        
                        print("You chose the numbers \(healChoiceInt) which are \(inventory.inventory[1][healChoiceInt-1])")
                            
                        Player1Health += heal.healingPoint(healname: healChosen as! String)
                            
                        inventory.removeHeal(choice: healChoiceInt - 1)
                            
                        print("You now have \(Player1Health) hp")
                            
                        turn += 1
                    }else{
                        turn += 1
                    }
                }
            }else{
                print("command does not exist")
                exist += 1
            }
        }
    }
    
        
    func botplay(){             //Bot play function
        print("It is \(Player2Name)'s turn ! \n")
            
        print("\(Player2Name) hits you \n")
            
        Player1Health -= Player2Attack
            
        }
    }
    
    func getWin() -> Bool{
        return win
    }
    
    func setWinFalse(){
        self.win = false
    }
}
