//
//  VendorVC.swift
//  QB-marketAnalysis
//
//  Created by GUPTA, AKSHAT on 27/06/19.
//  Copyright © 2019 GUPTA, AKSHAT. All rights reserved.
//

import UIKit

class VendorVC: customVC ,UITableViewDelegate, UITableViewDataSource{
    
    var userToSend : Int = 0
    var stateVar : Int = 0
    @IBOutlet weak var vendorTableView: UITableView!
     var vendorNames : [String] = ["Mahima Chopra", "Sarthak Gupta", "Akshat Gupta"]
    var vendorImages : [UIImage] = [#imageLiteral(resourceName: "mahima"),#imageLiteral(resourceName: "sarthak"),#imageLiteral(resourceName: "akshat")]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vendorNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vendorCell", for: indexPath) as! vendorCell
       cell.awakeFromNib()
        cell.titleLabel.text = vendorNames[indexPath.row]
        cell.img.image = vendorImages[indexPath.row]
        cell.img.addGestureRecognizer(tap)
        cell.img.tag = indexPath.row
        cell.img.isUserInteractionEnabled = true
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select ho gya")
        self.userToSend = indexPath.row
      self.performSegue(withIdentifier: "showVendorProfile", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showVendorProfile") {
            let destinationVC = segue.destination as! VendorProfileVC
           
            destinationVC.user = self.userToSend
        }
    }
    
  
    
    var tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
    
    @objc func handleTap(_ gestureRecognizer : UITapGestureRecognizer ){
        self.userToSend = (gestureRecognizer.view?.tag)!
        self.performSegue(withIdentifier: "showVendorProfile", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vendorTableView.register(vendorCell.self, forCellReuseIdentifier: "vendorCell")
        vendorTableView.register(UINib(nibName: "vendorCell", bundle: nil   ), forCellReuseIdentifier: "vendorCell")
        
        vendorTableView.delegate = self
        vendorTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    @objc func showProfile(){
        print("tappe")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
