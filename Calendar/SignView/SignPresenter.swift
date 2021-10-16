//
//  SignPresenter.swift
//  Calendar
//
//  Created by Daniil on 15.10.2021.
//

import Foundation
import UIKit
class SignPresenter
{
    
    private let model = SignModel()
    
    func getTabBarController(login: String, password: String) -> UITabBarController?
   {
       
       let iWrittenUser = model.enterNewUser(login: login, password: password)
       if iWrittenUser == true
       {
       let tabBarController = UITabBarController()
       tabBarController.modalPresentationStyle = .fullScreen
       
       let vaccine = VaccineListView()
       let reccomendation = ReccomView()
       let user = UsersView()
       
       let vaccineView = UINavigationController(rootViewController: vaccine)
       let reccomendationView = UINavigationController(rootViewController: reccomendation)
       let usersView = UINavigationController(rootViewController: user)
       
       
       tabBarController.setViewControllers([reccomendationView, vaccineView, usersView], animated: true)
       
       
       
       guard let items = tabBarController.tabBar.items else {return nil}
       
       let images = ["house", "list.star", "person.3.fill"]
       for x in 0..<items.count
       {
           items[x].image = UIImage(systemName: images[x])
       }
       tabBarController.tabBar.backgroundColor = .white
       return tabBarController
       }
       return nil
   }
}

