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
//        let gyroData = Sensor(measurementDate: "2022-12-28", sensorName: "Gyro", measuredTime: 60.3)
//        PersistenceManager.shared.saveData(sensor: gyroData)
        setNavigationBar()
        sensorTableView.dataSource = self
        sensorTableView.register(MainTableViewCell.self, forCellReuseIdentifier: "mainCell")
        self.setSensorTableViewLayout()
        print(MainViewController.list)
        let request: NSFetchRequest<Data> = Data.fetchRequest()
        let fetchRequest = PersistenceManager.shared.fetchData(request: request)
        PersistenceManager.shared.deleteAll(request: request)
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
    
    func setNavigationBar() {
        self.navigationItem.title = "목록"
        let measurementButton = UIBarButtonItem(title: "측정", style: .plain, target: self, action: #selector(addButton(_:)))
        self.navigationItem.rightBarButtonItem = measurementButton
        let backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backButton.tintColor = .black
        self.navigationItem.backBarButtonItem = backButton
    }
    
    @IBAction func addButton(_ sender: Any) {
        let secondViewController = SecondViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
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
