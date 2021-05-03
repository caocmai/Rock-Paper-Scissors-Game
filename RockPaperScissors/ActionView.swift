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
        
        currentState.computerChoice = computerChoice
        
        if button.rawValue == computerChoice {
            return WhoWins.Tie
        }
        
        // how not to use rawValue
        if (button.rawValue == GameOptions.rock.rawValue && computerChoice == GameOptions.scissors.rawValue) || (button.rawValue == GameOptions.paper.rawValue && computerChoice == GameOptions.rock.rawValue) || (button.rawValue == GameOptions.scissors.rawValue && computerChoice == GameOptions.paper.rawValue){
            currentState.scores.playerScore += 1
            return WhoWins.Player
        }
        currentState.scores.computerScore += 1
        return WhoWins.Computer
    }
    
    
}
