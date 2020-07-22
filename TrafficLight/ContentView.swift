//
//  ContentView.swift
//  TrafficLight
//
//  Created by Alexey Efimov on 22.05.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    
    @State private var buttonTitle = "START"
    @State private var currentLight = CurrentLight.red
    
    private func nextColor() {
        switch currentLight {
        case .red: currentLight = .yellow
        case .yellow: currentLight = .green
        case .green: currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                ColorLight(color: .red, opacity: currentLight == .red ? 1 : 0.3)
                ColorLight(color: .yellow, opacity: currentLight == .yellow ? 1 : 0.3)
                ColorLight(color: .green, opacity: currentLight == .green ? 1 : 0.3)
                
                Spacer()
                
                Button(action: {
                    self.buttonTitle = "NEXT"
                    self.nextColor()
                }) {
                    Text(buttonTitle)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.white))
                }
                .padding()
                .frame(width: 200, height: 60)
                .background(Color(.blue))
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.white, lineWidth: 4)
                )
            }
            .padding()
        }
    }
}
