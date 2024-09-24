//
//  DeleteTaskAlert.swift
//  ToDo List
//
//  Created by Никита Козловский on 24.09.2024.
//

import UIKit
import CoreData

extension UITableViewController {
    func deleteTaskAlert() {
        let alertController = UIAlertController(title: "Удалить задачу", message: "Вы хотите удалить задачу?", preferredStyle: .alert)
        
        let saveTask = UIAlertAction(title: "Да", style: .default) { action in
            let deleteTask = DeleteTask()
            deleteTask.deleteTask()
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Нет", style: .default, handler: nil)
        
        alertController.addAction(saveTask)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
}

