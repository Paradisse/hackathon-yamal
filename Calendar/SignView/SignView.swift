//
//  ViewController.swift
//  Calendar
//
//  Created by Daniil on 15.10.2021.
//

import UIKit

class SignView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let presenter = SignPresenter()
    let idCell = "idCell"
    var tableView = UITableView()
    
    func setTableView()
    {
        tableView = UITableView(frame: view.frame, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGray5
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: idCell)
        
        view.addSubview(tableView)
    }
    func setTitle()
    {
        title = "Вход"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        setTableView()
        setTitle()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath)
        return cell
    }
}

