//
//  Record.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/04.
//

import Foundation

struct Record: Identifiable {
    var id: String = UUID().uuidString
    let recorderId: Int
    var contents: [[RecorderItem : Any]]
    var createdDate: Date
    var updatedDate: Date
}

extension [Record] {
    func indexOfRecorder(withId id: Record.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        return index
    }
}

#if DEBUG
extension Record {
    static var sampleData = [
        Record(recorderId: 0, contents: [[.textField : "50min"],[.textField : "7km"],[.textArea : "In good condition."]], createdDate: Date(), updatedDate: Date()),
        Record(recorderId: 0, contents: [[.textField : "48min"],[.textField : "6.7km"],[.textArea : "As always."]], createdDate: Date(), updatedDate: Date()),
        Record(recorderId: 0, contents: [[.textField : "53min"],[.textField : "7.5km"],[.textArea : "Run little longer."]], createdDate: Date(), updatedDate: Date()),
        Record(recorderId: 1, contents: [[.slider : 3],[.slider : 4],[.slider : 4],[.textField : "test coffee"],[.textArea : "Good taste."]], createdDate: Date(), updatedDate: Date())
    ]
}
#endif
