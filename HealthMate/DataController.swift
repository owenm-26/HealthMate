//
//  DataController.swift
//  HealthMate
//
//  Created by Owen Mariani on 12/29/24.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "HealthMateDataModel")
    
    init() {
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Failed to load persistent stores: \(error.localizedDescription)")
            }
        }
    }
}
