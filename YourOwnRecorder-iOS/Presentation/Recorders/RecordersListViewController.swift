//
//  RecordersListViewController.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/20.
//

import UIKit

class RecordersListViewController: UITableViewController {
    
    var recorders: [Recorder] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //仮のデータ
        recorders = [
            Recorder(id: UUID(), title: "ランニング", description: "走った距離と時間の記録"),
            Recorder(id: UUID(), title: "コーヒー", description: "飲んだコーヒーの記録"),
            Recorder(id: UUID(), title: "旅行", description: "旅行した都道府県や国の記録")
        ]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recorders.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordersListCell", for: indexPath)
        cell.textLabel?.text = recorders[indexPath.row].title
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetailFromRecordersList", sender: recorders[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetailFromRecordersList" {
            let detailVC = segue.destination as! RecorderDetailViewController
            detailVC.recorder = sender as! Recorder
        }
            
    }

    @IBAction func tappedRecorderCreationButton(_ sender: Any) {
        performSegue(withIdentifier: "goToRecorderCreation", sender: nil)
    }
}


