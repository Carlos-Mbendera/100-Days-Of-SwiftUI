//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Carlos Mbendera on 05/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var doneGame = false
    @State private var gameCounter = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var flagChoice = 0
    
  @State private  var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
  @State private  var correctAnswer = Int.random(in: 0...2)
    
    func resetGame(){
        gameCounter = 0
        score = 0
        countries.shuffle()
    }
    
    
    func flagTapped(_ number: Int){
        
        flagChoice = number
        if number == correctAnswer{
            scoreTitle = "Correct"
            score += 1
        }else{
            scoreTitle = "Wrong"
        }
        
        gameCounter += 1
        if gameCounter == 8{
            doneGame = true
            } else{
            showingScore = true
        }
    }
    
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag").font(.largeTitle.weight(.bold)).foregroundColor(.white)
                Spacer()
                Spacer()
                Text("Score = \(score)").foregroundColor(.white).font(.title.bold())
                Spacer()
                
                VStack(spacing: 15){
                    
                    VStack {
                       
                        Text("Tap The Flag Of").foregroundColor(.white).font(.subheadline.weight(.heavy))
                        Text((countries[correctAnswer])).foregroundColor(.white).font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3){ number in
                        Button{
                           flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                .shadow(radius: 5)
                        }
                    }
                }
              
            }.padding()
            
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            (scoreTitle == "Wrong") ?  Text("That's the flag of \(countries[flagChoice])") : Text("Your score is \(score)")
          
        }.alert("Game Over", isPresented: $doneGame){
            Button("Reset", action: resetGame)
        }message: {
            Text("Your score was \(score) / 8")
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
