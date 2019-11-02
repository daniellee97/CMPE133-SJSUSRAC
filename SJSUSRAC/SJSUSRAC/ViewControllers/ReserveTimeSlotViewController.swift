//
//  ReserveTimeSlotViewController.swift
//  SJSUSRAC
//
//  Created by Daniel Lee on 10/28/19.
//  Copyright © 2019 Daniel Lee. All rights reserved.
//

import UIKit

class ReserveTimeSlotViewController: UIViewController {

    @IBOutlet weak var selectDateButton: UIButton!
    @IBOutlet weak var selectTimeButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    
    let transparentView = UIView()
    
    private func addTransparentView() {
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
    }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        transitionToHomePage()
    }
    
    @IBAction private func dateButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction private func timeButtonTapped(_ sender: Any) {
        
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
