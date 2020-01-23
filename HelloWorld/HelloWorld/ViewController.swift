//
//  ViewController.swift
//  HelloWorld
//
//  Created by 이용훈 on 23/01/2020.
//  Copyright © 2020 Hoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func Click_MoveBtn(_ sender: Any) {
        
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailController") {
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

