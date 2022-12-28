//
//  FirstViewController.swift
//  GyroData
//
//  Created by 문성진 on 2022/12/27.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    static var list: [NSManagedObject] = []
    
    let sensorTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gyroData = Sensor(measurementDate: "2022-12-28", sensorName: "Gyro", measuredTime: 60.3)
        PersistenceManager.shared.saveData(sensor: gyroData)
        sensorTableView.dataSource = self
        sensorTableView.register(MainTableViewCell.self, forCellReuseIdentifier: "mainCell")
        self.setSensorTableViewLayout()
        print(MainViewController.list)
    }
    
    func setSensorTableViewLayout() {
        self.view.addSubview(sensorTableView)
        sensorTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sensorTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            sensorTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            sensorTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            sensorTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainViewController.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let record = MainViewController.list[indexPath.row]
        guard let time = record.value(forKey: "measuredTime") as? Double,
              let date = record.value(forKey: "measurementDate") as? String,
              let name = record.value(forKey: "sensorName") as? String else {
            return UITableViewCell()
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        cell.timeLabel.text = String(time)
        cell.dateLabel.text = date
        cell.sensorNameLabel.text = name
        
        return cell
    }
    
    
}
