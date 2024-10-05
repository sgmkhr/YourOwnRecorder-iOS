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
    
    func updateSnapshot(reloading ids: [Recorder.ID] = []) {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(recorders.map { $0.id })
        if !ids.isEmpty {
            snapshot.reloadItems(ids)
        }
        dataSource.apply(snapshot)
    }
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: Recorder.ID) {
        let recorder = recorder(withId: id)
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = recorder.title
        contentConfiguration.secondaryText = recorder.updatedDate.dayAndTimeText
        contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
        cell.contentConfiguration = contentConfiguration
        
        var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
        backgroundConfiguration.backgroundColor = UIColor(red: 236/255, green: 241/255, blue: 243/255, alpha: 1)
        cell.backgroundConfiguration = backgroundConfiguration
    }
    
    func recorder(withId id: Recorder.ID) -> Recorder {
        let index = recorders.indexOfRecorder(withId: id)
        return recorders[index]
    }
    
    func updateRecorder(_ recorder: Recorder) {
        let index = recorders.indexOfRecorder(withId: recorder.id)
        recorders[index] = recorder
    }
}
