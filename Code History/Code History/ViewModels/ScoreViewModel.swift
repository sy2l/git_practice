//
//  ScoreViewModel.swift
//  Code History
//
//  Created by Sem on 28/08/2023.
//

import SwiftUI

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
    
    var percentage: Int {
        (correctGuesses * 100 / (correctGuesses + incorrectGuesses))
    }
}



