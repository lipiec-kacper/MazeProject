import Foundation
enum xpType{            //Diffrent xp win cases
    case Mob
    case Boss
    case FinalExit
    case MiniGame
}

    
class XpPoints{
    var xp = 0
    
    func addXp(type : xpType){          //xp Points addition
        if type == .Mob {
            self.xp += 20
        }
        
        
        if type == .Boss{
            self.xp += 250
        }
        
        
        if type == .FinalExit{
            self.xp += 1000
        }
        
        
        if type == .MiniGame{
            self.xp += 500
        }
        
        print("You have \(xp)XP")
    }
    
}
