//
//  ReportVC.swift
//  QB-marketAnalysis
//
//  Created by GUPTA, AKSHAT on 27/06/19.
//  Copyright © 2019 GUPTA, AKSHAT. All rights reserved.
//

import UIKit

class ReportVC: customVC {
    let cardHeight : CGFloat = 350
    let cardWidth : CGFloat = 354
    
    @IBOutlet weak var scrollView: UIScrollView!
    var images = [UIImageView]()
    var cardViews = [UIView]()
    
    var salesView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCapitalView()
        setSalesView()
        setCompetitionView()

    }
    
    func setSalesView(){

        let myView = Bundle.loadView(fromNib: "salesPatternView", withType: UIView.self)
        cardViews.append(myView)
        
    }
    func setCapitalView(){
        
        let myView = Bundle.loadView(fromNib: "capitalManagementView", withType: UIView.self)
        cardViews.append(myView)
        
    }
    func setCompetitionView(){
        
        let myView = Bundle.loadView(fromNib: "CompetitionView", withType: UIView.self)
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
    
  
    

}
extension Bundle {
    
    static func loadView<T>(fromNib name: String, withType type: T.Type) -> T {
        if let view = Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as? T {
            return view
        }
        
        fatalError("Could not load view with type " + String(describing: type))
    }
}
