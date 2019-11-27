//
//  CancelTimeSlotViewController.swift
//  SJSUSRAC
//
//  Created by Daniel Lee on 10/28/19.
//  Copyright © 2019 Daniel Lee. All rights reserved.
//

import UIKit
import Firebase

class CancelTimeSlotViewController: UIViewController {

    @IBOutlet weak var firstCancelButton: UIButton!
    @IBOutlet weak var secondReservationLabel: UILabel!
    @IBOutlet weak var firstReservationLabel: UILabel!
    @IBOutlet weak var secondCancelButton: UIButton!
    
    var reservedTime = [String:String]()
    
    @IBAction func firstCancelButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func secondCancelButtonTapped(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveData()
        
        // Do any additional setup after loading the view.
        setElements()
    }
    
    private func retrieveData() {
        let db = Firestore.firestore()
        let currentUid = Auth.auth().currentUser!.uid
        db.collection("users").whereField("uid", isEqualTo: currentUid).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting Document")
            } else {
                let doc = querySnapshot!.documents[0]
                let documentId = doc.documentID
                let reservationRef = db.collection("users").document(documentId)
                reservationRef.getDocument { (snapshot, err) in
                    if let err = err {
                        print("Error occured")
                    } else {
                        let doc = snapshot!.get("reservation") as! [String:String]
                        self.reservedTime = doc
                        self.firstReservationLabel.text = self.reservedTime.first!.key + " at " + self.reservedTime.first!.value
                        if self.reservedTime.count > 1 {
                            self.secondReservationLabel.text = Array(self.reservedTime.keys)[1] + " at " + Array(self.reservedTime.values)[1]
                        }
                        
                    }
                }
                
            }
        }
    }
    
    private func transitionToHomePage() {
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.HomeViewController) as? HomeViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    private func setElements() {
        Utilities.differentStyleFilledButton(firstCancelButton)
        Utilities.differentStyleFilledButton(secondCancelButton)
    }
}
