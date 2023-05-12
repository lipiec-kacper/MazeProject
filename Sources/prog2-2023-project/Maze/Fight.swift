import Foundation
class Fight{
    
    var win = false
    
    func start(character : ChoseYourCharacter, boss: BossType, inventory : Inventory){
        let bossinfos = Boss()
        let weapons = Weapons()
        let heal = Heal()
        
        var Player1Name = character.Nameplayer1.name
        var Player1Health = character.Nameplayer1.health
        let Player1Attack = character.Nameplayer1.attack
        
        let Player2Name = bossinfos.bossName(bossType: boss)
        var Player2Health = bossinfos.bossHealth(bossType: boss)
        let Player2Attack = bossinfos.bossDamage(bossType: boss)
        
        var turn = 0
        let weaponsLenght = 0
        var exist = 0
        
        print("\(Player2Name) wants to fight with you (Attack = a) (Heal = h)")
        
            
        while Player2Health >= 0 || Player1Health >= 0{
            if turn > 0{
                print("It your turn do you want to attack or to heal ? (Attack = a) (Heal = h)")
            }
            
            if exist > 0{
                print("\(Player2Name) wants to fight with you (Attack = a) (Heal = h)")
            }
            
            
            if let input = readLine()?.lowercased(){
                
                if input == "a"{
                    var j = 1
                    let weaponsLength = inventory.inventory[0].count
                    var choice = 0
                    
                    print("Chose the weapon that you want to use")
                    
                    for i in inventory.inventory[0]{
                        print(j,": ",i)
                        j += 1
                    }
                    
                    
                if let choice = readLine(), let choiceInt = Int(choice), choiceInt <= weaponsLength {
                    let weaponChoice = inventory.inventory[0][choiceInt-1]
                    
                    print("You chose the number \(choiceInt) which is a \(inventory.inventory[0][choiceInt-1])")
                        
                    print("\(Player2Name) has \(Player2Health)")
                        
                    Player2Health -= weapons.weaponDamage(weaponType: weaponChoice as! String)
                        
                        
                    if Player2Health <= 0 {
                        self.win = true
                        print("You killed \(Player2Name)")
                        break
                    }
                        
                        
                    else{
                        print("You hit him, he has \(Player2Health)hp")
                        turn += 1

                        botplay()
                                
                        if Player1Health <= 0{
                            print("You lost the fight")
                            break
                        }else{
                            print("You have \(Player1Health)hp")
                            }
                        }
                    }else{
                        print("command do not exist")
                        turn += 1
                    }
                }else if input == "h"{
                    let healLength = inventory.inventory[1].count
                    var k = 1
                    var healChoice = 0
                                
                    print("chose the heal that you want to use")
                    
                    for i in inventory.inventory[1]{
                        print(k,": ",i)
                        k += 1
                    }
                    
                    
                    if let healChoice = readLine(), let healChoiceInt = Int(healChoice), healChoiceInt <= healLength{
                        let healChosen = inventory.inventory[1][healChoiceInt-1]
                        
                        print("You chose the number \(healChoiceInt) which are \(inventory.inventory[1][healChoiceInt-1])")
                        
                        Player1Health += heal.healingPoint(healname: healChosen as! String)
                        
                        print("You have now \(Player1Health) hp")
                        
                        turn += 1
                    }else{
                        print("command do not exist")
                        turn += 1
                    }
                }else{
                    print("command do not exist")
                    exist += 1
                }
            }
        }
    
        
        func botplay(){
            print("It is \(Player2Name) turn !")
            
            print("\(Player2Name) hits you")
            
            Player1Health -= Player2Attack
            
        }
    }
    
    func getWin() -> Bool{
        return win
    }
}
