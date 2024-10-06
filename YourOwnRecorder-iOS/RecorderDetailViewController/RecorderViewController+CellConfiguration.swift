//
//  RecorderViewController+CellConfiguration.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/05.
//

import UIKit

extension RecorderViewController {
    func defaultConfiguration(for cell: UICollectionViewListCell, at row: Row) -> UIListContentConfiguration {
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = text(for: row)
        contentConfiguration.textProperties.font = UIFont.preferredFont(forTextStyle: row.textStyle)
        contentConfiguration.image = row.image
        return contentConfiguration
    }
    
    func headerConfiguration(for cell: UICollectionViewListCell, with title: String) -> UIListContentConfiguration {
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = title
        return contentConfiguration
    }
    
    func titleConfiguration(for cell: UICollectionViewListCell, with title: String?) -> TextFieldContentView.Configuration {
        var contentConfiguration = cell.textFieldConfiguration()
        contentConfiguration.text = title
        return contentConfiguration
    }
    
    func dateConfiguration(for cell: UICollectionViewListCell, with date: Date) -> DatePickerContentView.Configuration {
        var contentConfiguration = cell.datePickerConfiguration()
        contentConfiguration.date = date
        return contentConfiguration
    }
    
    func descriptionConfiguration(for cell: UICollectionViewListCell, with description: String?) -> TextViewContentView.Configuration {
        var contentConfiguration = cell.textViewConfiguration()
        contentConfiguration.text = description
        return contentConfiguration
    }
    
    func text(for row: Row, indexOfContents int: Int? = nil) -> String? {
        switch row {
        case .title: return recorder.title
        case .description: return recorder.description
        case .updatedDate: return recorder.updatedDate.dayAndTimeText
//        case .content: return recorder.contents[int].name
        default: return nil
        }
    }
}
