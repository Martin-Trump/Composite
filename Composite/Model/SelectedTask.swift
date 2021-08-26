//
//  SelectedTask.swift
//  Composite
//
//  Created by Павел Шатунов on 26.08.2021.
//

import Foundation

class SelectedTask: Task {

    var name: String
    var taskCount: Int = 1
    
    convenience init (){
        self.init(name: "New Task")
    }
    
    init(name: String) {
        self.name = name
    }
    
    func doTask(){
        print("Do task: \(name)")
    }
    
}
