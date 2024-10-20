//
//  RecorderItem.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/20.
//

import Foundation

struct RecorderItem: Identifiable {
    let id: UUID
    let recorderId: Recorder.ID
    var title: String
    var inputItem: [InputItem]
    
    init(id: UUID, recorderId: Recorder.ID, title: String) {
        self.id = id
        self.recorderId = recorderId
        self.title = title
        self.inputItem = []
    }
}

