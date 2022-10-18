//
//  ContentView.swift
//  BetterRest
//
//  Created by Carlos Mbendera on 15/10/2022.
//
import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var coffee = 1
    @State private var sleepAmount = 8.0
    private var bedTimeMessage: String {
        get{ calculateBedTime() }
    }
    
   static private var defaultWakeTime : Date{
        var defaultWakeUpComponents = DateComponents()
        defaultWakeUpComponents.hour = 8
        defaultWakeUpComponents.minute = 0
        return Calendar.current.date(from: defaultWakeUpComponents) ?? Date.now
    }
    
    var body: some View {
        NavigationView{
            Form{
                VStack(alignment: .leading){
                    Text("When Do You Want To Wake Up?").font(.headline)
                    DatePicker("Pick a time", selection: $wakeUp, displayedComponents: .hourAndMinute).labelsHidden()
                }
                
                VStack(alignment: .leading){
                    Text("Desired Amount of Sleep")
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                VStack(alignment: .leading){
                    Text("Daily Coffee Intake").font(.headline)
                    Picker("Cups", selection: $coffee)
                    {
                        ForEach(0..<20){
                            Text($0.formatted())
                        }
                    }
                   // Stepper("\(coffee) \( (coffee > 1 ? "Cups" : "Cup")      )", value: $coffee)
                }
                
                Section{
                    Text(bedTimeMessage)
                }   header: {
                    Text("Your Ideal Bed Time is")
        }
                
            }
            .navigationTitle("Better Rest")
        }
    }
    
    func calculateBedTime() -> String{
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let componets = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
            let hour =  (componets.hour ?? 0) * 60 * 60
            let minute = (componets.minute ?? 0) * 60
            
            let predication = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffee))
            
            let sleepTime = wakeUp - predication.actualSleep
        
            let _ = print(sleepTime.formatted(date: .omitted, time: .shortened))
           
            return sleepTime.formatted(date: .omitted, time: .shortened)
           
            
        }catch{
            let _ = print("Oops Something went wrong")
            return "Sorry there was an error"
        }
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
