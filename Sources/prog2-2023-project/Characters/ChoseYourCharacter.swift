import Foundation

class ChoseYourCharacter{
    
    enum CharacterType {//Diffrent charachters avalaible
        case scientist
        case guardian
    }

    struct Character {
        var name: String
        var health : Int
        
    }
    var Nameplayer1 = Character(name: "", health: 0)
    
    
    func choseCharacter(Inventory : Inventory){//Choose character function
        var i = 0
            while i != 1 {
                print("Select your character:")
                print("[s] Scientist: Health 80, Weapon: Sword")
                print("[g] Guardian: Health 100, Weapon: Fist")

                if let choice = readLine()?.lowercased() {
                    switch choice {
                    case "s":
                        self.Nameplayer1 = Character(name: "scientist", health: 80)
                        print("You chose: scientist")
                        Inventory.addWeapon(Weapons: .SWORD)
                        Inventory.addHeal(heal: .BANDAGES)
                        i += 1
                    case "g":
                        self.Nameplayer1 = Character(name: "guardian", health: 100)
                        print("You chose guardian")
                        Inventory.addHeal(heal: .BANDAGES)
                        Inventory.addWeapon(Weapons: .FIST)
                        i += 1
                    default:
                        print("\(choice) does not exist")
                    }
                }
            }
        }
    
    func getMyHealth() -> Int{
        return Nameplayer1.health
    }
}
