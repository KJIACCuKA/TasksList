//
//  TasksTableViewCell.swift
//  ToDo List
//
//  Created by Никита Козловский on 24.09.2024.
//

import UIKit

class TasksTableViewCell: UITableViewCell {
    
    private lazy var taskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        self.addSubview(taskLabel)
        NSLayoutConstraint.activate([
            taskLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            taskLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
    }
    
    func setTextToCell(indexPath: IndexPath) {
        let task = TasksArray.tasksArray[indexPath.row]
        taskLabel.text = task.title
    }
}
