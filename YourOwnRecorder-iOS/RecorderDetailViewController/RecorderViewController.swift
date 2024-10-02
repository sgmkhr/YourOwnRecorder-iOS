//
//  RecorderViewController.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/03.
//

import UIKit

class RecorderViewController: UICollectionViewController {
    var recorder: Recorder
    
    init(recorder: Recorder) {
        self.recorder = recorder
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfiguration.showsSeparators = false
        let listLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        super.init(collectionViewLayout: listLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Always initialize recorderViewController using init(recorder:)")
    }
    
    func text(for row: Row) -> String? {
        switch row {
        case .title: return recorder.title
        case .description: return recorder.description
        case .updatedDate: return recorder.updatedDate.dayAndTimeText
//        case .content: return String(recorder.contents.map { $0.name })
        default: return ""
        }
    }

}
