//
//  Hangman.swift
//  Hangman
//
//  Created by Jackson Chui on 2/20/20.
//  Copyright © 2020 Tim's Apples. All rights reserved.
//

import Foundation

class Hangman {
    let wwdcArray:[String] = [
        "Good morning",
        "We have developers here",
        "June Fourth",
        "World Wide Developers Conference",
        "San Jose Convention Center",
        "App Store turns ten",
        "This is mind blowing",
        "This is beyond remarkable",
        "the power of code",
        "Everyone Can Code",
        "changing the world",
        "Today is all about software",
        "Craig Federighi",
        "Hair Force One",
        "tens of millions of students",
        "Swift on the App Store",
        "fastest growing programming language",
        "Swift Playgrounds",
        "group of creators",
        "The App Store",
        "Your creativity and hard work",
        "Tim Cook",
        "Split View",
        "Drag and Drop",
        "Slide Over",
        "ARKit",
        "Find My",
        "iMessage",
        "Airpods Pro",
        "Voice Memos",
        "Apple News",
        "Do Not Disturb",
        "Apple Park",
        "Apple Watch Series",
        "Siri Shortcuts",
        "macOS Mojave",
        "macOS Catalina",
        "macOS High Sierra",
        "AMD Vega Pro",
        "Macbook Pro",
        "Core ML",
        "iMac Pro"
    ]
    var wordArray: [String]
    var incorrectGuesses: Int
    var targetWord: String
    var lastGuess: String
    var guessedChars: Set<Character>
    var incorrectGuessesString: String
    var guessSoFar: String
    var duplicate: Bool
    
    struct InfoPlistParser {
        static func getValue(forKey key:String) -> [String] {
            guard let value = Bundle.main.infoDictionary?[key] as? [String] else {
                fatalError()
            }
            return value
        }
    }
//    let dicRoot = NSDictionary.init(contentsOf: (Bundle.main.path(forResource: "Info", ofType: "plist")!))
    // MARK: - Your Code Here
    init() {
        self.wordArray = InfoPlistParser.getValue(forKey: "WordArray")
        self.targetWord = wordArray.randomElement()!
        self.incorrectGuesses = 0
        self.lastGuess = "Last Guess: "
        self.guessedChars = []
        self.incorrectGuessesString = "Incorrect Guesses: "
        self.guessSoFar = String(repeating: "_ ", count: targetWord.count)
        self.duplicate = false
        
    }
    
    
    func makeGuess(guess letter: String) {
        let charInput = Character(letter)
        if guessedChars.contains(charInput) {
            //duplicate, popup saying enter a new word
            self.duplicate = true
        } else {
            self.guessedChars.insert(charInput)
            self.lastGuess = "Last Guess: " + " \(letter)"
            if targetWord.contains(letter) {
                let targetArr = Array(targetWord)
                var guessSoFarArr = Array(guessSoFar)
                for i in 0..<targetArr.count {
                    if targetArr[i] == charInput {
                        guessSoFarArr[i*2] = charInput
                    }
                }
                self.guessSoFar = String(guessSoFarArr)
                
            } else { //incorrect char entered case
                self.incorrectGuesses += 1
                self.incorrectGuessesString = incorrectGuessesString + " \(letter)"
                
                //update UIImage
            }
            
            
        }
    }
    func getIncorrectGuesses() -> Int {
        return self.incorrectGuesses
    }
    func getLastGuess() -> String {
        return self.lastGuess
    }
    func getWord() -> String{
        return self.targetWord
    }
    func getIncorrectGuessesString() -> String {
//        var s = ""
//        for c in self.incorrectGuessesString {
//            s.append("\(c) ")
//        }
//        return s
        return self.incorrectGuessesString
    }
    func getWordLen() -> Int {
        return self.targetWord.count
    }
    
    func reset() -> () {
        self.incorrectGuesses = 0
        self.lastGuess = "Last Guess: "
        self.guessedChars = []
        self.incorrectGuessesString = "Incorrect Guesses: "
        self.guessSoFar = String(repeating: "_ ", count: targetWord.count)
    }
}

