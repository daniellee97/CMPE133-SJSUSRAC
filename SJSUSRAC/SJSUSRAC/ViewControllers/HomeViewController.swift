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
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var checkInButton: UIButton!
    @IBOutlet weak var scanQRCodeButton: UIButton!
    
    
    private func getDay() {
        let weekday = Calendar.current.component(.weekday, from: Date())
        dayLabel.text = Calendar.current.weekdaySymbols[weekday-1]
        dayLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    
    @IBAction func signOut(_ sender: Any) {
        transitionToFirstPage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        busyHoursChart.contentMode = .scaleAspectFit
        // Do any additional setup after loading the view.
        MacawChartView.playAnimation()
        //dayLabel.text = String(weekday)
        getDay()
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
        Utilities.styleFilledButton(checkInButton)
        Utilities.styleFilledButton(scanQRCodeButton)
    }


}
