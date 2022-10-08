//
//  ContentView.swift
//  Temperature Conversion
//
//  Created by Carlos Mbendera on 29/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputType = "Celsius"
    @State private var outputType = "Fahrenheit"
    @State private var tempInput: Double = 0.0
    @State private var tempOutput: Double = 0.0
    
    func convertTemp() -> Double {
        switch outputType{
        case "Fahrenheit":
            if inputType == "Kelvin"{
                return tempInput - 273.15
            }else if inputType == "Celsius"{
                return (1.8 * tempInput) + 32 }
        case "Celsius":
            if inputType == "Kelvin"{
                return tempInput - 273.15
            }else if inputType == "Farenheit" {
             return   (tempInput - 32) * 0.5556 }
        case "Kelvin":
            if inputType == "Celsius"{
                return tempInput + 273.15
            }else if inputType == "Farenheit"{
             return   (tempInput * 0.5556) + 459.67 }
        default:
            return tempInput
        }
        return tempInput
    }
    
    @FocusState private var keyboardFocus
    
    let types = ["Celsius", "Kelvin", "Fahrenheit"]
    
    var body: some View {
      
    NavigationView{
        Form{
            
            Picker("Input Unit", selection: $inputType) {
                ForEach(types, id: \.self){
                    Text($0)
                }
            }
            
            TextField("Enter Temperature Here", value: $tempInput, format: .number)
                .keyboardType(.decimalPad)
            
           
            Section{
                Picker("Output Type", selection: $outputType){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }.pickerStyle(.segmented)
            }header: {
                Text("Output Type")
            }
            
            Text("Your Output is \(convertTemp(), format: .number)")
             
            
            
            
        }.navigationTitle("Temperature Convert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
