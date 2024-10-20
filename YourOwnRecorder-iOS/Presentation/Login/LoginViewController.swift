//
//  LoginViewController.swift
//  YourOwnRecorder-iOS
//
//  Created by 菅原実希 on 2024/10/20.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTextField.delegate = self
        errorMessageLabel.isHidden = true
        
        guard let id = UserDefaults.standard.string(forKey: "id"),
              let password = UserDefaults.standard.string(forKey: "password") else { return }
        
        idTextField.text = id
        passwordTextField.text = password
        
    }
    
    @IBAction func tappedLoginButton(_ sender: Any) {
        guard let id = idTextField.text, let password = passwordTextField.text else {
            errorMessageLabel.text = "IDまたはパスワードが未入力です"
            errorMessageLabel.isHidden = false
            return
        }
        
        guard let user = searchUser(by: id) else {
            errorMessageLabel.text = "IDまたはパスワードが正しくありません"
            errorMessageLabel.isHidden = false
            return
        }
        
        if passwordTextField.text == user.password {
            let defaults = UserDefaults.standard
            defaults.set(id, forKey: "id")
            defaults.set(password, forKey: "password")
            
            let nextVC = RecordersListViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}

func searchUser(by id: String) -> User? {
    //ユーザーデータを取得
    //これは仮のユーザーリスト
    let userList: [String : String] = [
        "10":"123456",
        "11":"123456",
        "12":"123456"
    ]
    
    if let correctPassword = userList[id] {
        let user = User(id, correctPassword)
        return user
    } else {
        return nil
    }
}
