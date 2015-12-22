//
//  ViewController.swift
//  RistinollaUltimate
//
//  Created by Ville-Matti Hakanpää on 20/12/15.
//  Copyright © 2015 Ville-Matti Hakanpää. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // PROPERTIES
    var playerTurn = 1;
    var gameTokenImage = UIImage(named: "0")
    
    // Initialize gameBoard
    var gameBoard = [Int](count: 82, repeatedValue: 0)
    
    // Determine winning conditions
    let winningConditions =
        // Vertical
        [[1,2,3,4], [2,3,4,5], [3,4,5,6], [4,5,6,7], [5,6,7,8], [6,7,8,9],
        [10,11,12,13], [11,12,13,14], [12,13,14,15], [13,14,15,16], [14,15,16,17], [15,16,17,18],
        [19,20,21,22], [20,21,22,23], [21,22,23,24], [22,23,24,25], [23,24,25,26], [24,25,26,27],
        [28,29,30,31], [29,30,31,32], [30,31,32,33], [31,32,33,34], [32,33,34,35], [33,34,35,36],
        [37,38,39,40], [38,39,40,41], [39,40,41,42], [40,41,42,43], [41,42,43,44], [42,43,44,45],
        [46,47,48,49], [47,48,49,50], [48,49,50,51], [49,50,51,52], [50,51,52,53], [51,52,53,54],
        [55,56,57,58], [56,57,58,59], [57,58,59,60], [58,59,60,61], [59,60,61,62], [60,61,62,63],
        [64,65,66,67], [65,66,67,68], [66,67,68,69], [67,68,69,70], [68,69,70,71], [69,70,71,72],
        [73,74,75,76], [74,75,76,77], [75,76,77,78], [76,77,78,79], [77,78,79,80], [78,79,80,81],
            
        // Horizontal
        [1,10,19,28], [10,19,28,37], [19,28,37,46], [28,37,46,55], [37,46,55,64], [46,55,64,73],
        [2,11,20,29], [11,20,29,38], [20,29,38,47], [29,38,47,56], [38,47,56,65], [47,56,65,74],
        [3,12,21,30], [12,21,30,39], [21,30,39,48], [30,39,48,57], [39,48,57,66], [48,57,66,75],
        [4,13,22,31], [13,22,31,40], [22,31,40,49], [31,40,49,58], [40,49,58,67], [49,58,67,76],
        [5,14,23,32], [14,23,32,41], [23,32,41,50], [32,41,50,59], [41,50,59,68], [50,59,68,77],
        [6,15,24,33], [15,24,33,42], [24,33,42,51], [33,42,51,60], [42,51,60,69], [51,60,69,78],
        [7,16,25,34], [16,25,34,43], [25,34,43,52], [34,43,52,61], [43,52,61,70], [52,61,70,79],
        [8,17,26,35], [17,26,35,44], [26,35,44,53], [35,44,53,62], [44,53,62,71], [53,62,71,80],
        [9,18,27,36], [18,27,36,45], [27,36,45,54], [36,45,54,63], [45,54,63,72], [54,63,72,81],
            
        // Sideways
        [46,56,66,76],
        [37,47,57,67], [47,57,67,77],
        [28,38,48,58], [38,48,58,68], [48,58,68,78],
        [19,29,39,49], [29,39,49,59], [39,49,59,69], [49,59,69,79],
        [10,20,30,40], [20,30,40,50], [30,40,50,60], [40,50,60,70], [50,60,70,80],
        [1,11,21,31], [11,21,31,41], [21,31,41,51], [31,41,51,61], [41,51,61,71], [51,61,71,81],
        [2,12,22,32], [12,22,32,42], [22,32,42,52], [32,42,52,62], [42,52,62,72],
        [3,13,23,33], [13,23,33,43], [23,33,43,53], [33,43,53,63],
        [4,14,24,34], [14,24,34,44], [24,34,44,54],
        [5,15,25,35], [15,25,35,45],
        [6,16,26,36],
        [4,12,20,28],
        [5,13,21,29], [13,21,29,37],
        [6,14,22,30], [14,22,30,38], [22,30,38,46],
        [7,15,23,31], [15,23,31,39], [23,31,39,47], [31,39,47,55],
        [8,16,24,32], [16,24,32,40], [24,32,40,48], [32,40,48,56], [40,48,56,64],
        [9,17,25,33], [17,25,33,41], [25,33,41,49], [33,41,49,57], [41,49,57,65], [49,57,65,73],
        [18,26,34,42], [26,34,42,50], [34,42,50,58], [42,50,58,66], [50,58,66,74],
        [27,35,43,51], [35,43,51,59], [43,51,59,67], [51,59,67,75],
        [36,44,52,60], [44,52,60,68], [52,60,68,76],
        [45,53,61,69], [53,61,69,77],
        [54,62,70,78]
    ]
    
    // Victoryscreen outlets
    @IBOutlet weak var victoryScreen: UIView!
    @IBOutlet weak var victoryScreenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // At first, lets hide the victory screen.
        victoryScreen.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // When any of the gameBoard's buttons are pressed.
    @IBAction func boardButtonPressed(sender: AnyObject) {
        
        // Check if there no value on that spot in the game board already,
        if gameBoard[sender.tag] == 0 {
            
            // Set the correct value to the gameBoard.
            gameBoard[sender.tag] = self.playerTurn
            
            // Insert current game token
            sender.setImage(gameTokenImage, forState: .Normal)
            
            // Disable button
            let button = sender as! UIButton
            button.enabled = false
            
            // Check if we have a winner
            if checkWinner() {
                print("We have a WINNER!!!")
                victoryScreen.hidden = false
                if playerTurn == 1 {
                    victoryScreenLabel.text = "Circles Win!"
                } else {
                    victoryScreenLabel.text = "Crosses Win!"
                }
                return
            }
            
            // Check if gameBoard is full
            if self.gameBoardFull() {
                victoryScreen.hidden = false
                victoryScreenLabel.text = "We have a DRAW!!!"
            }
            
            // Change turn
            changeTurn()
        }
    }

    // Function for reseting the game.
    @IBAction func resetGame(sender: AnyObject) {
        
        // Reset gameBoard
        for var x = 1; x <= 81; x++ {
            
            // Clear cliked areas
            let token = self.view.viewWithTag(x) as! UIButton
            token.setImage(nil, forState: .Normal)
            
            // Enable buttons
            token.enabled = true
        }
        
        // Recreate gameboard array
        gameBoard = [Int](count: 82, repeatedValue: 0)
        
        // Set player to 1
        self.playerTurn = 1
        gameTokenImage = UIImage(named: "0")
        
        // Make sure voctory screen is hidden.
        victoryScreen.hidden = true
        
    }
    
    // Change player token and player id.
    func changeTurn() {
        
        if self.playerTurn == 1 {
            self.playerTurn = 2
            gameTokenImage = UIImage(named: "X")
            
            
        } else {
            self.playerTurn = 1
            gameTokenImage = UIImage(named: "0")
        }
    }
    
    // Function for checking if our board full.
    func gameBoardFull() -> Bool {
        
        // Counter for how many tokens are active.
        var gameEnded = 0
        
        // Lets check how many tokens there actualy are.
        for var x = 1; x <= 81; x++ {
            if self.gameBoard[x] != 0 {
                
                // Every time token is find, add one to the counter
                gameEnded++
            }
        }
        
        // If board is NOT full
        if gameEnded != 81 {
            
            // return false
            return false
        } else {
            
            // return true if it's full
            return true
        }
    }
    
    // Check if we have a winner
    func checkWinner() -> Bool {
        
        // Loop through all winning conditions
        for condition in winningConditions {
            
            // If one of the conditions is filled
            if gameBoard[condition[0]] != 0 && gameBoard[condition[0]] == gameBoard[condition[1]] && gameBoard[condition[1]] == gameBoard[condition[2]] && gameBoard[condition[2]] == gameBoard[condition[3]] {
                
                // We have a winner!
                return true
            }
        }
        
        // If no mach found, continue game.
        return false
    }
}

