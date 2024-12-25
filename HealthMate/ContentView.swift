//
//  ContentView.swift
//  HealthMate
//
//  Created by Owen Mariani on 12/23/24.
//

import SwiftUI

struct ContentView: View {
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
    ContentView()
}
