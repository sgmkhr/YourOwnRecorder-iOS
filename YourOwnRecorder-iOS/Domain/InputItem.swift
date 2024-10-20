//
//  InputItem.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/20.
//

import Foundation

enum InputItem: CaseIterable {
    case textField
    case textArea
    case slider
    case calender
    case numberField
    case selectField
    
    func getString() -> String {
        switch self {
        case .textField: return "Text field"
        case .textArea: return "Text area"
        case .slider: return "Slider"
        case .calender: return "Calender"
        case .numberField: return "Number field"
        case .selectField: return "Select field"
        }
    }
}


