//
//  GameViewModel.swift
//  Code History
//
//  Created by Sem on 28/08/2023.
//

import SwiftUI

// 1
class GameViewModel: ObservableObject {
    
    // MARK: - Published properties
    // 2
    @Published private var game = Game()
    
    // MARK: - Internal properties
    // 3
    var currentQuestion: Question {
        game.currentQuestion
    }
    // 4
    var questionProgressText: String {
        "\(game.currentQuestionIndex + 1) / \(game.numberOfQuestions)"
    }
    // 5
    var guessWasMade: Bool {
        if let _ = game.guesses[currentQuestion] {
            return true
        } else {
            return false
        }
    }
    //6
    var gameIsOver: Bool {
        game.isOver
    }
    var correctGuesses: Int {
        game.guessCount.correct
    }
    
    var incorrectGuesses: Int {
        game.guessCount.incorrect
    }
    
    // MARK: - Internal Methods
    // 6
    func makeGuess(atIndex index: Int) {
        game.makeGuessForCurrentQuestion(atIndex: index)
    }
    // 7
    func displayNextScreen() {
        game.updateGameStatus()
    }
    func color(forOptionIndex optionIndex: Int) -> Color {
        if let guessedIndex = game.guesses[currentQuestion] {
            if guessedIndex != optionIndex {
                return GameColor.main
            } else if guessedIndex == currentQuestion.correctAnswerIndex {
                return GameColor.correctGuess
            } else {
                return GameColor.incorrectGuess
            }
        } else {
            return GameColor.main
        }
    }
}
