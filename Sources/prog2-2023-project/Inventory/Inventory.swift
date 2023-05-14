import Foundation

class Inventory{
    var inventory = [[],[]]     //inventory array
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
    
    
    func addWeapon(Weapons : WeaponsAvalaible){ 
        self.inventory[0].append(weapon.weaponName(weaponType: Weapons))
    }
    
    
    func addHeal(heal : HealAvalaible){
        self.inventory[1].append(heals.healName(healType: heal))
    }
    
    
    func removeHeal(choice : Int){
        inventory[1].remove(at: choice)
    }
    

}


