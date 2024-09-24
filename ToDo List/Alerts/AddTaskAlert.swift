//
//  Alert.swift
//  ToDo List
//
//  Created by Никита Козловский on 24.09.2024.
//

import UIKit
import CoreData

extension UITableViewController {
    func addTaskAlert() {
        let alertController = UIAlertController(title: "Новая задача", message: "Введите задачу", preferredStyle: .alert)
        
        let saveTask = UIAlertAction(title: "Сохранить", style: .default) { action in
            let alertTF = alertController.textFields?.first
            if let newTask = alertTF?.text {
                let save = SaveTask()
                save.saveTask(withTitle: newTask)
                self.tableView.reloadData()
            }
        }
        
        alertController.addTextField()
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .default, handler: nil)
        
        alertController.addAction(saveTask)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
//    // - С помощью этой фнукции мы записываем данные в Core Data
//    func saveTask(withTitle title: String) {
//        
//        // - Получаем доступ к context Core Data
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//        let context = appDelegate.persistentContainer.viewContext
//        
//        // - Добираемся до нашей сущности (Создали ее в отдельном файле Core Data)
//        guard let entity = NSEntityDescription.entity(forEntityName: "Tasks", in: context) else { return }
//        
//        
//        // - Добираемся до объекта сущности (Атрибут сущности, которую мы создали в отдельном файле Core Data)
//        let taskObject = Tasks(entity: entity, insertInto: context)
//        taskObject.title = title
//        
//        
//        // - Core Data работает с помощью этого блока. В нем мы пытаемся сохранить данные в Core Data и массив
//        do {
//            try context.save()
//            TasksArray.tasksArray.append(taskObject)
//            
//        } catch let error as NSError{
//            print(error.localizedDescription)
//        }
//    }
}
