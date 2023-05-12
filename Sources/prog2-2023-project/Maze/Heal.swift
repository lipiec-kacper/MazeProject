import Foundation

enum HealAvalaible{ //find another name class
    
    case BANDAGES
    case MEDIKIT
    
}

class Heal{
    func healName(healType : HealAvalaible) -> String{
        var name = ""
        
        if healType == .BANDAGES{
            name = "Bandages"
        }
        if healType == .MEDIKIT{
            name = "MediKit"
        }
        
        return name
    }
    
    func healingPoint(healname : String) -> Int{
        var healingPoints = 0
        
        if healname == "Bandages"{
            healingPoints = 15
        }
        if healname == "MediKit"{
            healingPoints = 40
        }
        
        return healingPoints
    }
}
