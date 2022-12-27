//
//  Sensor+CoreDataProperties.swift
//  GyroData
//
//  Created by 문성진 on 2022/12/27.
//
//

import Foundation
import CoreData


extension Sensor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sensor> {
        return NSFetchRequest<Sensor>(entityName: "Sensor")
    }

    @NSManaged public var measurementDate: String?
    @NSManaged public var sensorValue: Double
    @NSManaged public var sensorName: String?

}

extension Sensor : Identifiable {

}
