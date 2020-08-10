//
//  User.swift
//  FetchDataAPI
//
//  Created by SongEam Sela on 8/9/20.
//  Copyright © 2020 SongEam Sela. All rights reserved.
//

import Foundation
struct ResponseModel : Decodable {
    let data : [UserModel]?
}

struct  UserModel : Decodable {
    let id : Int?
    let email : String?
    let first_name : String?
    let last_name : String?
    let avatar : String?
}
