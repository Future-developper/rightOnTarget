//
//  Round.swift
//  RightOnTarget
//
//  Created by Руслан on 08.07.2024.
//

import UIKit

protocol RoundProtocol {
    
    var lastRound: Int { get }
    
    var currentRound: Int { get }
    
    var isGameEnded: Bool { get }
    
    func restartGame()
    
    func startNewRound()
}

class Round {
    
    var lastRound: Int = 5
    var currentRound: Int = 1
    
//    init?(lastRound: Int) {
//        self.lastRound = lastRound
//        
//    }
    
    var isGameEnded: Bool {
        if self.currentRound >= self.lastRound {
            return true
        } else {
            return false
        }

    }
   
}
