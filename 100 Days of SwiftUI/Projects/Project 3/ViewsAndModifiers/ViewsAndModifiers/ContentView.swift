//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Carlos Mbendera on 07/10/2022.
//

import SwiftUI

struct MyTitleStyle : ViewModifier{
    func body(content: Content) -> some View {
        content.foregroundColor(.blue)
            .font(.largeTitle)
    }
}

extension View{
    func blueTitle() -> some View{
        modifier(MyTitleStyle())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Example Title").blueTitle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
