//
//  RecorderDetailViewController.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/20.
//

import UIKit

class RecorderDetailViewController: UITableViewController {
    
    var recorder: Recorder
    var records: [Record]
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = recorder.title
        descriptionTextView.text = recorder.description
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecorderItemsListCell", for: indexPath)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        cell.textLabel?.text = dateFormatter.string(from: records[indexPath.row].updatedDate)
        return cell
    }
    
    
    @IBAction func moveToRecorderEditionWithParameter(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToRecorderEdition", sender: recorder)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToRecorderEdition" {
            let editorVC = segue.destination as! RecorderEditionViewController
            editorVC.recorder = sender as! Recorder
        }
    }
    
    @IBAction func tappedPlusButton(_ sender: Any) {
        //record登録画面へ遷移
    }
    
}
