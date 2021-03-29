//
//  ViewController.swift
//  ToDoList
//
//  Created by Rafael Yuiti on 25/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var tasks: [Task] = []
    
    //var task1 = Task(name: "task1")
    //var task2 = Task(name: "task2")
    
    
    var items = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        
        cell.taskNameLabel?.text = tasks[indexPath.row].name
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "To Do List"
        tasks.append(Task(name: "teste"))
        view.addSubview(tableView)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        tableView.reloadData()
        print(tasks)
        
    }
    
    @objc private func didTapAdd(){
        let alert = UIAlertController(title: "New Item", message: "Enter new to do list item!", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { field in
            field.placeholder = "Enter item..."
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { (_) in
            if let field = alert.textFields?.first{
                if let text = field.text, !text.isEmpty{
                    
                    //digita uma nova to do list
                    //print(text)
                    let newTask = Task(name: text)
                    self.tasks.append(newTask)
                    self.tableView.reloadData()
                    
                }
            }
        }))
        
        present(alert, animated: true)
    }

}

class Task{
    var name = ""
    var checked = false
    
    convenience init(name: String) { //inicializador
        self.init()
        self.name = name
    }
}

