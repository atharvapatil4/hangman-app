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
    //var wordArray: [String]
    var incorrectGuesses: Int
    var targetWord: String
    var lastGuess: String
    var guessedChars: Set<String>
    var incorrectGuessesString: String
    var guessSoFar: String
    
    
    // MARK: - Your Code Here
    init() {
        self.targetWord = wwdcArray.randomElement()!
        self.incorrectGuesses = 0
        self.lastGuess = ""
        self.guessedChars = []
        self.incorrectGuessesString = ""
        self.guessSoFar = String(repeating: "_ ", count: targetWord.count)
    }
    
    
    func makeGuess(guess letter: String) {
        if guessedChars.contains(letter) {
            //duplicate, popup saying enter a new word
            
        } else {
            self.guessedChars.insert(letter)
            self.lastGuess = letter
            if targetWord.contains(letter) {
                // implement update image view
            } else {
                self.incorrectGuesses += 1
                self.incorrectGuessesString = incorrectGuessesString + " \(letter)"
                //update incorrectGuessString label
                //update UIImage
            }
            // update lastGuess label
            
        }
    }
}

