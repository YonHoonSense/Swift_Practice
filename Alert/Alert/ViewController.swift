//
//  ViewController.swift
//  Alert
//
//  Created by 이용훈 on 15/02/2020.
//  Copyright © 2020 Hoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    
    var isLampOn = true

    @IBOutlet var Lamping: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Lamping.image = imgOn
    }

    @IBAction func BtnLampON(_ sender: Any) {
        
        if(isLampOn == true) {
            let LampOnAlert = UIAlertController(title: "경고", message: "이미 ON 상태입니다.", preferredStyle: UIAlertController.Style.alert)
            let OnAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            LampOnAlert.addAction(OnAction)
            present(LampOnAlert, animated: true, completion: nil)
        }
        else {
            Lamping.image = imgOn
            isLampOn = true
        }
    }
    
    @IBAction func BtnLampOFF(_ sender: Any) {
        if isLampOn {
            let LampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            
            let OffAction = UIAlertAction(title: "YES", style: UIAlertAction.Style.default, handler: {ACTION in self.Lamping.image = self.imgOff
                self.isLampOn = false})
            
            let CancelAction = UIAlertAction(title: "NO", style: UIAlertAction.Style.default, handler: nil)
            
            LampOffAlert.addAction(OffAction)
            LampOffAlert.addAction(CancelAction)
            
            present(LampOffAlert, animated: true, completion: nil)
        }
        else {
            let AlreadyOff = UIAlertController(title: "경고", message: "이미 OFF 상태입니다", preferredStyle: UIAlertController.Style.alert)
            
            let AlreadyOffAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            
            AlreadyOff.addAction(AlreadyOffAction)
            present(AlreadyOff, animated: true, completion: nil)
        }
    }
    
    @IBAction func BtnLampREMOVE(_ sender: Any) {
        let LampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let OnAction = UIAlertAction(title: "ON", style: UIAlertAction.Style.default, handler: {ACTION in self.Lamping.image = self.imgOn
            self.isLampOn = true
        })
        
        let OffAction = UIAlertAction(title: "OFF", style: UIAlertAction.Style.default, handler: {ACTION in self.Lamping.image = self.imgOff
            self.isLampOn = false
        })
        
        let RemoveAction = UIAlertAction(title: "REMOVE", style: UIAlertAction.Style.default, handler: {ACTION in self.Lamping.image = self.imgRemove
            self.isLampOn = false
        })
        
        LampRemoveAlert.addAction(OnAction)
        LampRemoveAlert.addAction(OffAction)
        LampRemoveAlert.addAction(RemoveAction)
        present(LampRemoveAlert, animated: true, completion: nil)
    }
}

