//
//  AddUserView.swift
//  Calendar
//
//  Created by Daniil on 16.10.2021.
//

import UIKit

class UsersView: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    var tableView = UITableView()
    var idCell = "familyCell"
    var viewNew = UIView()
    let users = ["Алина", "Даня", "Иван", "Тема", "Дима"]
    
    @objc func addMember(_ sender: UIBarButtonItem)
    {
        let addUserView = UINavigationController(rootViewController: AddUserView())
        present(addUserView, animated: true, completion: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        navigationItem.title = "Семья"
        
        tableView = UITableView(frame: view.frame, style: .insetGrouped)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGray5
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: idCell)
        
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addMember(_:)))
        navigationItem.rightBarButtonItem = rightBarButton
        
        navigationController?.navigationBar.backgroundColor = .white
        
        view.addSubview(tableView)
        let statusBar = UIView(frame: UIApplication.shared.statusBarFrame)
        statusBar.backgroundColor = .white
        
        view.addSubview(statusBar)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: idCell)
        cell.textLabel?.text = users[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.backgroundColor = .white
        return cell
    }

}
