//
//  SecondViewController.swift
//  GyroData
//
//  Created by 박도원 on 2022/12/28.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setNavigationBar()
    }
    
    func setNavigationBar() {
        self.navigationItem.title = "측정하기"
        let measurementButton = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButton(_:)))
        self.navigationItem.rightBarButtonItem = measurementButton
        let backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backButton.tintColor = .black
        self.navigationItem.backBarButtonItem = backButton
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let mainViewController = MainViewController()
        let gyroData = Sensor(measurementDate: "2022-12-28", sensorName: "Gyro", measuredTime: 60.3)
        PersistenceManager.shared.saveData(sensor: gyroData)
        self.navigationController?.pushViewController(mainViewController, animated: true)
        
    }
    
    
}
