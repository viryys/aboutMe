//
//  SettingsViewController.swift
//  aboutMe
//
//  Created by  Vadim Tatarchuk on 26.10.2020.
//  Copyright © 2020  Vadim Tatarchuk. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var labelFullname: UILabel!
    @IBOutlet weak var descriptionField: UITextView!
    
    var fullname: String = ""
    var descriptionUser: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelFullname.text = fullname
        descriptionField.text = descriptionUser
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
