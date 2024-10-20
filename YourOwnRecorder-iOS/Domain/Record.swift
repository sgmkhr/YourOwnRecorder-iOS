//
//  Record.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/20.
//

import Foundation

struct Record: Identifiable {
    let id: UUID
    let recorderId: Recorder.ID
    let inputItems: [RecorderItem]
    var updatedDate: Date = Date()
}
