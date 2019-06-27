//
//  ViewController.swift
//  QB-marketAnalysis
//
//  Created by GUPTA, AKSHAT on 27/06/19.
//  Copyright © 2019 GUPTA, AKSHAT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
//        imgView.layer.cornerRadius = imgView.bounds.height/2
//
//        showLeaderboard.layer.cornerRadius = showLeaderboard.bounds.height/2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

