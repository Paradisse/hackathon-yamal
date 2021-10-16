//
//  AppDelegate.swift
//  Calendar
//
//  Created by Daniil on 15.10.2021.
//

import UIKit
import RealmSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        
        let realm = try! Realm()
        
        let user: Results<User> = realm.objects(User.self)
//        print(user.count)
//        try! realm.write()
//        {
//            realm.delete(user)
//        }
//        print(user.count)
        if (user.count == 1)
        {
            print(user[0].login)
            let tabBar = UITabBarController()
            tabBar.modalPresentationStyle = .fullScreen
            
            let vaccine = VaccineListView()
            let reccomendation = ReccomView()
            let user = UsersView()
            
            let vaccineView = UINavigationController(rootViewController: vaccine)
            let reccomendationView = UINavigationController(rootViewController: reccomendation)
            let usersView = UINavigationController(rootViewController: user)
            
            
            tabBar.setViewControllers([reccomendationView, vaccineView, usersView], animated: true)
            
            
            
            if let items = tabBar.tabBar.items
            {
                
                let images = ["house", "list.star", "person.3.fill"]
                for x in 0..<items.count
                {
                    items[x].image = UIImage(systemName: images[x])
                }
                tabBar.tabBar.backgroundColor = .white
                
                window?.rootViewController = tabBar
            }
        }
        else
        {
            window?.rootViewController = UINavigationController(rootViewController: SignView())
        }
        window?.makeKeyAndVisible()
        return true
    }
    
    
    
}

