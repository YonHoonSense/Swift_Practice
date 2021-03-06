//
//  ViewController.swift
//  AlertAlarm
//
//  Created by 이용훈 on 15/02/2020.
//  Copyright © 2020 Hoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let timeSelector: Selector = #selector(ViewController.updateTime)
        let interval = 1.0
        var count = 0
        var alarmTime: String?
        var isOK = true

        
    @IBOutlet var CurrentLabel: UILabel!
    @IBOutlet var PickerLabel: UILabel!
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
            
        }

        @IBAction func DatePicker(_ sender: Any) {
            
            let datePickerView = sender
            
            let formatter = DateFormatter()
            
            formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
            
            PickerLabel.text = "선택 시간 : " + formatter.string(from: (datePickerView as AnyObject).date)
            
            formatter.dateFormat = "hh:mm aaa"
            alarmTime = formatter.string(from: (datePickerView as AnyObject).date)
        }
        
        @objc func updateTime() {
            
            let date = NSDate()
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
            CurrentLabel.text = "현재 시간 : " + formatter.string(from: date as Date)
            
            formatter.dateFormat = "hh:mm aaa"
            let currentTime = formatter.string(from: date as Date)
            
            if (currentTime == alarmTime && isOK == true) {
                let Alert = UIAlertController(title: "알림", message: "설정된 시간입니다", preferredStyle: UIAlertController.Style.alert)
                
                let OkAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                Alert.addAction(OkAction)
                present(Alert, animated: true, completion: nil)
                isOK = false
                
            }
            else {
                view.backgroundColor = UIColor.white
            }
            
            if (currentTime != alarmTime) {
                isOK = true
            }
            
            
            
            
        }
        
}

