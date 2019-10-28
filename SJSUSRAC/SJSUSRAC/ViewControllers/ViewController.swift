//
//  ViewController.swift
//  SJSUSRAC
//
//  Created by Daniel Lee on 10/27/19.
//  Copyright © 2019 Daniel Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        errorLabel.alpha = 0
        setEletments()
    }
    
    private func setEletments() {
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(logInButton)
        Utilities.styleHollowButton(createAccountButton)
    }
    

}

