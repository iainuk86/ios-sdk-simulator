//
//  ViewController.swift
//  ActiveSDK
//
//  Created by Iain on 24/11/21.
//

import UIKit

class BasicInfo: BaseAuthenticateController {
    
    @IBOutlet weak var ds: UISegmentedControl!
    @IBOutlet weak var messageVersion: UISegmentedControl!
    @IBOutlet weak var authenticationInd: UISegmentedControl!
    @IBOutlet weak var messageCategory: UISegmentedControl!
    
    @IBOutlet weak var acctNumber: UITextField!
    @IBOutlet weak var acctType: UITextField!
    @IBOutlet weak var transType: UITextField!
    
    let transTypes:[(label: String, value: String)] = [("None", ""), ("Goods/Service - 01", "01"),("Check Acceptance - 03", "03"),("Account Funding - 10", "10"),("Quasi-Cash Transaction - 11", "11"),("Prepaid Activation and Load - 28", "28"),]
    let acctTypes:[(label: String, value: String)] = [("None", ""), ("Not Applicable - 01", "01"), ("Credit - 02", "02"), ("Debit - 03", "03")]
    let acctNumbers:[(scenario: String, number: String)] = [("Frictionless", "4100000000000100"), ("Challenge", "4100000000005000"), ("Attempted", "4100000000100009"), ("Failed", "4100000000300005"), ("Unavailable", "4100000000300003"), ("Rejected", "4100000000500000")]
    
    var acctNumberPickerView = UIPickerView()
    var acctTypePickerView = UIPickerView()
    var transTypePickerView = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        acctNumberPickerView.delegate = self
        acctNumberPickerView.dataSource = self
        
        acctTypePickerView.delegate = self
        acctTypePickerView.dataSource = self
        
        transTypePickerView.delegate = self
        transTypePickerView.dataSource = self
        
        acctNumber.inputView = acctNumberPickerView
        acctType.inputView = acctTypePickerView
        transType.inputView = transTypePickerView
        
        let segmented = [ds, messageVersion, authenticationInd, messageCategory]
        for attr in segmented {
            attr?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
        }
    }
}

extension BasicInfo: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case acctTypePickerView:
            return acctTypes.count
        case acctNumberPickerView:
            return acctNumbers.count
        case transTypePickerView:
            return transTypes.count
        default:
            return -1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case acctTypePickerView:
            return acctTypes[row].label
        case acctNumberPickerView:
            return acctNumbers[row].scenario
        case transTypePickerView:
            return transTypes[row].label
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case acctTypePickerView:
            acctType.text = acctTypes[row].value
            self.view.endEditing(true)
        case acctNumberPickerView:
            acctNumber.text = acctNumbers[row].number
            self.view.endEditing(true)
        case transTypePickerView:
            transType.text = transTypes[row].value
            self.view.endEditing(true)
        default:
            return
        }
    }
    
    
}
