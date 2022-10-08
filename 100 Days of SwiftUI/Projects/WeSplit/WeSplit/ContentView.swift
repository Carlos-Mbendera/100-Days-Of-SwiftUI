//
//  ContentView.swift
//  WeSplit
//
//  Created by Carlos Mbendera on 26/09/2022.
//

import SwiftUI



struct ContentView: View {
    
    @FocusState private var amountIsFocused
    @State private var numOfPeople = 2
    @State private var checkTotal  = 0.0
    @State private var tipPercent = 20
    
    var userCurrencyType: FloatingPointFormatStyle<Double>.Currency  {
        .currency(code: Locale.current.currencyCode ?? "USD")
    }
    
    
    let percentChoices = [5,10,15,20,25,0]
    
    var totalCalculatedAmount: Double {
        let totalNumOfPeople = Double(numOfPeople + 2)
        let finalPercent = Double(tipPercent)
        
        let tip = checkTotal/finalPercent
        let total = tip + checkTotal
        let amountPerPerson = total/totalNumOfPeople
        return amountPerPerson
    }
    
    var body: some View {
       
            NavigationView {
                Form{
                    Section{
                        TextField("Check Total Amount", value: $checkTotal,format: userCurrencyType)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                        
                        
                        Picker("How many friends are on the table?", selection: $numOfPeople){
                            ForEach(2..<50){
                                Text("\($0) Friends")
                            }
                        }
                        
                    }
                    
                    Section{
                        Picker("Tip Percentage", selection: $tipPercent){
                            ForEach(0..<101) {
                                Text($0, format: .percent)
                            }
                        }
                    }
                header: {
                    Text("How much tip are you leaving?")
                }
                    
                    Section{
                        Text(totalCalculatedAmount, format: userCurrencyType)
                    } header: {
                        Text("Each should pay:")
                    }
                    
                    Section{
                        Text( (checkTotal / Double(tipPercent) ) + checkTotal, format: userCurrencyType )
                    }header: {
                        Text("Without Dividing With Friends")
                    }
                }
                .navigationTitle("WeSplit")
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard)
                    {
                        Spacer()
                        Button("Done"){
                            amountIsFocused = false
                        }
                    }
                }
                
            }
            
                
            }
        }
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
