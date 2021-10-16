//
//  LogInModel.swift
//  Calendar
//
//  Created by Daniil on 16.10.2021.
//

import Foundation

import UIKit
import SwiftyJSON
import Alamofire
import RealmSwift



class LogInModel
{

    let realm = try! Realm()
    func writeNewUser(login: String, password: String, compilationHandler: @escaping (Bool) ->() )
    {
        
        let url  = "https://hackathon-yamal.herokuapp.com/register/\(login)/\(password)"
                      
        AF.request(url, method: .post).responseJSON(completionHandler: {
            response in
            let date = JSON(response.data)
            var done = false
            print(date["code"] == "SUCCESS")
             if date["code"] == "SUCCESS"
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
/*
 AF.request(url, method: .post).responseJSON(completionHandler: @escaping { response in
     let data = JSON(response.data)
     print(data)
     if data["code"] == "SUCCESS"
     {
         done = true
     }
 })
 */
