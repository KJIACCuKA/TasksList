//
//  DeleteTask.swift
//  ToDo List
//
//  Created by Никита Козловский on 24.09.2024.
//

import UIKit
import CoreData

struct DeleteTask {
    
    func deleteTask() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        
        if var tasks = try? context.fetch(fetchRequest) {
            if (tasks.count != 0) {
                context.delete(tasks.removeLast())
            }
        }
        
        do {
            try context.save()
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
