//
//  ViewController.swift
//  ToDo List
//
//  Created by Никита Козловский on 24.09.2024.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    private let taskCellID = "taskCellID"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        
        do {
            TasksArray.tasksArray = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Список задач"
        settingsForTable()
        createNavBar()
    }
    
    private func settingsForTable() {
        tableView.register(TasksTableViewCell.self, forCellReuseIdentifier: taskCellID)
    }
    
    private func createNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTask))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(deleteTask))
    }
    
    @objc private func addNewTask() {
        createAlert()
    }
    
    // - Работает аналогично функции saveTask
    @objc private func deleteTask() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        
        if let tasks = try? context.fetch(fetchRequest) {
            for task in tasks {
                context.delete(task)
            }
        }
        
        do {
            try context.save()
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TasksArray.tasksArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: taskCellID, for: indexPath) as? TasksTableViewCell else { return UITableViewCell() }
        cell.setTextToCell(indexPath: indexPath)
        return cell
    }

}

