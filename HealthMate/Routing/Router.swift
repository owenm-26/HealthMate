//
//  Router.swift
//  HealthMate
//
//  Created by Owen Mariani on 12/25/24.
//

import SwiftUI
import SwiftfulRouting

struct Router: View {
    var body: some View {
        RouterView{ _ in Text("hello world")
                .navigationTitle("Health Mate")
        }
    }
}

#Preview {
    Router()
}
