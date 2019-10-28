//
//  CreateAccountViewController.swift
//  SJSUSRAC
//
//  Created by Daniel Lee on 10/27/19.
//  Copyright © 2019 Daniel Lee. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    // textfields and buttons
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var studentIDTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // hide error message as default
        errorLabel.alpha = 0
        setElements()
    }
    
    // set up textfields and buttons
    private func setElements() {
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(studentIDTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    
    // validate all text fields
    private func validateTextFields() -> String? {
        
        // check if textfields are all filled
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in required fields"
        }
        
        // check if the password met the requirements
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if !Utilities.isPasswordValid(cleanedPassword) {
            return "Please, make sure your password is at least 8 characters, containing letter, number and special character"
        }
        
        return nil
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        let error = validateTextFields()
        if error != nil {
            showErrorMessage(error!)
        }else {
            
            //create cleaned version of the data
        }
    }
    
    private func showErrorMessage (_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    

}
