//
//  Recorder.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/01.
//

import Foundation

struct Recorder: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var description: String? = nil
    var contents: [RecorderItem]
    var createdDate: Date
    var updatedDate: Date
    var isShowed: Bool = true
}

extension [Recorder] {
    func indexOfRecorder(withId id: Recorder.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        return index
    }
}

#if DEBUG
extension Recorder {
    static var sampleData = [
        Recorder(title: "Runnning", description: "To record runnning time and distance daily.", contents: [.textField, .textArea], createdDate: Date().addingTimeInterval(-800.0), updatedDate: Date().addingTimeInterval(-600.0), isShowed: true),
        Recorder(title: "Coffee", description: nil, contents: [.slider, .slider, .slider, .textField, .textArea], createdDate: Date().addingTimeInterval(-1000.0), updatedDate: Date().addingTimeInterval(-800.0), isShowed: true),
        Recorder(title: "Visited Prefectures", description: "Just preparing for a next trip", contents: [], createdDate: Date().addingTimeInterval(-100.0), updatedDate: Date().addingTimeInterval(-100.0), isShowed: false)
    ]
}
#endif
