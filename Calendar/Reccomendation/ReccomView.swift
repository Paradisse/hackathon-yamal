//
//  ReccomView.swift
//  Calendar
//
//  Created by Daniil on 16.10.2021.
//

import UIKit

class ReccomView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        title = "Рекомендации"
        navigationItem.title = "Рекомендации"
        view.backgroundColor = .systemGray5
        navigationController?.navigationBar.backgroundColor = .white
        let statusBar = UIView(frame: UIApplication.shared.statusBarFrame)
        statusBar.backgroundColor = .white
        view.addSubview(statusBar)
    }
    

}
