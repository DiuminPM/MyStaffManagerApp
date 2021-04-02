//
//  User.swift
//  MyStuffManagerApp
//
//  Created by DiuminPM on 02.04.2021.
//

import Foundation
import Firebase
struct AppUser {
    let uid: String
    let email: String
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email!
    }
}
