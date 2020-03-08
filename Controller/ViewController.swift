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
    
    
    
    @IBOutlet weak var HangmanImage: UIImageView!
    @IBOutlet weak var wordSoFar: UILabel!
    @IBOutlet weak var incorrectGuessField: UILabel!
    @IBOutlet weak var lastGuessField: UILabel!
    @IBOutlet weak var storeCurrGuess: UITextField!
    // MARK: - Class Props/Vars
    
    
    // MARK: - IBActions
    @IBAction func exitWasPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "backToHome", sender: sender)
    }


    @IBAction func guessEntered(_ sender: UITextField) {
    }
    
    @IBAction func restartWasPressed(_ sender: Any) {
        reset()
    }
    @IBAction func guessWasPressed(_ sender: UIButton) {
        playTurn()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        wordSoFar.text = hangman.guessSoFar
        incorrectGuessField.text = hangman.incorrectGuessesString
        lastGuessField.text = hangman.lastGuess
        HangmanImage.image = UIImage(named: "hangman1")
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - Class Methods
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    private func reset() -> Void {
        hangman = Hangman()
        wordSoFar.text = hangman.guessSoFar
        incorrectGuessField.text = hangman.incorrectGuessesString
        lastGuessField.text = hangman.lastGuess
        //update image
        HangmanImage.image = UIImage(named: "hangman1")
    }
    
    private func playTurn() -> Void {
        if let char = storeCurrGuess.text {
            if char.count == 1 {
                hangman.makeGuess(guess: char)
                //update attributes from hangman
                if hangman.duplicate {
                    let alertController = UIAlertController(title: "Oops! You already guessed that letter", message:
                             "Please enter a new a guess", preferredStyle: .alert)
                         alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

                         self.present(alertController, animated: true, completion: nil)
                    hangman.duplicate = false
                } else {
                    if hangman.getIncorrectGuesses() > 6 {
                        //end game
                        let alertController = UIAlertController(title: "Ran out of guesses!", message: "The word was \(hangman.getWord())", preferredStyle: .alert)
                            
                        alertController.addAction(UIAlertAction(title:"OK", style: .default, handler:  { action in self.performSegue(withIdentifier: "backToHome", sender: self) }))

                            self.present(alertController, animated: true, completion: nil)
                    } else {
                        self.incorrectGuessField.text =  hangman.getIncorrectGuessesString()
                        self.lastGuessField.text = hangman.getLastGuess()
                        self.wordSoFar.text = hangman.guessSoFar
                        //update image
                        HangmanImage.image = UIImage(named: "hangman\(1+hangman.getIncorrectGuesses())")
                    }
                }
            } else {
                let alertController = UIAlertController(title: "Too many guesses", message:
                    "Please enter one letter", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    private func endGame() -> Void {
        //make end game screen
        return }

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
