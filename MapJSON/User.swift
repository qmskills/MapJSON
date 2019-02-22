//
//  UserModel.swift
//  MapJSON
//
//  Created by Attapong on 21/2/2562 BE.
//  Copyright © 2562 Attapong. All rights reserved.
//

import Foundation
import Mapper

struct User: Mappable {
    let id: Int
    let name: String?
    let email: String?
    let title: String?
    
    init(map: Mapper) throws {
        try id = map.from("id")
        name = map.optionalFrom("name")
        email = map.optionalFrom("email")
        title = map.optionalFrom("title")
    }
}
