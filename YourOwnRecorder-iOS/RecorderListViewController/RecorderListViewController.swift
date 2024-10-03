//
//  ViewController.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/01.
//

import UIKit

class RecorderListViewController: UICollectionViewController {
    
    var dataSource: DataSource!
    var recorders: [Recorder] = Recorder.sampleData

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Recorder.ID) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        updateSnapshot()
        
        collectionView.dataSource = dataSource
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let id = recorders[indexPath.item].id
        pushDetailViewForRecorder(withId: id)
        return false
    }
    
    func pushDetailViewForRecorder(withId id: Recorder.ID) {
        let recorder = recorder(withId: id)
        let viewController = RecorderViewController(recorder: recorder)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }


}

