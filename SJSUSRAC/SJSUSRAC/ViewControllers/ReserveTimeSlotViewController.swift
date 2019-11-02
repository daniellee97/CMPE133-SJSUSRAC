//
//  ReserveTimeSlotViewController.swift
//  SJSUSRAC
//
//  Created by Daniel Lee on 10/28/19.
//  Copyright © 2019 Daniel Lee. All rights reserved.
//

import UIKit

class CellClass: UITableViewCell {
    
}

class ReserveTimeSlotViewController: UIViewController {

    @IBOutlet weak var selectDateButton: UIButton!
    @IBOutlet weak var selectTimeButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    
    let transparentView = UIView()
    let tableView = UITableView()
    var selectedButton = UIButton()
    
    var dataSource = [String]()
    
   func addTransparentView(frames: CGRect) {
       let window = UIApplication.shared.keyWindow
       transparentView.frame = window?.frame ?? self.view.frame
       self.view.addSubview(transparentView)
       
       tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
       self.view.addSubview(tableView)
       tableView.layer.cornerRadius = 5
       
       transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
       tableView.reloadData()
       let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
       transparentView.addGestureRecognizer(tapgesture)
       transparentView.alpha = 0
       UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
           self.transparentView.alpha = 0.5
           self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: CGFloat(self.dataSource.count * 50))
       }, completion: nil)
   }
   
   @objc func removeTransparentView() {
       let frames = selectedButton.frame
       UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
           self.transparentView.alpha = 0
           self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
       }, completion: nil)
   }

    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        transitionToHomePage()
    }
    
    @IBAction private func dateButtonTapped(_ sender: Any) {
        dataSource = ["11/01/19", "11/02/19", "11/03/19"]
        selectedButton = selectDateButton
        addTransparentView(frames: selectDateButton.frame)
        
    }
    
    @IBAction private func timeButtonTapped(_ sender: Any) {
        dataSource = ["6:00", "7:00", "8:00"]
        selectedButton = selectTimeButton
        addTransparentView(frames: selectTimeButton.frame)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CellClass.self, forCellReuseIdentifier: "Cell")
        setElements()
    }
    
    private func transitionToHomePage() {
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.HomeViewController) as? HomeViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    private func setElements() {
        Utilities.styleFilledButton(confirmButton)
        Utilities.styleFilledButton(selectDateButton)
        Utilities.styleFilledButton(selectTimeButton)
    }

}

extension ReserveTimeSlotViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedButton.setTitle(dataSource[indexPath.row], for: .normal)
        removeTransparentView()
    }
}

