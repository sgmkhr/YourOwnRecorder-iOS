//
//  RecorderViewController+Section.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/04.
//

import Foundation

extension RecorderViewController {
    enum Section: Int, Hashable {
        case view
        case title
        case description
        case isShowed
        case records
        
        var name: String {
            switch self {
            case .view: return ""
            case .title: return NSLocalizedString("Title", comment: "Title section name")
            case .description: return NSLocalizedString("Description", comment: "Description section name")
            case .isShowed: return NSLocalizedString("Is showed", comment: "Is showed section name")
            case .records: return NSLocalizedString("Records", comment: "Records section name")
            }
        }
    }
}
