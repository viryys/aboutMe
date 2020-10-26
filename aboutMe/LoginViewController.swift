//
//  ViewController.swift
//  aboutMe
//
//  Created by  Vadim Tatarchuk on 26.10.2020.
//  Copyright © 2020  Vadim Tatarchuk. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputUsername: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var buttonSignIn: UIButton!
    
    let user: User = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputUsername.delegate = self
        inputUsername.text = ""
        inputUsername.autocorrectionType = .no
        inputUsername.placeholder = "Username"
        inputUsername.returnKeyType = UIReturnKeyType.next
        
        inputPassword.delegate = self
        inputPassword.text = ""
        inputPassword.autocorrectionType = .no
        inputPassword.isSecureTextEntry = true
        inputPassword.placeholder = "Password"
        inputPassword.returnKeyType = UIReturnKeyType.done
        inputPassword.enablesReturnKeyAutomatically = true
        
        buttonSignIn.layer.cornerRadius = 8
        
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    func alertError (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == inputUsername {
            textField.resignFirstResponder()
            inputPassword.becomeFirstResponder()
        } else if textField == inputPassword {
            actionSignIn()
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let destinationVC = tabBarController.viewControllers?.first as! ProfileViewController
        let destinationVC2 = tabBarController.viewControllers?[1] as! SettingsViewController
        destinationVC.username = user.username
        destinationVC2.fullname = user.fullName
        destinationVC2.descriptionUser = user.description
    }
    
    @IBAction func actionSignIn() {
        if let pass = inputPassword.text, let name = inputUsername.text  {
            guard !pass.isEmpty else {
                alertError(title: "Password warning", message: "Your password is empty.")
                
                return
            }
            
            guard name == user.username && pass == user.password else {
                alertError(title: "Password warning", message: "Your login or password is incorrect.")
                inputPassword.text = ""
                
                return
            }

            performSegue(withIdentifier: "privateOffice", sender: nil)
            view.endEditing(true)
        }
    }
    
    @IBAction func actionForgotUserName() {
        alertError(title: "Did you forgot username?", message: "Your username is '\(user.username)'.")
    }
    
    @IBAction func actionForgotPassword() {
        alertError(title: "Did you forgot password?", message: "Your password is '\(user.password)'.")
    }
}
