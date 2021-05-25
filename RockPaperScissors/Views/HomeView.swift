//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Cao Mai on 4/20/21.
//

import SwiftUI

struct HomeView: View {
        
    let buttons: [GameOptions] = [.paper, .rock, .scissors]
    @State private var state = GameOptionState()
    
    var body: some View {
            ForEach(buttons, id: \.self) { button in
                ActionView(button: button, currentState: $state)
                    .padding()
                
            }
            .sheet(isPresented: $state.showView) {
                ResultsView(userPick: $state.userChoice, computerPick: $state.computerChoice, winner: $state.winner, scores: $state.scores)
            }
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

