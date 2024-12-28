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
        Spacer()
        Rectangle()
            .frame(height: 1) // Height of the border
        .foregroundColor(Color.gray.opacity(0.5))
        .padding(.bottom, 20)
        HStack(alignment: .center, spacing: 50) {
           
            Button(action: {
                print("Seeing Goals")
            }) {
                Label("", systemImage: "heart")
                    .foregroundColor(.blue)
                    .imageScale(Image.Scale.large)
            }
            Button(action: {
                print("Move to Make Goals")
            }){
                Label("", systemImage: "plus.circle")
                    .foregroundColor(.blue)
                    .imageScale(Image.Scale.large)
            }
            Button(action: {
                print("Move to About")
            })
            {
                Label("", systemImage: "info.circle")
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
