//
//  inputVC.swift
//  QB-marketAnalysis
//
//  Created by GUPTA, AKSHAT on 27/06/19.
//  Copyright © 2019 GUPTA, AKSHAT. All rights reserved.
//

import UIKit

class inputVC: customVC, UIPickerViewDelegate,UIPickerViewDataSource {
    
    var stateVar : Int = 1
    var userToSend : Int = 0 
    
    @IBOutlet weak var stateField: UITextField!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView==categoryPickerView){
            return categoryData.count
        }else if(pickerView==capitalPickerView){
            return capitalData.count
        }else{
            return stateData.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView==categoryPickerView){
            return categoryData[row]
        }else if(pickerView==capitalPickerView){
            return capitalData[row]
        }else{
            return stateData[row]
        }
        
    }
    
    @IBAction func proceedToReports(_ sender: Any) {
        self.performSegue(withIdentifier: "showReport", sender: Any?.self)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView==categoryPickerView){
            categoryInputField.text = categoryData[row]
        }else if(pickerView==capitalPickerView){
            capitalInputField.text = capitalData[row]
        }else{
            stateField.text = stateData[row]
            stateVar = row
        }
        
        self.dismissKeyboard()
    }

    
   
    @IBOutlet weak var capitalInputField: UITextField!
    @IBOutlet weak var categoryInputField: UITextField!
     let categoryPickerView: UIPickerView = UIPickerView()
    let capitalPickerView: UIPickerView = UIPickerView()
    let statePickerView: UIPickerView = UIPickerView()
    
    @IBOutlet weak var proceedBtn: UIButton!
    
    var categoryData: [String] = [String]()
    var capitalData: [String] = [String]()
    var stateData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proceedBtn.layer.cornerRadius = proceedBtn.bounds.height/2
      
        // Do any additional setup after loading the view.
        
        self.categoryPickerView.delegate = self
        self.categoryPickerView.dataSource = self
        self.capitalPickerView.delegate = self
        self.capitalPickerView.dataSource = self
        self.statePickerView.delegate = self
        self.statePickerView.dataSource = self
        
        categoryInputField.inputView = categoryPickerView
        capitalInputField.inputView = capitalPickerView
        stateField.inputView = statePickerView
        
        categoryData = ["Manufacturing","Tours and Travels","Clothing","Food Chain","Retail","Logistics","Hospitality","Others"]
        capitalData = ["$2k-$5k","$5k-$10k","$10k-$25k","25k-$50k","$50k and above"]
        stateData = ["California","New York"]
        
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showReport") {
            let destinationVC = segue.destination as! ReportVC
            
            destinationVC.userToSend = self.userToSend
            destinationVC.stateVar = self.stateVar
            destinationVC.budget = (self.capitalInputField.text)!
            destinationVC.category = self.categoryInputField.text!
        }
       
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
