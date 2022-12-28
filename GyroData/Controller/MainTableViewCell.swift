//
//  MainTableViewCell.swift
//  GyroData
//
//  Created by 박도원 on 2022/12/28.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    static let identifier = "mainCell"
    
    let dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let sensorNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setTableViewCellLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setTableViewCellLayout() {
        [dateLabel, sensorNameLabel, timeLabel].forEach {
            self.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            sensorNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            sensorNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
    }
}
