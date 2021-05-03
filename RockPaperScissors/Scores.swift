//
//  Score.swift
//  RockPaperScissors
//
//  Created by Cao Mai on 5/2/21.
//

import Foundation

enum WhoWins: String {
    case Player
    case Computer
    case Tie
}

struct Scores {
    var playerScore: Int
    var computerScore: Int
}
