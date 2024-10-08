//
//  RecorderListViewController.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/08.
//

import UIKit

class RecorderListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let sectionTitles = ["Section1", "Section2"]
    var data = [["recorder1-title", "recorder1-description"],["recorder2-title", "Recorder2-description"],["recorder3-title", "Recorder3-description"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
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
        let cell = UITableViewCell(style: .default, reuseIdentifier: "recorderListcell")
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        return cell
    }
    
//    セルの背景色を設定
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(red: 236/255, green: 241/255, blue: 243/255, alpha: 1)
    }
    
//    セル選択時の背景色を設定
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.selectionStyle = .none
        cell?.backgroundColor = UIColor(red: 214/255, green: 225/255, blue: 232/255, alpha: 1)
    }
    
//    スワイプ削除アクションの実装
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "削除") { (action, view, completionHandler) in
            self.data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        completionHandler(true)}
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToEditorViewModally" {
            let secondVC = segue.destination as! RecorderEditorViewController
            secondVC.recorder = data[0]
                }
    }
    
}


