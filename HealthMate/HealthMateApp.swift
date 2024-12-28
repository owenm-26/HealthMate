//
//  HealthMateApp.swift
//  HealthMate
//
//  Created by Owen Mariani on 12/23/24.
//

import SwiftUI

@main
struct HealthMateApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

struct RootView: View {
    @State private var hasPassedWelcome: Bool = false
    
    var body: some View {
        Group {
            if hasPassedWelcome {
                ContentView()
            } else {
                Welcome(hasPassedWelcome: $hasPassedWelcome)
            }
            
        }
    }
}

#Preview {
    RootView() // Preview the root view with tappable state
}

