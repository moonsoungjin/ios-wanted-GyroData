//
//  FirstViewController.swift
//  GyroData
//
//  Created by 문성진 on 2022/12/27.
//

import UIKit

class FirstViewController: UIViewController {

    let sensorTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSensorTableViewLayout()
       
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
