//
//  Data+CoreDataProperties.swift
//  GyroData
//
//  Created by 박도원 on 2022/12/27.
//
//

import Foundation
import CoreData


extension Data {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Data> {
        return NSFetchRequest<Data>(entityName: "Data")
    }

    @NSManaged public var measurementDate: String?
    @NSManaged public var sensorName: String?
    @NSManaged public var measuredTime: Double

}

extension Data : Identifiable {

}
