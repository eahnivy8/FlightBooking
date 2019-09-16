//
//  ViewController.swift
//  FlightBooking
//
//  Created by Eddie Ahn on 15/09/2019.
//  Copyright © 2019 Eddie Ahn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var buttonTag = 1
    @IBOutlet var departureDateButton: UIButton!
    @IBOutlet var returnDateLabel: UILabel!
    @IBOutlet var returnDateButton: UIButton!
    @IBOutlet var selectDatePicker: UIDatePicker!
    
    @IBAction func showDatePickerAction(_ sender: UIButton) {
        if selectDatePicker.isHidden == false {
            selectDatePicker.isHidden = true
        } else {
            selectDatePicker.isHidden = false
        }
        buttonTag = sender.tag
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        returnDateLabel.isHidden = true
        returnDateButton.isHidden = true
        selectDatePicker.isHidden = true
    }
    
    @IBAction func showReturnDateAction(_ sender: UISwitch) {
        //        if sender.isOn {
        //            returnDateButton.isHidden = false
        //            returnDateLabel.isHidden = false
        //        } else {
        //            returnDateButton.isHidden = true
        //            returnDateLabel.isHidden = true
        //        }
        returnDateButton.isHidden = !sender.isOn
        returnDateLabel.isHidden = !sender.isOn
    }
    
    @IBAction func selectedDateAction(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YY-MM-d hh:mma"
        let dateString = formatter.string(from: sender.date)
        if buttonTag == 1 {
            departureDateButton.setTitle(dateString, for:.normal)
        } else {
            returnDateButton.setTitle(dateString, for: .normal)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        self.selectDatePicker.isHidden = true
    }
}


