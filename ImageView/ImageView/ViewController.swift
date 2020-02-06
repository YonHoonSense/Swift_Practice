//
//  ViewController.swift
//  ImageView
//
//  Created by 이용훈 on 06/02/2020.
//  Copyright © 2020 Hoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isonoff = false
    var imgOn: UIImage?
    var imgOff: UIImage?

    @IBOutlet var ImgView: UIImageView!
    
    @IBOutlet var OnoffBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "light_on")
        imgOff = UIImage(named: "light_off")
        
        ImgView.image = imgOn
    }

    @IBAction func OnoffImg(_ sender: Any) {
        
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight:CGFloat
        
        if(isonoff) {
            newWidth = ImgView.frame.width/scale
            newHeight = ImgView.frame.height/scale
            OnoffBtn.setTitle("확대", for: .normal)
        } else {
            newWidth = ImgView.frame.width * scale
            newHeight = ImgView.frame.height * scale
            OnoffBtn.setTitle("축소", for: .normal)
        }
        
        ImgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isonoff = !isonoff
    }
    
    @IBAction func OnoffSwitch(_ sender: UISwitch) {
        
        if sender.isOn {
            ImgView.image = imgOn
        } else {
            ImgView.image = imgOff
        }
    }
    
}

