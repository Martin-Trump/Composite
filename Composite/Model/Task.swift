//
//  Task.swift
//  Composite
//
//  Created by Павел Шатунов on 26.08.2021.
//

import Foundation

protocol Task {
    var name: String { get }
    
    var taskCount: Int { get }
    
    func doTask()
}
