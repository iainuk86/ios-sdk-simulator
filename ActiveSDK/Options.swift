//
//  ViewController.swift
//  ActiveSDK
//
//  Created by Iain on 24/11/21.
//

import UIKit

class Options: BaseAuthenticateController {
    
    @IBOutlet weak var sdkInterface: UISegmentedControl!
    @IBOutlet weak var cancelChallengeReason: UISegmentedControl!
    @IBOutlet weak var requestorDecReqInd: UISegmentedControl!
    
    @IBOutlet weak var whitelistStatus: UITextField!
    
    let whitelistStatuses:[(label: String, value: String)] = [("None", ""), ("Whitelisted - Y", "Y"),("Not Whitelisted - N", "N"),("Not Eligible - E", "E"),("Pending Confirmation - P", "P"),("Rejected - R", "R"), ("Unknown - U", "U")]
    
    var whitelistStatusPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        whitelistStatusPickerView.delegate = self
        whitelistStatusPickerView.dataSource = self
        whitelistStatus.inputView = whitelistStatusPickerView
        
        let segmented = [sdkInterface, cancelChallengeReason, requestorDecReqInd]
        for attr in segmented {
            attr?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
        }
    }
}

extension Options: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case whitelistStatusPickerView:
            return whitelistStatuses.count;
        default:
            return -1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case whitelistStatusPickerView:
            return whitelistStatuses[row].label
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case whitelistStatusPickerView:
            whitelistStatus.text = whitelistStatuses[row].value
            self.view.endEditing(true)
        default:
            return
        }
    }
    
    
}
