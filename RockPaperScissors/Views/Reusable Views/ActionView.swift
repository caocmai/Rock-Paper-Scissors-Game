//
//  ActionView.swift
//  RockPaperScissors
//
//  Created by Cao Mai on 5/2/21.
//

import SwiftUI

struct ActionView: View {
    let button: GameOptions
    @Binding var currentState: GameOptionState
    
    var body: some View {
        Button(action: {
            self.tapped()
        }, label: {
            Image(button.rawValue)
        })
    }
    
    func tapped(){
        currentState.storedAction = button
        currentState.userChoice = button.rawValue
        currentState.winner = checkWinner()
        currentState.showView.toggle()
    }
    
    func checkWinner() -> WhoWins {
        let choices: [GameOptions] = [.rock, .paper, .scissors]
        let computerIndex = Int.random(in: 0...2)
        let computerChoice = choices[computerIndex].rawValue
        let userChoice = button.rawValue
        
        currentState.computerChoice = computerChoice
        
        if userChoice == computerChoice {
            return WhoWins.Tie
        }
        
        // how not to use rawValue?
        if (userChoice == GameOptions.rock.rawValue && computerChoice == GameOptions.scissors.rawValue)
            || (userChoice == GameOptions.paper.rawValue && computerChoice == GameOptions.rock.rawValue)
            || (userChoice == GameOptions.scissors.rawValue && computerChoice == GameOptions.paper.rawValue)
        {
            currentState.scores.playerScore += 1
            return WhoWins.Player
        }
        currentState.scores.computerScore += 1
        return WhoWins.Computer
    }
    
    
}
