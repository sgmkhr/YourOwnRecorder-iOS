//
//  Recorder.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/20.
//

import Foundation

struct Recorder: Identifiable {
    let id: UUID
    var title: String
    var description: String?
    
    init(id: UUID, title: String, description: String? = nil) {
        self.id = id
        self.title = title
        self.description = description
    }
}
