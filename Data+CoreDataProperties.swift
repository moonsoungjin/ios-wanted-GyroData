//
//  Data+CoreDataProperties.swift
//  GyroData
//
//  Created by 박도원 on 2022/12/28.
//
//

import Foundation
import CoreData


extension Data {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Data> {
        return NSFetchRequest<Data>(entityName: "Data")
    }

    @NSManaged public var measuredTime: Double
    @NSManaged public var measurementDate: String?
    @NSManaged public var sensorName: String?

}

extension Data : Identifiable {

}
