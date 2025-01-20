//
//  Goal+CoreDataProperties.swift
//  HealthMate
//
//  Created by Owen Mariani on 12/29/24.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var date_start: Date?
    @NSManaged public var category: String?
    @NSManaged public var duration: Int16
    @NSManaged public var repeats: Bool
    @NSManaged public var frequency: Int16
    @NSManaged public var goal_amount: Int32

}

extension Goal : Identifiable {

}
