//
//  RecorderEditorViewController.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/09.
//

import UIKit

class RecorderEditorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
//    var title: String?
//    var description: String?
//    var imputItems
    
    var recorder: [String]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
    }
    
//    セクション内の行数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imputItems.count
    }
    
//    セルの内容を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "imputItemListcell")
        cell.textLabel?.text = imputItems[indexPath.row]
        return cell
    }
    
//    セル選択時の背景色を設定
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.backgroundColor = UIColor(red: 214/255, green: 225/255, blue: 232/255, alpha: 1)
    }
    
//    スワイプ削除アクションの実装
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "削除") { (action, view, completionHandler) in
            self.imputItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        completionHandler(true)}
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}

