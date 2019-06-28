//
//  ReportVC.swift
//  QB-marketAnalysis
//
//  Created by GUPTA, AKSHAT on 27/06/19.
//  Copyright © 2019 GUPTA, AKSHAT. All rights reserved.
//

import UIKit

class ReportVC: customVC {
    
    @IBOutlet weak var budgetLbl: UILabel!
    @IBOutlet weak var categoryLbl: UILabel!
    var budget  = String()
    var category = String()
    let cardHeight : CGFloat = 350
    let cardWidth : CGFloat = 354
    
    @IBOutlet weak var locationField: UILabel!
    var userToSend : Int = 0
    var stateVar : Int = 0
    @IBOutlet weak var financeBtn: UIButton!
    @IBOutlet weak var vendorBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    var images = [UIImageView]()
    var cardViews = [UIView]()
    
    var salesView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCapitalView()
        setSalesView()
        setCompetitionView()
        setEmployeeView()
        
        if(stateVar==0){
            locationField.text = "California, USA"
        }else if(stateVar==1){
            locationField.text = "New York, USA"
        }
        categoryLbl.text = category
        budgetLbl.text = budget
        
        vendorBtn.layer.cornerRadius = vendorBtn.bounds.height/10
        financeBtn.layer.cornerRadius = financeBtn.bounds.height/10

    }
    @IBAction func showVendor(_ sender: Any) {
        performSegue(withIdentifier: "showVendor", sender: self)
    }
    @IBAction func showFinance(_ sender: Any) {
        performSegue(withIdentifier: "showFinance", sender: self)
    }
    
    func setSalesView(){

        let myView = Bundle.loadView(fromNib: "salesPatternView", withType: UIView.self)
        var myImg : UIImage = UIImage()
        if(stateVar==0){
            myImg = #imageLiteral(resourceName: "hist1")
        }else{
            myImg = #imageLiteral(resourceName: "hist2")
        }
        let myImgView = UIImageView(image: myImg)
        myView.addSubview(myImgView)
        myImgView.frame = CGRect(x: 6, y: 46, width: 340, height: 300)
        myImgView.contentMode = .scaleAspectFit
        cardViews.append(myView)
        
    }
    func setCapitalView(){
        
        let myView = Bundle.loadView(fromNib: "capitalManagementView", withType: UIView.self)
        var myImg : UIImage = UIImage()
        if(stateVar==0){
            myImg = #imageLiteral(resourceName: "cali")
        }else{
            myImg = #imageLiteral(resourceName: "NY")
        }
        let myImgView = UIImageView(image: myImg)
        myView.addSubview(myImgView)
        myImgView.frame = CGRect(x: 6, y: 46, width: 340, height: 300)
        myImgView.contentMode = .scaleAspectFit
        cardViews.append(myView)
        
    }
    func setCompetitionView(){
        
        let myView = Bundle.loadView(fromNib: "CompetitionView", withType: UIView.self)
        cardViews.append(myView)
        
    }
    func setEmployeeView(){
        
        let myView = Bundle.loadView(fromNib: "EmployeeView", withType: UIView.self)
        cardViews.append(myView)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var contentWidth: CGFloat = 0.0
        
        print("Scrollview width: \(scrollView.frame.size.width)")
        
        let scrollWidth = scrollView.frame.size.width
        
        
        
        
        for x in 1...cardViews.count {
            
        
            var newX: CGFloat = 0.0
            
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x-1) - cardWidth/2
            
            
            contentWidth += newX
            
            scrollView.addSubview(cardViews[x-1])
            cardViews[x-1].frame = CGRect(x: newX , y: (scrollView.frame.size.height / 2) - cardHeight/2, width: cardWidth, height: cardHeight)
            
            
            
            
            
        }
        
        scrollView.clipsToBounds = false
       let cardscount = CGFloat(cardViews.count)
        scrollView.contentSize = CGSize(width: scrollWidth*cardscount, height: 350)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showVendor") {
            let destinationVC = segue.destination as! VendorVC
            
            destinationVC.userToSend = self.userToSend
            destinationVC.stateVar = self.stateVar
            
        }
        if (segue.identifier == "showFinance") {
            let destinationVC = segue.destination as! FinanceVC
            
            destinationVC.userToSend = self.userToSend
            destinationVC.stateVar = self.stateVar
            
        }
        
    }
    
  
    

}
extension Bundle {
    
    static func loadView<T>(fromNib name: String, withType type: T.Type) -> T {
        if let view = Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as? T {
            
            
            return view
        }
        
        fatalError("Could not load view with type " + String(describing: type))
    }
}
