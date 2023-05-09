import Foundation

    enum WeaponsAvalaible{ //find another name class
        
    case AK47
    case M4A1
    case KNIFE
    case GLOCK
    
}

class Weapons{
    
    
func weaponName(weaponType : WeaponsAvalaible) -> String { // do not forget to change the class name
    var name = ""
    
    if weaponType == .AK47{
        name = "AK47"
    }
    
    
    if weaponType == .GLOCK{
        name = "Glock"
    }
    
    
    if weaponType == .KNIFE{
        name = "Knife"
    }
    
    
    if weaponType == .M4A1{
        name = "M4A1"
    }
    
    return name
}
}
