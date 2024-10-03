//
//  RecorderViewController+Row.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/03.
//

import UIKit

extension RecorderViewController {
    enum Row: Hashable {
        case title
        case description
        case updatedDate
        case record
        
        var imageName: String? {
            switch self {
            case .title: return "title"
            case .description: return "description"
            case .updatedDate: return "updatedDate"
            case .record: return "record"
            }
        }
        
        var image: UIImage? {
            guard let imageName = imageName else { return nil }
            let configuration = UIImage.SymbolConfiguration(textStyle: .headline)
            return UIImage(systemName: imageName, withConfiguration: configuration)
        }
        
        var textStyle: UIFont.TextStyle {
            switch self {
            case .title: return .headline
            case .description: return .callout
            case .updatedDate: return .footnote
            case .record: return .subheadline
            }
        }
    }
}
