//
//  ViewController.swift
//  NewHelloWorld
//
//  Created by 이용훈 on 06/02/2020.
//  Copyright © 2020 Hoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var LabelHello: UILabel!
    
    @IBOutlet var TextName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func SendButton(_ sender: Any) {
        LabelHello.text = "Hello, " + TextName.text! + "!"
    }
       

}

