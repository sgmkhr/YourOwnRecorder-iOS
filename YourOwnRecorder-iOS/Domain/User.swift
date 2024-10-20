//
//  User.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/20.
//

import Foundation

struct User: Identifiable {
    var id: String
    var password: String
    
    init(_ id: String, _ password: String) {
        self.id = id
        self.password = password
    }
}
