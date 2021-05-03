//
//  GameOptions.swift
//  RockPaperScissors
//
//  Created by Cao Mai on 5/2/21.
//

import Foundation


struct GameOptionState {
    var storedAction: GameOptions!
    var showView: Bool = false
    var winner: WhoWins!
    var userChoice: String?
    var computerChoice: String?
    var scores: Scores = Scores(playerScore: 0, computerScore: 0)
}

enum GameOptions: String {
    case rock = "rock"
    case paper = "paper"
    case scissors = "scissors"
    
}
