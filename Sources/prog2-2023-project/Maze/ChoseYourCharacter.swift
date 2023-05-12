import Foundation

class ChoseYourCharacter{
    enum CharacterType {
        case scientist
        case guardian
    }

    struct Character {
        var name: String
        var health : Int
        var attack : Int
        
    }
    var Nameplayer1 = Character(name: "", health: 0, attack: 0)
    
    
        func choseCharacter(){
        var i = 0
            while i != 1 {
                print("Select your character:")
                print("[s] Scientist")
                print("[g] Guardian")

                if let choice = readLine()?.lowercased() {
                    switch choice {
                    case "s":
                        self.Nameplayer1 = Character(name: "scientist", health: 80, attack: 70)
                        print("You chose: scientist")
                        i += 1
                    case "g":
                        self.Nameplayer1 = Character(name: "guardian", health: 100, attack: 40)
                        print("You chose guardian")
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
    
    func getMyAttack() -> Int{
        return Nameplayer1.attack
    }
}
