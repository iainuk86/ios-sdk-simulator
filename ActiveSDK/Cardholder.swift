//
//  Cardholder.swift
//  ActiveSDK
//
//  Created by Iain on 26/11/21.
//

import UIKit

class Cardholder: BaseAuthenticateController {
    
    @IBOutlet weak var hiddenShippingView: UIView!
    @IBOutlet weak var shippingSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shippingSwitch.addTarget(self, action: #selector(shippingStateChange), for: .valueChanged)
    }
    
    @objc func shippingStateChange(switchState: UISwitch) {
        if switchState.isOn {
            hiddenShippingView.isHidden = true
        } else {
            hiddenShippingView.isHidden = false
        }
    }
}
