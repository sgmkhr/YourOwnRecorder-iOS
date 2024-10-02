//
//  RecorderListViewController+DataSource.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/01.
//

import UIKit

extension RecorderListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Recorder.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Recorder.ID>
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: Recorder.ID) {
        let recorder = recorders[indexPath.item]
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = recorder.title
        contentConfiguration.secondaryText = recorder.updatedDate.dayAndTimeText
        contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
        cell.contentConfiguration = contentConfiguration
        
        var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
        backgroundConfiguration.backgroundColor = UIColor(red: 254/255, green: 247/255, blue: 1, alpha: 1)
        cell.backgroundConfiguration = backgroundConfiguration
    }
}
