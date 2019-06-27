//
//  inputVC.swift
//  QB-marketAnalysis
//
//  Created by GUPTA, AKSHAT on 27/06/19.
//  Copyright © 2019 GUPTA, AKSHAT. All rights reserved.
//

import UIKit

class inputVC: customVC, UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView==categoryPickerView){
            return categoryData.count
        }else{
            return capitalData.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView==categoryPickerView){
            return categoryData[row]
        }else{
            return capitalData[row]
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView==categoryPickerView){
            categoryInputField.text = categoryData[row]
        }else{
            capitalInputField.text = capitalData[row]
        }
        
        self.dismissKeyboard()
    }

    @IBOutlet weak var financeBtn: UIButton!
    @IBOutlet weak var vendorBtn: UIButton!
   
    @IBOutlet weak var capitalInputField: UITextField!
    @IBOutlet weak var categoryInputField: UITextField!
     let categoryPickerView: UIPickerView = UIPickerView()
    let capitalPickerView: UIPickerView = UIPickerView()
    
    @IBOutlet weak var proceedBtn: UIButton!
    
    var categoryData: [String] = [String]()
    var capitalData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proceedBtn.layer.cornerRadius = proceedBtn.bounds.height/2
        vendorBtn.layer.cornerRadius = vendorBtn.bounds.height/10
        financeBtn.layer.cornerRadius = financeBtn.bounds.height/10
        // Do any additional setup after loading the view.
        
        self.categoryPickerView.delegate = self
        self.categoryPickerView.dataSource = self
        self.capitalPickerView.delegate = self
        self.capitalPickerView.dataSource = self
        
        categoryInputField.inputView = categoryPickerView
        capitalInputField.inputView = capitalPickerView
        
        categoryData = ["Manufacturing","Tours and Travels","Clothing","Food Chain","Retail","Logistics","Hospitality","Others"]
        capitalData = ["$2k-$5k","$5k-$10k","$10k-$25k","25k-$50k","$50k and above"]
        
        
        
    }

    @IBAction func showVendor(_ sender: Any) {
        performSegue(withIdentifier: "showVendor", sender: self)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
