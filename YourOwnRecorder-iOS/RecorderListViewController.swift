//
//  RecorderListViewController.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/08.
//

import UIKit

class RecorderListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    
    let sectionTitles = ["Section1", "Section2"]
    let data = [["recorder1-title", "recorder1-description"],["recorder2-title", "Recorder2-description"],["recorder3-title", "Recorder3-description"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        テーブルビューの初期化
        tableView = UITableView(frame: self.view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
    }
    
//    セクション数を指定
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
//    セクションのタイトルを設定
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
//    セクション内の行数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
//    セルの内容を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        return cell
    }
}


