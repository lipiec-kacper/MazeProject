import Foundation

    enum WeaponsAvalaible{ //find another name class
        
    case AK47
    case RPG
    case KNIFE
    case GLOCK
    case FIST
    
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
    
    
    if weaponType == .RPG{
        name = "RPG"
    }
    
    if weaponType == .FIST{
        name = "Fist"
    }
    
    return name
}
    
    
func weaponDamage(weaponType : String) -> Int{ // do not forget to change the class name
    var damage = 0
        
    if weaponType == "AK47"{
        damage = 60
    }
        
        
    if weaponType == "Glock"{
        damage = 40
    }
        
        
    if weaponType == "Knife"{
        damage = 25
    }
        
        
    if weaponType == "RPG"{
        damage = 85
    }
    
    if weaponType == "Fist"{
        damage = 5
    }
        
    return damage
    }
    
    
func weaponMunition(weaponType : String) -> Int { // do not forget to change the class name
    var munition = 0
            
    if weaponType == "AK47"{
        munition = 30
    }
            
            
    if weaponType == "Glock"{
        munition = 9
    }
            
            
    if weaponType == "Knife"{
        munition = 20
    }
            
            
    if weaponType == "RPG"{
        munition = 1
    }
    
    if weaponType == "Fist"{
        munition = 100
    }
            
    return munition
    }
}
