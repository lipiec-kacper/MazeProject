import Foundation
    
enum BossType {
    case Slime  //60hp 8d
    case RatKing    //80hp  12d
    case ChainChomper //50hp    10d
    case LivingShadow   // 80hp 15d
    case WanderingEye   //40hp  5d
    case HypnoticSpecter    //150hp Boss 1  20d
    case GelatinousCube //400hp BossFinal 40d
}
class Boss{
    
    struct BossCharacter {
        var name: String
        var health : Int
        var attack : Int
    }
    
    
    
    func bossName(bossType : BossType) -> String { // do not forget to change the class name
        var name = ""
        
                
        if bossType == .Slime{
            name = "Slime"
        }
                
        
        if bossType == .RatKing{
            name = "Rat King"
        }
        
        
        if bossType == .ChainChomper{
            name = "Chain Chomper"
        }
        
        
        if bossType == .LivingShadow{
            name = "Living Shadow"
        }
        
        
        if bossType == .WanderingEye{
            name = "Wandering Eye"
        }
        
        
        if bossType == .HypnoticSpecter{
            name = "Hypnotic Specter"
        }
        
        
        if bossType == .GelatinousCube{
            name = "Gelatinous Cube"
        }
        
        return name
        }
    
    
    
    func bossHealth(bossType : BossType) -> Int { // do not forget to change the class name
        var health = 0
        
                
        if bossType == .Slime{
            health = 60
        }
                
        
        if bossType == .RatKing{
            health = 80
        }
        
        
        if bossType == .ChainChomper{
            health = 50
        }
        
        
        if bossType == .LivingShadow{
            health = 80
        }
        
        
        if bossType == .WanderingEye{
            health = 40
        }
        
        
        if bossType == .HypnoticSpecter{
            health = 120
        }
        
        
        if bossType == .GelatinousCube{
            health = 140
        }
        
        return health
        }
    
    
    func bossDamage(bossType : BossType) -> Int { // do not forget to change the class name
        var damage = 0
        
                
        if bossType == .Slime{
            damage = 8
        }
                
        
        if bossType == .RatKing{
            damage = 12
        }
        
        
        if bossType == .ChainChomper{
            damage = 10
        }
        
        
        if bossType == .LivingShadow{
            damage = 15
        }
        
        
        if bossType == .WanderingEye{
            damage = 5
        }
        
        
        if bossType == .HypnoticSpecter{
            damage = 20
        }
        
        
        if bossType == .GelatinousCube{
            damage = 40
        }
        
        return damage
        }
    
}
