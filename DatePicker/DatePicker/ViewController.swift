//
//  ViewController.swift
//  DatePicker
//
//  Created by 이용훈 on 11/02/2020.
//  Copyright © 2020 Hoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0

    @IBOutlet var CurrentTime: UILabel!
    @IBOutlet var PickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
    }

    @IBAction func ChangeDate(_ sender: Any) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        PickerTime.text = "선택 시간 : " + formatter.string(from: (datePickerView as AnyObject).date)
    }
    
    @objc func updateTime() {
       /* CurrentTime.text = String(count)
        count = count + 1 */
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        CurrentTime.text = "현재 시간 : " + formatter.string(from: date as Date)
    }
}

