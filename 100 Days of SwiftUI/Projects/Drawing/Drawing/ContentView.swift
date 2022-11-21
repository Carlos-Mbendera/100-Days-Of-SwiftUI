//
//  ContentView.swift
//  Drawing
//
//  Created by Carlos Mbendera on 14/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var thickness: CGFloat = 10
    @State var unitStartX: CGFloat = 0
   
    
    var body: some View {
        VStack {
            arrow()
            .stroke(.blue, style: StrokeStyle(lineWidth: thickness, lineCap: .round, lineJoin: .round))
            .frame(width: 300, height: 300)
            
            Slider(value: $thickness, in: 5...50)
                .padding()
            
            ColorCyclingRectangle(unitStartX: unitStartX)
         
            Slider(value: $unitStartX, in: 0...1)
                .padding()
            
        }
    }
}


struct ColorCyclingRectangle: View{
    
    var amount = 0.0
    var steps = 100
   
    var unitStartX: CGFloat = 0
    var unitStartY: CGFloat = 0

    var body: some View{
        
        let units = UnitPoint(x: unitStartX, y: unitStartY)
        let unitsEnd = UnitPoint(x: 1 - unitStartX, y: 1 - unitStartY)
        
        ZStack{
            ForEach(0..<steps){ value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(LinearGradient(colors: [getColor(for: value), getColor(for: value, brightness: 0.5)], startPoint: units, endPoint: unitsEnd), lineWidth: 20)
                    .padding()
                
            }
        }
    }
    
    func getColor(for value: Int, brightness : Double = 1) -> Color{
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1{
            targetHue += 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
    
    
}

struct arrow: Shape{
    func path(in rect: CGRect) -> Path {
        var xPath = Path()
        xPath.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        xPath.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        xPath.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        xPath.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        xPath.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        xPath.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
    
        return xPath
    }
    
  
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
