//
//  PersistenceManager.swift
//  GyroData
//
//  Created by 박도원 on 2022/12/27.
//

import Foundation
import CoreData

class PersistenceManager {
    static var shared: PersistenceManager = PersistenceManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    @discardableResult
    func saveData(sensor: Sensor) -> Bool {
        let entity = NSEntityDescription.entity(forEntityName: "Data", in: self.context)
        
        if let entity = entity {
            let managedObject = NSManagedObject(entity: entity, insertInto: self.context)
            
            managedObject.setValue(sensor.measurementDate, forKey: "measurementDate")
            managedObject.setValue(sensor.sensorName, forKey: "sensorName")
            managedObject.setValue(sensor.measuredTime, forKey: "measuredTime")
            
            do {
                try self.context.save()
                MainViewController.list.append(managedObject)
                return true
            } catch {
                print(error.localizedDescription)
                return false
            }
        } else {
            return false
        }
    }
    
    func fetchData(request: NSFetchRequest<Data>) -> [Data] {
        do {
            let fetchResult = try self.context.fetch(request)
            return fetchResult
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    @discardableResult
    func deleteData(object: NSManagedObject) -> Bool {
        self.context.delete(object)
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }
    
    @discardableResult
    func deleteAll(request: NSFetchRequest<Data>) -> Bool {
        let request: NSFetchRequest<NSFetchRequestResult> = Data.fetchRequest()
        let delete = NSBatchDeleteRequest(fetchRequest: request)
        do {
            try self.context.execute(delete)
            return true
        } catch {
            return false
        }
    }
}
