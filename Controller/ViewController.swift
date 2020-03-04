//
//  HangmanViewController
//  Hangman
//
//  Created by iOS Decal on Feb 11 2020.
//  Copyright © 2020 iosdecal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Instances: Models
    var hangman = Hangman()
        
    // MARK: - IBOutlets
    
    
    @IBOutlet weak var incorrectGuessField: UILabel!
    @IBOutlet weak var lastGuessField: UILabel!
    @IBOutlet weak var wordSoFar: UILabel!
    @IBOutlet weak var storeCurrGuess: UITextField!
    // MARK: - Class Props/Vars
    var currCharGuess: String = ""
    
    // MARK: - IBActions
    
    @IBAction func guessWasPressed(_ sender: UIButton) {
        playTurn()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: - Class Methods

    
    private func reset() -> Void {
        hangman = Hangman()
        
    }
    
    private func playTurn() -> Void {
        if let char = storeCurrGuess.text {
            if char.count == 1 {
                hangman.makeGuess(guess: char)
                //update attributes from hangman
                incorrectGuessesField.text! = hangman.incorrectGuessesString
                lastGuessField.text! = hangman.lastGuess
                wordSoFar.text! = hangman.guessSoFar
                
            }
        }
    }
    private func endGame() -> Void { return }

    // Optional Example Code, but might be useful...
    
    
    /* PREPARING AND PRESENTING A SEGUE (TRANSITION)
     ... { _ in
         // Segue to the high score screen
         CATransaction.setCompletionBlock({
             self.performSegue(withIdentifier: "ExampleSegue", sender: nil)
         })
     }
     
    self.present(endGameAlert, animated: true, completion: nil)
     
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1. Get the new view controller using segue.destination.
        // 2. Pass the selected object to the new view controller.
        if let dest = segue.destination as? EndGameViewController {
            dest.userScore = counter
        }
    */
    
}
