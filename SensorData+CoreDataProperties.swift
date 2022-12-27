//
//  SensorData+CoreDataProperties.swift
//  GyroData
//
//  Created by 박도원 on 2022/12/27.
//
//

import Foundation
import CoreData


extension SensorData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SensorData> {
        return NSFetchRequest<SensorData>(entityName: "SensorData")
    }

    @NSManaged public var measurementDate: String?
    @NSManaged public var sensorName: String?
    @NSManaged public var sensorValue: Double
    @NSManaged public var measuredTime: Double

}

extension SensorData : Identifiable {

}
