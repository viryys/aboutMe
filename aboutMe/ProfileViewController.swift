//
//  ProfileViewController.swift
//  aboutMe
//
//  Created by  Vadim Tatarchuk on 26.10.2020.
//  Copyright © 2020  Vadim Tatarchuk. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var labelWelcome: UILabel!
    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelWelcome.text = "Welcome, \(username ?? "<<Empty name>>")"
        
        view.backgroundColor = .cyan
    }
    

    @IBAction func actionLogOut() {
        print("Action logout")
        navigationController?.popToRootViewController(animated: true)
    }
}
