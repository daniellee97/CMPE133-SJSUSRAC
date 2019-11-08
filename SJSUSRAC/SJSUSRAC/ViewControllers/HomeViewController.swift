//
//  HomeViewController.swift
//  SJSUSRAC
//
//  Created by Daniel Lee on 10/27/19.
//  Copyright © 2019 Daniel Lee. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {

    @IBOutlet weak var reserveTimeSlotButton: UIButton!
    @IBOutlet weak var cancelTimeSlotButton: UIButton!
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var busyHoursChart: UIView!
    
    
    @IBAction func signOut(_ sender: Any) {
        transitionToFirstPage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        busyHoursChart.contentMode = .scaleAspectFit
        // Do any additional setup after loading the view.
        MacawChartView.playAnimation()
        setElements()
    }
    
    private func transitionToFirstPage() {
        let firstPageViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.FirstPageController) as? ViewController
        view.window?.rootViewController = firstPageViewController
        view.window?.makeKeyAndVisible()
    }
    
    private func setElements(){
        Utilities.differentStyleFilledButton(reserveTimeSlotButton)
        Utilities.styleHollowButton(cancelTimeSlotButton)
        Utilities.styleFilledButton(signOutButton)
    }


}
