//
//  FinanceVC.swift
//  QB-marketAnalysis
//
//  Created by GUPTA, AKSHAT on 28/06/19.
//  Copyright © 2019 GUPTA, AKSHAT. All rights reserved.
//

import UIKit

class FinanceVC: customVC,UITableViewDelegate, UITableViewDataSource{
    
    var stateVar :Int = 0
    var financeNames : [[String]]  = [[String]]()
    var financeImages : [[UIImage]] = [[UIImage]]()
    var finance1Names : [String] = ["NAB", "Wells Fargo", "Tide"]
    var finance1Images : [UIImage] = [#imageLiteral(resourceName: "nab"),#imageLiteral(resourceName: "wells_fargo"),#imageLiteral(resourceName: "tide")]
    var finance2Names : [String] = [ "Bank of Ireland", "South State Bank", "JP Morgan"]
    var finance2Images : [UIImage] = [#imageLiteral(resourceName: "ireland-bank"),#imageLiteral(resourceName: "south-state-bank"),#imageLiteral(resourceName: "jp_morgan")]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return financeNames[stateVar].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vendorCell", for: indexPath) as! vendorCell
        cell.awakeFromNib()
        cell.titleLabel.text = financeNames[stateVar][indexPath.row]
        cell.img.image = financeImages[stateVar][indexPath.row]
        cell.star1.isHidden = true
        cell.star2.isHidden = true
        cell.star3.isHidden = true
        cell.star4.isHidden = true
        cell.star5.isHidden = true
        cell.milesLbl.isHidden = true
        cell.milesLogo.isHidden = true
        
        return cell
    }
    
    
    var userToSend : Int = 0
    @IBOutlet weak var financeTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        financeImages.append(finance1Images)
        financeImages.append(finance2Images)
        financeNames.append(finance1Names)
        financeNames.append(finance2Names)
        
        
        financeTableView.register(vendorCell.self, forCellReuseIdentifier: "vendorCell")
        financeTableView.register(UINib(nibName: "vendorCell", bundle: nil   ), forCellReuseIdentifier: "vendorCell")
        
        financeTableView.delegate = self
        financeTableView.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select ho gya - finance")
        self.userToSend = indexPath.row
        self.performSegue(withIdentifier: "showFinanceProfile", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showFinanceProfile") {
            let destinationVC = segue.destination as! FinanceProfileVC
            
            destinationVC.user = self.userToSend
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
