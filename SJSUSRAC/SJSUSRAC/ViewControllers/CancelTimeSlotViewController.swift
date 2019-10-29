//
//  CancelTimeSlotViewController.swift
//  SJSUSRAC
//
//  Created by Daniel Lee on 10/28/19.
//  Copyright © 2019 Daniel Lee. All rights reserved.
//

import UIKit

class CancelTimeSlotViewController: UIViewController {

    @IBOutlet weak var confirmButton: UIButton!
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        transitionToHomePage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setElements()
    }
    
    private func transitionToHomePage() {
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.HomeViewController) as? HomeViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }

    private func setElements() {
        Utilities.styleFilledButton(confirmButton)
    }
}
