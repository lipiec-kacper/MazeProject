import Foundation

    enum WeaponsAvalaible{      //Diffrent weapons avalaible
        
    case AK47
    case RPG
    case KNIFE
    case GLOCK
    case FIST
    case SWORD
    
}

class Weapons{
    
    
func weaponName(weaponType : WeaponsAvalaible) -> String {  //Weapons name function
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
    
    if weaponType == .SWORD{
        name = "Sword"
    }
    
    return name
}
    
    
func weaponDamage(weaponType : String) -> Int{  //Damage of weapon function
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
        damage = 15
    }
    
    if weaponType == "Sword"{
        damage = 25
    }
        
    return damage
    }
    
}
