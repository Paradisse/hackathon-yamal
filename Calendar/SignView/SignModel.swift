//
//  SignModel.swift
//  Calendar
//
//  Created by Daniil on 15.10.2021.
//

import Foundation
import UIKit
import RealmSwift
import SwiftyJSON
import Alamofire
class SignModel
{
    let realm = try! Realm()
    func enterNewUser(login: String, password: String, compilationHandler: @escaping (Bool) ->())
    {
        
        let url  = "https://hackathon-yamal.herokuapp.com/login/\(login)/\(password)"
                      
        AF.request(url, method: .get).responseJSON(completionHandler: {
            response in
            let date = JSON(response.data)
            var done = false
            print(date["email"])
            if date["email"].null == nil
            {
            done = true
                 let user = User()
                 user.login = login
                 try! self.realm.write()
                 {
                     self.realm.add(user)
                 }
                 
            }
            compilationHandler(done)
        })

        
    }
}

