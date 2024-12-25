//
//  MenuBar.swift
//  HealthMate
//
//  Created by Owen Mariani on 12/25/24.
//

import Foundation
import SwiftUI

struct MenuBar: View {
    var body: some View {
        HStack {
            Button(action: {
                print("Seeing Goals")
                 }) {
                   Label("See my Goals", systemImage: "heart.fill")
                     .padding()
                     .foregroundColor(.white)
                     .background(Color.blue)
                     .cornerRadius(10)
                 }
                   
                Button(action: {
                    print("Move to Make Goals")
                          }){
                        Label("Make new Goals", systemImage: "trophy")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)}
        }
    }
}

#Preview {
     MenuBar()
}
