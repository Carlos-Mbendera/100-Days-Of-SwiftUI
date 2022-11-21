//
//  ContentView.swift
//  edutainment Consolidation III
//
//  Created by Carlos Mbendera on 29/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var score = 0
    @State private var showGameCompleteAlert = false
    
    @State private var gameInProgress = false
    @State private var multiplyTable = 2
    @State private var questionCount = 5
    
    @State private var currentQuestion = 0
    @State private var questions = [Int]()
    @State private var answers = [Int]()
    
    @State private var typedAnswer: Int = 0
    
    private let questionOptions = [5,10,20]
    
    var body: some View {
        
        NavigationView{
            VStack{
                if gameInProgress{
                    Text("Question \(currentQuestion + 1) \n \(multiplyTable) x \(questions[currentQuestion])")
                    TextField("Answer Is ", value: $typedAnswer, format: .number)
                        .keyboardType(.numberPad)
                        .background(.purple)
                        .padding()
                    Button("Next Question", action: nextQuestion).buttonStyle(.borderedProminent)
                    
                }else{
                    List {
                        Section{
                            Stepper("What Do You Want To Practice", value: $multiplyTable, in: 2...12)
                            
                            Picker("How Many Questions?", selection: $questionCount){
                                ForEach(questionOptions, id: \.self){   Text(String($0))    }
                            }
                        }
                    header: { Text("The \(multiplyTable) Table") .font(.headline).padding() }
                        
                    }.toolbar{
                        Button("Start Game", action: startGame)
                            .buttonStyle(.borderedProminent)
                }
                    
                }
            }
            .alert("Game Over", isPresented: $showGameCompleteAlert){
                Button("Nice", action: startGame)
            } message: {
                Text("You got \(score) Correct out of \(questionCount)")
            }
            .navigationTitle("Multiply Gamez")
               
        
        
        }
    }
    
    func startGame(){
        score = 0
        questions.removeAll()
        answers.removeAll()
        for _ in 0...questionCount{
                questions.append(Int.random(in: 2..<13))
        }
        
        withAnimation{gameInProgress.toggle()}
    }
    
    func nextQuestion(){
        if currentQuestion < questionCount{
            
            if typedAnswer == multiplyTable * questions[currentQuestion]{
                score += 1
            }
                
            answers.append(typedAnswer)
            withAnimation{
                currentQuestion  += 1
            }
            print(answers.count)
        }
        else{
            showGameCompleteAlert = true
        }
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
