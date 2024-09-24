//
//  SaveTask.swift
//  ToDo List
//
//  Created by Никита Козловский on 24.09.2024.
//

import UIKit
import CoreData

struct SaveTask {
    // - С помощью этой фнукции мы записываем данные в Core Data
    func saveTask(withTitle title: String) {
        
        // - Получаем доступ к context Core Data
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        // - Добираемся до нашей сущности (Создали ее в отдельном файле Core Data)
        guard let entity = NSEntityDescription.entity(forEntityName: "Tasks", in: context) else { return }
        
        
        // - Добираемся до объекта сущности (Атрибут сущности, которую мы создали в отдельном файле Core Data)
        let taskObject = Tasks(entity: entity, insertInto: context)
        taskObject.title = title
        
        
        // - Core Data работает с помощью этого блока. В нем мы пытаемся сохранить данные в Core Data и массив
        do {
            try context.save()
            TasksArray.tasksArray.append(taskObject)
            
        } catch let error as NSError{
            print(error.localizedDescription)
        }
    }
}
