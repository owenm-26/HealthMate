//
//  ContentView.swift
//  HealthMate
//
//  Created by Owen Mariani on 12/23/24.
//

import SwiftUI

struct Welcome: View {
    @Binding var hasPassedWelcome: Bool
    var body: some View {
        VStack {
            Image(systemName: "scalemass.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.red)
            
            Group{
                Text("Welcome!")
                    .font(.title)
                
                Button(action: {
                    print("Set a Goal button tapped.")
                    hasPassedWelcome.toggle()
                }, label: {
                    Text("Set a Goal ")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(Color.green)
                        .cornerRadius(15)
                        .padding()
                })
            }.frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

#Preview {
    StateWrapper()
}

struct StateWrapper: View {
    @State private var hasPassedWelcome: Bool = false

    var body: some View {
        Welcome(hasPassedWelcome: $hasPassedWelcome)
    }
}
