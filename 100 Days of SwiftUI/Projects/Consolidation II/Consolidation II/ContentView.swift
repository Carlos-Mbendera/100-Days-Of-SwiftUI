//
//  ContentView.swift
//  Consolidation II
//
//  Created by Carlos Mbendera on 09/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    let choices = ["Rock", "Paper","Scissors"]
    
    @State private var alertShow = false
    
    @State private var playerChoice = "Rock"
    
    @State private var gameCounter = 0
    @State private var wins = 0
    
 

    var body: some View {
        var randomChoice = choices.randomElement()
        
        NavigationView{
            VStack() {
                Spacer()
                Text("Score : \(wins)").font(.title.bold())
                Text("What's your choice?")
                
                Picker("Options", selection: $playerChoice){
                    ForEach(choices, id: \.self){
                        Text($0)
                    }
                }.padding()
                
                
                Button("Submit"){
                    alertShow  = true
                    gameCounter += 1
                }
                    .foregroundColor(.red)
                    .buttonStyle(.bordered)
                    .alert("What are the odds?", isPresented: $alertShow){
                        Button("OK"){
                            if playerChoice == randomChoice! { wins += 1 } else {wins -= 1}
                            if gameCounter == 10{
                                
                                gameCounter = 0
                                wins = 0
                            }
                        }
                    }
            message: {
                if gameCounter < 10 {
                    Text(  playerChoice == randomChoice! ? "YOU WON!!! \n Wins are \(wins) / \(gameCounter)" : "Sadly, You Lost! -1 point  \(wins) / \(gameCounter)" )
                }else{
                    Text("GAME OVER")
                }
                        }
                    
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
            }.navigationTitle(" Rock, Paper, Scissors")
        }
    }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
