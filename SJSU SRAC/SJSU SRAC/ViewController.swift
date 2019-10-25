//
//  ViewController.swift
//  SJSU SRAC
//
//  Created by student on 10/11/19.
//  Copyright © 2019 SJSU-Windows-Specialists. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userTextField.text = ""
        passwordTextField.text = ""
        if #available(iOS 11.0, *) {
            ViewController.
        }
        
    }
    @IBAction func createAccountClicked(_ sender: Any) {
        print("Button clicked!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

