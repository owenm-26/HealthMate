//
//  MenuBar.swift
//  HealthMate
//
//  Created by Owen Mariani on 12/25/24.
//

import Foundation
import SwiftUI

struct MenuBar: View {
    @State private var buttonActive = "my_goals"
    var body: some View {
        Spacer()
        Rectangle()
            .frame(height: 1) // Height of the border
        .foregroundColor(Color.gray.opacity(0.5))
        .padding(.bottom, 20)
        HStack(alignment: .center, spacing: 50) {
           
            Button(action: {
                print("Seeing my_goals")
                buttonActive = "my_goals"
            }) {
                Label("", systemImage: buttonActive == "my_goals" ? "heart.fill" : "heart")
                    .foregroundColor(.blue)
                    
                    .imageScale(Image.Scale.large)
            }
            Button(action: {
                print("Move to make_goals")
                buttonActive = "make_goals"
            }){
                Label("", systemImage: buttonActive == "make_goals" ? "plus.circle.fill" : "plus.circle")
                    .foregroundColor(.blue)
                    .imageScale(Image.Scale.large)
            }
            Button(action: {
                print("Move to About")
                buttonActive = "about"
            })
            {
                Label("", systemImage: buttonActive == "about" ? "info.circle.fill" : "info.circle")
                .foregroundColor(.blue)
                .imageScale(Image.Scale.large)
            }
            
        }
        .padding(.bottom, 10.0)
    }
}

#Preview {
     MenuBar()
}
