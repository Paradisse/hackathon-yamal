//
//  LogInPresenter.swift
//  Calendar
//
//  Created by Daniil on 16.10.2021.
//

import Foundation
import UIKit
class LogInPresenter
{
    private let model = LogInModel()
    
    func getTabBarController(login: String, password: String, compilationHandler: @escaping (UITabBarController?) ->())
    {
        
        
        model.writeNewUser(login: login, password: password) { (answer) in
            var returnValue: UITabBarController? = UITabBarController()
            if answer == true
            {
                
                returnValue!.modalPresentationStyle = .fullScreen
                
                let vaccine = VaccineListView()
                let reccomendation = ReccomView()
                let user = UsersView()
                
                let vaccineView = UINavigationController(rootViewController: vaccine)
                let reccomendationView = UINavigationController(rootViewController: reccomendation)
                let usersView = UINavigationController(rootViewController: user)
                
                
                returnValue!.setViewControllers([reccomendationView, vaccineView, usersView], animated: true)
                
                
                
                guard let items = returnValue!.tabBar.items else {return}
                
                let images = ["house", "list.star", "person.3.fill"]
                for x in 0..<items.count
                {
                    items[x].image = UIImage(systemName: images[x])
                }
                returnValue!.tabBar.backgroundColor = .white
            }
            else
            {
                returnValue = nil
            }
            compilationHandler(returnValue)
        }
        
    }
}
