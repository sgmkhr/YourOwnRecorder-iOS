//
//  RecorderItem.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/01.
//

import Foundation

enum RecorderItem {
    case textField
    case textArea
    case slider
    case dateField
    
    var name: String? {
        switch self {
        case .textField: return "text field"
        case .textArea: return "text area"
        case .slider: return "slider"
        case .dateField: return "date field"
        }
    }
        
}
