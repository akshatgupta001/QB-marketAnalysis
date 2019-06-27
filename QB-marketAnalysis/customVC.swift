//
//  customVC.swift
//  QB-marketAnalysis
//
//  Created by GUPTA, AKSHAT on 27/06/19.
//  Copyright © 2019 GUPTA, AKSHAT. All rights reserved.
//

import UIKit

class customVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //create a new button
     setQB()
        hideKeyboard()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setQB(){
        
        let logo = UIImageView(image: #imageLiteral(resourceName: "qb_logo"))
        logo.frame = CGRect(x: 0, y: 0, width: 30, height: 8)
        logo.contentMode = .scaleAspectFit
        self.navigationItem.titleView = logo
    }
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        //        self.view.resignFirstResponder()
        self.view.endEditing(true)
    }
   

}
