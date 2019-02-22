//
//  UserModel.swift
//  MapJSON
//
//  Created by Attapong on 21/2/2562 BE.
//  Copyright © 2562 Attapong. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes

struct UserModel {
    let id: Int
    let name: String
    let email: String?
}

extension UserModel: Argo.Decodable {
    static func decode(_ json: JSON) -> Decoded<UserModel> {
        return curry(UserModel.init)
            <^> json <| "id"
            <*> json <| "name"
            <*> json <|? "email" // Use ? for parsing optional values
    }
}
