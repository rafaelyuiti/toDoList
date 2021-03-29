//
//  TaskCell.swift
//  ToDoList
//
//  Created by Rafael Yuiti on 29/03/21.
//

import UIKit

protocol ChangeButton{
    func changeButton(checked: Bool, index: Int)
}

class TaskCell: UITableViewCell {

    @IBAction func checkBoxAction(_ sender: Any) {
        if tasks![indexP!].checked{
            delegate?.changeButton(checked: false, index: indexP!)
        }else{
            delegate?.changeButton(checked: true, index: indexP!)
        }
    }
    
    @IBOutlet weak var checkBoxOutlet: UIButton!
    @IBOutlet weak var taskNameLabel: UILabel!
    
    var delegate: ChangeButton?
    var indexP: Int?
    var tasks: [Task]?
}
