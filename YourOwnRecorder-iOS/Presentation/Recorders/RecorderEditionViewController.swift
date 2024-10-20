//
//  RecorderEditionViewController.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/20.
//

import UIKit

class RecorderEditionViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var recorder: Recorder? = nil
    var inputItems: [InputItem] = InputItem.allCases
    var selectedInputItem: InputItem? = nil
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func titleTextField(_ sender: Any) {
    }
    @IBOutlet weak var inputItemPickerView: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if recorder == nil {
            self.title = "Recorder Creation"
        } else {
            self.title = "Recorder Edition"
        }
        
        inputItemPickerView.delegate = self
        inputItemPickerView.dataSource = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return inputItems.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let inputItemStrings = inputItems.map { $0.getString() }
        return inputItemStrings[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedInputItem = inputItems[row]
    }
    
    @IBAction func addInputItemButton(_ sender: Any) {
        if let inputItem = selectedInputItem {
            let inputItemModalVC: UIViewController
            
            switch inputItem {
            case .textField:
                inputItemModalVC = UIStoryboard(name: "InputItemModals", bundle: nil).instantiateViewController(withIdentifier: "TextFieldItemModalViewController") as! TextFieldItemModalViewController
            case .textArea:
                inputItemModalVC = UIStoryboard(name: "InputItemModals", bundle: nil).instantiateViewController(withIdentifier: "TextAreaItemModalViewController") as! TextAreaItemModalViewController
            case .slider:
                inputItemModalVC = UIStoryboard(name: "InputItemModals", bundle: nil).instantiateViewController(withIdentifier: "SliderItemModalViewController") as! SliderItemModalViewController
            case .calender:
                inputItemModalVC = UIStoryboard(name: "InputItemModals", bundle: nil).instantiateViewController(withIdentifier: "CalenderItemModalViewController") as! CalenderItemModalViewController
            case .numberField:
                inputItemModalVC = UIStoryboard(name: "InputItemModals", bundle: nil).instantiateViewController(withIdentifier: "NumberFieldItemModalViewController") as! NumberFieldItemModalViewController
            case .selectField:
                inputItemModalVC = UIStoryboard(name: "InputItemModals", bundle: nil).instantiateViewController(withIdentifier: "SelectFieldItemModalViewController") as! SelectFieldItemModalViewController
            }
            
            self.present(inputItemModalVC, animated: true, completion: nil)
        }
    }
    
}
