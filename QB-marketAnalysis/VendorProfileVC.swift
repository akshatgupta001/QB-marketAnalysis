//
//  VendorProfileVC.swift
//  QB-marketAnalysis
//
//  Created by GUPTA, AKSHAT on 28/06/19.
//  Copyright © 2019 GUPTA, AKSHAT. All rights reserved.
//

import UIKit

class VendorProfileVC: customVC {

    @IBOutlet weak var vendorAddress: UILabel!
    @IBOutlet weak var venderMail: UILabel!
    @IBOutlet weak var vendorPhone: UILabel!
    @IBOutlet weak var vendorCompany: UILabel!
    @IBOutlet weak var vendorTitle: UILabel!
    @IBOutlet weak var vendorImg: UIImageView!
    var user : Int = 1
    
    var vendorNames : [String] = ["Mahima Chopra", "Sarthak Gupta", "Akshat Gupta"]
    var vendorImages : [UIImage] = [#imageLiteral(resourceName: "mahima"),#imageLiteral(resourceName: "sarthak"),#imageLiteral(resourceName: "akshat")]
    var vendorEmails : [String] = ["mahima@gmail.com", "sgupta@gmail.com", "akshat@gmail.com"]
    var vendorPhones : [String] = ["+(102)734-354-989", "+(102)765-954-98", "+(102)904-054-98"]
    var vendorAddresses : [String] = ["Beverly Hills, California", "Street Sacramentos, California", "Union Street Eureka, CA"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
                self.vendorImg.image = vendorImages[user]
                self.vendorTitle.text = vendorNames[user]
        self.venderMail.text = vendorEmails[user]
        self.vendorPhone.text = vendorPhones[user]
        self.vendorAddress.text = vendorAddresses[user]
                
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
