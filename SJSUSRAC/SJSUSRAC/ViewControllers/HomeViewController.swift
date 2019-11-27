//
//  HomeViewController.swift
//  SJSUSRAC
//
//  Created by Daniel Lee on 10/27/19.
//  Copyright © 2019 Daniel Lee. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    @IBOutlet weak var reserveTimeSlotButton: UIButton!
    @IBOutlet weak var cancelTimeSlotButton: UIButton!
    @IBOutlet weak var signOutButton: UIButton!

    
    @IBAction func signOut(_ sender: Any) {
        transitionToFirstPage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetTimeSlots()
        // Do any additional setup after loading the view.
        setElements()
    }
    
    // reset time slots in database every day
    private func resetTimeSlots () {
        let time = getCurrentTime()
        
        let timeReference = Firestore.firestore().collection("reservation_chart")
        if time == "12:00 PM"{
            
            timeReference.addSnapshotListener { (snapshot, _) in
                guard let snapshot = snapshot else { return }
                let doc = snapshot.documents
                let dic = doc[1].data()
                var renewedTimeSlot = dic
                for key in renewedTimeSlot.keys{
                    renewedTimeSlot.updateValue(true, forKey: key)
                }

                timeReference.document("LjUpSZCIviFeSq3fPCzc").setData(dic)
                timeReference.document("SIg6q6u9flbtkVWTiPYn").setData(renewedTimeSlot)
            }
        }
    }
    
    private func getCurrentTime() -> String{
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let str = formatter.string(from: Date())
        return str
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
