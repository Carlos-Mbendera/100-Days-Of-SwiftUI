//
//  ContentView.swift
//  Challenge Habit Tracking App
//
//  Created by Carlos Mbendera on 21/11/2022.
//

import SwiftUI

class Habit: ObservableObject {
    var title : String
    var description : String
    @Published var daysCount : Int = 0
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
        self.daysCount = 0
    }
    
}

struct ContentView: View {
    
    @State private var habits = [Habit]()
    @State private var alertShowing = false
    @State private var entryTitle = ""
    @State private var entryDesc = ""
    
    func removeHabit(at indexSet: IndexSet){
        habits.remove(atOffsets: indexSet)
    }
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(habits.indices, id:\.self) {
                    let currentHabit = habits[$0]
                    NavigationLink(destination: detailView(currentHabit: currentHabit)) {
                        Text(currentHabit.title)
                    }
                }.onDelete(perform: removeHabit)
               
            }
        .navigationTitle("Habit Tracker")
        .toolbar{
            Button{
                alertShowing = true }label: {
                    Image(systemName: "plus")
                }
            EditButton()
            
        }
        }.alert("New Habit", isPresented: $alertShowing){
            Text("New Habit")
            TextField("Habit", text: $entryTitle)
            TextField("Description", text: $entryDesc)
            
            Button("Enter"){
                let newHabit = Habit(title: entryTitle, description: entryDesc)
                withAnimation{
                    habits.append(newHabit)
                    entryTitle = ""
                    entryDesc = ""
                }
            }
            
        }message: {
            Text("Type in a new habit you want")
        }
      
    }
}

struct detailView: View {
    @ObservedObject var currentHabit: Habit
    
    var body: some View{
        
         let title = currentHabit.title
         let desc = currentHabit.description
        
        VStack{
            Text("Description")
                .font(.headline)
                .padding()
            
            Text(desc)
                .padding(.leading)
                .foregroundColor(.primary)
        
            HStack{
                Text("Days Complete = \(currentHabit.daysCount)")
                Spacer()
                Button{
                    currentHabit.daysCount += 1
                }label: {
                    Image(systemName: "plus.circle")
                }
            }.padding()
            
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
