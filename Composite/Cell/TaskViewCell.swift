//
//  TaskViewCell.swift
//  Composite
//
//  Created by Павел Шатунов on 26.08.2021.
//

import UIKit

class TaskViewCell: UITableViewCell {
    
    static let identifier = String(describing: TaskViewCell.self)
    
    @IBOutlet weak var taskCount: UILabel!
    @IBOutlet weak var taskName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(task:Task) {
        taskName.text = task.name
        taskCount.text = "\(task.taskCount)"
    }
    
}
