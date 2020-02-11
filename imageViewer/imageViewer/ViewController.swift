//
//  ViewController.swift
//  imageViewer
//
//  Created by 이용훈 on 11/02/2020.
//  Copyright © 2020 Hoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var DogImage: UIImageView!
    
    var numImage = 1
    var maxImage = 5
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let imageName = UIImage(named: String(numImage) + ".jpg")
        DogImage.image = imageName
        
    }

    @IBAction func ClickPreBtn(_ sender: Any) {
        numImage = numImage - 1
        if (numImage < 1) {
            numImage = maxImage
        }
        let imageName = UIImage(named: String(numImage) + ".jpg")
        DogImage.image = imageName
        
    }
    
    @IBAction func ClickNextBtn(_ sender: Any) {
        numImage = numImage + 1
        
        if (numImage > maxImage) {
            numImage = 1
        }
        let imageName = UIImage(named: String(numImage) + ".jpg")
        DogImage.image = imageName

    }
    
}

