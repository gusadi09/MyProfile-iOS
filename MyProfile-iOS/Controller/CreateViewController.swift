//
//  ViewController.swift
//  MyProfile-iOS
//
//  Created by Gus Adi on 22/07/20.
//  Copyright © 2020 Gus Adi. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var dicoding: UIImageView!
    @IBOutlet weak var createButton: RoundButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var professionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createButton.pinkColor()
    }

    @IBAction func createPressed(_ sender: Any) {
        if let name = nameTextField.text, let email = emailTextField.text, let prof = professionTextField.text {
            if name.isEmpty {
                textEmpty("Name")
            } else if email.isEmpty {
                textEmpty("Email")
            } else if prof.isEmpty {
                textEmpty("Profession")
            } else {
                saveProfil(name, email, prof)
                self.performSegue(withIdentifier: "moveToHome", sender: self)
            }
        }
    }
    
    func saveProfil(_ name: String, _ email: String, _ profession: String) {
        ProfileMode.stateLogin = true
        ProfileMode.name = name
        ProfileMode.email = email
        ProfileMode.profession = profession
    }
    
    func textEmpty(_ field: String) {
        let alert = UIAlertController(title: "Alert", message: "\(field) is empty", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

