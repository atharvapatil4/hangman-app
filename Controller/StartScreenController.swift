//
//  StartScreenController.swift
//  Hangman
//
//  Created by Atharva Patil on 3/3/20.
//  Copyright © 2020 Tim's Apples. All rights reserved.
//

import UIKit

class StartScreenController: UIViewController {
    
    
    @IBAction func StartButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "playGame", sender: sender)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let identifier  = segue.identifier {
//            if identifier == "playGame" {
//
//            }
//        }
//
//    }
}
