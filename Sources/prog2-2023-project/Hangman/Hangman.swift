//import Foundation
//func playHangman() {
//    //let words = [] -> need to put the words to guess in there
//    let word = words.randomElement()!.lowercased()
//    
//    var guessedLetters = Set<Character>()
//    var incorrectGuesses = 0
//    
//    while incorrectGuesses < 6 {
//        func printWord() {
//            var wordToShow = ""
//            for letter in word {
//                if guessedLetters.contains(letter) {
//                    wordToShow += "\(letter) "
//                } else {
//                    wordToShow += "_ "
//                }
//            }
//            print(wordToShow)
//        }
//        
//        printWord()
//        print("Enter a letter:")
//        let input = readLine()!
//        let letter = Character(input.lowercased())
//        
//        if guessedLetters.contains(letter) {
//            print("You already guessed that letter!")
//        } else if word.contains(letter) {
//            guessedLetters.insert(letter)
//            if !word.contains(where: { !guessedLetters.contains($0) }) {
//                print("You win!")
//                printWord()
//                return
//            }
//        } else {
//            incorrectGuesses += 1
//            print("Incorrect! You have \(6 - incorrectGuesses) guesses left.")
//        }
//    }
//    
//    print("Game over! The word was '\(word)'.")
//
//}
