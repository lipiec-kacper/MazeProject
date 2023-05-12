import Foundation

class Inventory{
    //Size of inventory
    var inventory = [[],[]]
    let weapon = Weapons()
    let heals = Heal()
    
    func getInventory(){
        for line in inventory{
            print(line)
        }
    }
    
    
    func getWeapons(){
        print(inventory[0])
    }
    
    
    func getHeals(){
        print(inventory[1])
    }
    
    
    func addWeapon(Weapons : WeaponsAvalaible){ // modify the name of the enum class weaponss
        inventory[0].append(weapon.weaponName(weaponType: Weapons))
    }
    
    
    func addHeal(heal : HealAvalaible){
        inventory[1].append(heals.healName(healType: heal))
    }
    

}


