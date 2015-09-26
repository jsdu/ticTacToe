//
//  ViewController.swift
//  ticTacToe
//
//  Created by Jason Du on 2014-12-25.
//  Copyright (c) 2014 Jason Du. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button0: UIButton!

    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8],
                               [0,3,6], [1,4,7], [2,5,8],
                               [0,4,8], [2,4,6]]
    
    
    var goNum = 0
    
    var winner = 0
    
    // 0 = empty, 1 = nought, 2 = cross
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    @IBOutlet var playerTurn: UILabel!
    
    @IBOutlet var winLabel: UILabel!
    
    @IBOutlet var playAgain: UIButton!
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        goNum = 0
        
        playAgain.alpha = 0
        winLabel.text = ""
        winner = 0
        playerTurn.text = "X turn"
        gameState = [0,0,0,0,0,0,0,0,0]
        
        var button : UIButton
        
        for var i = 0; i < 9; i++ {
        
        button = view.viewWithTag(i) as! UIButton
            
        button.setImage(nil, forState: .Normal)
            
        }
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        var image = UIImage()
        
        if (gameState[sender.tag]==0 && winner == 0){
        
            if (goNum % 2 == 0) {
            
                image = UIImage(named: "x.png")!
                gameState[sender.tag] = 2
                playerTurn.text = "O turn"
            
            } else {
            
                image = UIImage(named: "o2.png")!
                gameState[sender.tag] = 1
                playerTurn.text = "X turn"
            
            }
            
            goNum++
            sender.setImage(image, forState: .Normal)
            
            for combination in winningCombinations {
                
                if gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] &&
                    gameState[combination[0]] != 0 {
                        
                    winner = gameState[combination[1]]
                        
                }
                
            }
            
            if  winner != 0 || goNum == 9 {
                if winner == 1 {
                    winLabel.text = "O won"
                } else if winner == 2 {
                    winLabel.text = "X won"
                } else {
                    winLabel.text = "Draw"
                }
                playAgain.alpha = 1
            }
            
        }
}
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        playAgain.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

