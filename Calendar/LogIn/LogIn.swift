//
//  LogIn.swift
//  Calendar
//
//  Created by Daniil on 15.10.2021.
//

import UIKit

class LogIn: UIViewController
{
    var lastName = UITextField() // фамилия
    var name = UITextField() // имя
    var patronymic = UITextField() // отчество
    
    var login = UITextField() // логин
    var password = UITextField() // пароль
    
    
    var logInButton = UIButton()
    
    let scrollView = UIScrollView()
    
   
    @objc func logIN(_ sender: UIButton)
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
        present(tabBarController, animated: true, completion: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "Регистрация"
        scrollView.frame = view.frame
        scrollView.backgroundColor = .systemGray5
        
        
        lastName.frame = CGRect(x: 10, y:  navigationController!.navigationBar.frame.height, width: self.view.frame.width - 20, height: 100)
        lastName.layer.cornerRadius = lastName.frame.height / 10
        lastName.placeholder = "Фамилия"
        lastName.textAlignment = .center
        
        name.frame = CGRect(x: 10, y: lastName.frame.height + lastName.frame.origin.y + lastName.frame.height / 4, width: lastName.frame.width, height: lastName.frame.height)
        name.layer.cornerRadius = lastName.layer.cornerRadius
        name.placeholder = "Имя"
        name.textAlignment = .center
        
        
        patronymic.frame = CGRect(x: 10, y: name.frame.height + name.frame.origin.y + name.frame.height / 4, width: name.frame.width, height: name.frame.height)
        patronymic.layer.cornerRadius = name.layer.cornerRadius
        patronymic.placeholder = "Отчество"
        patronymic.textAlignment = .center
        
        login.frame = CGRect(x: 10, y: patronymic.frame.height + patronymic.frame.origin.y + patronymic.frame.height / 4, width: patronymic.frame.width, height: patronymic.frame.height)
        login.layer.cornerRadius = patronymic.layer.cornerRadius
        login.placeholder = "Логин"
        login.textAlignment = .center
       
        
        password.frame = CGRect(x: 10, y: login.frame.height + login.frame.origin.y + login.frame.height / 4, width: login.frame.width, height: login.frame.height)
        password.layer.cornerRadius = login.layer.cornerRadius
        password.placeholder = "Пароль"
        password.textAlignment = .center
        
        
        
        lastName.backgroundColor = .white
        name.backgroundColor = .white
        patronymic.backgroundColor = .white
        login.backgroundColor = .white
        password.backgroundColor = .white
        
        logInButton.frame = CGRect(x: 10, y: password.frame.height + password.frame.origin.y + password.frame.height / 4, width: password.frame.width, height: password.frame.height)
        logInButton.layer.cornerRadius = password.layer.cornerRadius
        logInButton.setTitle("Зарегистрироваться", for: .normal)
        logInButton.addTarget(self, action: #selector(logIN(_:)), for: .touchDown)
        logInButton.titleLabel?.textAlignment = .center
        logInButton.backgroundColor = .systemBlue
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: lastName.frame.height * 12)
        
        scrollView.addSubview(lastName)
        scrollView.addSubview(name)
        scrollView.addSubview(patronymic)
        scrollView.addSubview(login)
        scrollView.addSubview(password)
        scrollView.addSubview(logInButton)
        
        
        
        view.addSubview(scrollView)
    }
    


}
