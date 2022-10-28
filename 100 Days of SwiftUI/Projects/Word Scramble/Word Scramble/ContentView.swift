//
//  ContentView.swift
//  Word Scramble
//
//  Created by Carlos Mbendera on 20/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rootWord: String = ""
    @State private var newWord: String = ""
    @State private var usedWords = [String]()
    private var score: String {
        var score = 0
        for word in usedWords{
          score += word.count * 2
        }
        
        if usedWords.count > 10{
            score = score * 2
        }
        
        return "Your score is \(score)"
    }
    
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationView{
            
            VStack {
                
                TextField("Answers Come Here", text: $newWord, prompt: Text("Answer Me Mate") )
                    .textInputAutocapitalization(.never)
                
                Text(score).font(.title)
                
                    
                List(usedWords, id: \.self) { word in
                    HStack{
                        Text(word)
                        Image(systemName: "\(word.count).circle")
                    }
                }
                
            }
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            
            .alert(errorTitle, isPresented: $showingError){
                Button("OK", role: .cancel){}
            }message: {
                Text(errorMessage)
            }
            
            .padding()
            
            .toolbar{
                Button("New Game", action: startGame)
            }
            
            .navigationTitle(rootWord)
        }
        
    }    //View Body End Here
    
    func addNewWord(){
        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
           let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

           // exit if the remaining string is empty
           guard answer.count > 0 else { return }
        
        guard isDifferent(word: answer) else{
            wordError(title: "That's the root word", message: "That's cheating! \n xD")
            return
        }

        
        guard isNotShort(word: answer)else{
            wordError(title: "Word is too short", message: "More letters Please :)")
            return
        }
          
        guard isReal(word: answer) else{
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation{
            usedWords.insert(answer, at: 0)
        }
            newWord = ""
        
    }//Add new word ends here
    
    func isDifferent(word: String) -> Bool{
        word != rootWord
    }
    
    func isNotShort(word: String) -> Bool{
        word.count > 3
    }
    
    func isOriginal(word:String) -> Bool{
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) ->Bool{
        var tempWord = rootWord
        
        for letter in word{
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
            } else{
                return false
            }
        }
        
        return true
    }//isPossible Ends Here
    
    
    
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }//isReal Ends Here
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }//wordError ends here
    
    
    func startGame(){
        
        withAnimation{
            usedWords.removeAll()
        }
        
        if let bundleURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWords = try? String(contentsOf: bundleURL){
                
                let allwords = startWords.components(separatedBy: "\n")
                rootWord = allwords.randomElement() ?? "silkworm"
                
                return
            }
        }
        fatalError("Something very bad happened and now we don't have any words")
    }//Start new game ends here
    
}//Content View Ends Here

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
