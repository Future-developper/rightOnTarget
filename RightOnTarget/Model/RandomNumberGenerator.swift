//
//  RandomNumberGenerator.swift
//  RightOnTarget
//
//  Created by Руслан on 08.07.2024.
//

import UIKit

protocol RandomNumberGeneratorProtocol {
    
    func getNewSecretValue() -> Int
}

class RandomNumberGenerator: RandomNumberGeneratorProtocol {
    
    private var minSecretValue: Int
    private var maxSecretValue: Int
    
    init?(startValue: Int, endValue: Int) {
        guard startValue <= endValue else {
            return nil
        }
        minSecretValue = startValue
        maxSecretValue = endValue
    }
    
    func getNewSecretValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
    
    
}
