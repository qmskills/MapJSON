//
//  ViewController.swift
//  MapJSON
//
//  Created by Attapong on 21/2/2562 BE.
//  Copyright © 2562 Attapong. All rights reserved.
//

import UIKit
import Alamofire
import Mapper

class ViewController: UIViewController {
    
    var users: [User]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllUser()
    }
    
    func fetchAllUser(){
        let url: String = "https://jsonplaceholder.typicode.com/users"
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                print("reponse: \(response.result.value!)")
                if let data = response.result.value as? NSArray{
                    self.users = User.from(data)
                    
                    for user in self.users! {
                        if let userName = user.name {
                            print("user name: \(userName)")
                        }
                    }
                }
                
                
        }
    }
    
    
    
}

