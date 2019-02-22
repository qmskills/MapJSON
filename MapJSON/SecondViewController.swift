//
//  SecondViewController.swift
//  MapJSON
//
//  Created by Attapong on 21/2/2562 BE.
//  Copyright © 2562 Attapong. All rights reserved.
//

import UIKit
import Alamofire
import Mapper

class SecondViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchOneUser()
    }
    
    func fetchOneUser(){
        let url: String = "https://jsonplaceholder.typicode.com/todos/1"
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                print("reponse: \(response.result.value!)")
                if let data = response.result.value as? NSDictionary{
                    self.user = User.from(data)
                    self.adjustUI()
                }
                
                
        }
    }

    func adjustUI(){
        titleLabel.text = self.user?.title
    }
//https://jsonplaceholder.typicode.com/todos/1

}
