//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Arya Atighehchian on 7/9/18.
//  Copyright © 2018 Arya Atighehchian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var activePlayer = 1 //cross
    var gameState = [0,0,0,0,0,0,0,0,0]
    var gameIsActive = true
    
    @IBOutlet weak var winnerLabel: UILabel!
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBAction func action(_ sender: AnyObject) {
        if (gameState[sender.tag-1] == 0 && gameIsActive == true){
            gameState[sender.tag-1] = activePlayer
            if (activePlayer == 1){
                (sender as AnyObject).setImage(UIImage(named: "cross"), for: UIControlState())
                activePlayer = 2
            } else {
                (sender as AnyObject).setImage(UIImage(named: "circle"), for: UIControlState())
                activePlayer = 1
            }
        }
        
        for combo in winningCombinations {
            if (gameState[combo[0]] != 0 && gameState[combo[0]] == gameState[combo[1]] && gameState[combo[1]] == gameState[combo[2]]){
                gameIsActive = false
                if gameState[combo[0]] == 1 {
                    //cross won
                    print("cross")
                    winnerLabel.text = "Cross has won!"
                
                } else {
                    //circle won
                    print("circle")
                    winnerLabel.text = "Circle has won!"
                    
                }
                winnerLabel.isHidden = false
                playAgainButton.isHidden = false
            }
            
        }
        gameIsActive = false
        for i in gameState {
            if i == 0 {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false {
            winnerLabel.text = "It was a Draw!"
            winnerLabel.isHidden = false
            playAgainButton.isHidden = false
        }
        
    }
   
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil,for: UIControlState())
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

