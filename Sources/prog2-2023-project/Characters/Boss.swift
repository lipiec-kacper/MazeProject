import Foundation
    
enum BossType { //Diffrent not very strong bosses
    case Slime
    case RatKing
    case ChainChomper
    case LivingShadow
    case WanderingEye
    
    //Diffrent strong Bosses
    case HypnoticSpecter
    case GelatinousCube
    case MargittheFellOmen
    case RedWolfofRadagon
    case RennalaQueenoftheFullMoon
}
class Boss{
    
    struct BossCharacter {
        var name: String
        var health : Int
        var attack : Int
    }
    
    
    
    func bossName(bossType : BossType) -> String { //Bosses names
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
        
        
        if bossType == .MargittheFellOmen{
            name = "Margit the Fell Omen"
        }
        
        
        if bossType == .RedWolfofRadagon{
            name = "Red Wolf of Radagon"
        }
        
        
        if bossType == .RennalaQueenoftheFullMoon{
            name = "Rennala Queen of the Full Moon"
        }
        
        return name
        }
    
    
    
    func bossHealth(bossType : BossType) -> Int { // Bosses health points
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
            health = 150
        }
        
        
        if bossType == .GelatinousCube{
            health = 400
        }
        
        
        if bossType == .MargittheFellOmen{
            health = 300
        }
        
        
        if bossType == .RedWolfofRadagon{
            health = 800
        }
        
        
        if bossType == .RennalaQueenoftheFullMoon{
            health = 500
        }
        
        
        return health
        }
    
    
    func bossDamage(bossType : BossType) -> Int { // Bosses attack damages
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
            damage = 22
        }
        
        
        if bossType == .MargittheFellOmen{
            damage = 25
        }
        
        
        if bossType == .RedWolfofRadagon{
            damage = 41
        }
        
        
        if bossType == .RennalaQueenoftheFullMoon{
            damage = 33
        }
        
        return damage
        }
    
}
