//
//  DetailViewController.swift
//  MyProfile-iOS
//
//  Created by Gus Adi on 22/07/20.
//  Copyright © 2020 Gus Adi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var dicoding: UIImageView!
    @IBOutlet weak var detailText: UILabel!
    @IBOutlet weak var emailText: UILabel!
    @IBOutlet weak var resetButton: RoundButton!
    @IBOutlet weak var editButton: RoundButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        editButton.pinkColor()
        resetButton.pinkColor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ProfileMode.synchronize()
        detailText.text = "\(ProfileMode.name) as \(ProfileMode.profession)"
        emailText.text = ProfileMode.email
    }
    
    @IBAction func editPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "moveToUpdate", sender: self)
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        if ProfileMode.deteleAll(){
            self.performSegue(withIdentifier: "moveToCreate", sender: self)
        }
    }
}
