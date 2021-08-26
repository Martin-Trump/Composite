//
//  ViewController.swift
//  Composite
//
//  Created by Павел Шатунов on 26.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private enum ImageSystemName: String {
        case plus = "plus.app"
    }
    
    private var tableView = UITableView()
    private var taskList: TaskList
    
    init(taskList: TaskList) {
        
        self.taskList = taskList
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.taskList = TaskList()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configNavigation()
        configTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    private func configTableView() {
        tableView = createTableView()
        self.view.addSubview(tableView)
    }
    
    private func configNavigation() {
        let button1 = UIBarButtonItem(image: UIImage(systemName: ImageSystemName.plus.rawValue),
                                      style: .plain,
                                      target: self,
                                      action: #selector(tapAddButton))
        self.navigationItem.rightBarButtonItem  = button1
        self.navigationItem.title = taskList.name
    }

    @objc func tapAddButton(_ sender: Any) {
        taskList.list.append(SelectedTask(name: "New task \(taskList.list.count)"))
        tableView.reloadData()
    }
    
    private func createTableView() -> UITableView {
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        let _tableView = UITableView(frame: CGRect(x: .zero, y: .zero, width: displayWidth, height: displayHeight))
        _tableView.register(UINib(nibName: TaskViewCell.identifier, bundle: nil), forCellReuseIdentifier: TaskViewCell.identifier)
        
        _tableView.dataSource = self
        _tableView.delegate = self
        return _tableView
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskViewCell.identifier, for: indexPath) as? TaskViewCell
        else { return UITableViewCell() }
        cell.configureCell(task: taskList.list[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: ViewController
        if let list = taskList.list[indexPath.row] as? TaskList{
            vc = ViewController(taskList: list)
            vc.taskList = list
        }else{
            let newList = TaskList(name: "Task List \(taskList.list[indexPath.row].name)", listTask: [SelectedTask()])
            taskList.list[indexPath.row] = newList
            vc = ViewController(taskList: newList)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(40)
    }
}
