//
//  Game.swift
//  RightOnTarget
//
//  Created by Руслан on 08.07.2024.
//

import UIKit

protocol GameProtocol {
    
    var score: Int { get }
    
    var currentSecretValue: Int { get }
    
    
    
    func calculateScore(with value: Int)
}

class Game: GameProtocol {
    
    var generator = RandomNumberGenerator(startValue: 1, endValue: 50)!
    var round = Round()
    var score: Int = 0
    
   
    var currentSecretValue: Int = 0
    
    
    
    init?(rounds: Int) {
        
//        var round = Round(lastRound: rounds)
        currentSecretValue = generator.getNewSecretValue()
    }
    
    func restartGame() {
        round.currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentSecretValue = generator.getNewSecretValue()
        round.currentRound += 1
    }
    
    
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 + value - currentSecretValue
        } else {
            score += 50
        }
    }
}
