//
//  User.swift
//  ProtocolApp
//
//  Created by Andrea & Beatrice on 02/01/18.
//  Copyright © 2018 Fuoricittà S.r.l.s. All rights reserved.
//

import Foundation

struct User: CustomStringConvertible {
    var name: String?
    var email: String?
    var password: String?
    
    var description: String {
        return "User \n • \(self.name ?? "") \n • \(self.email ?? "") \n • \(self.password ?? "")"
    }
}
