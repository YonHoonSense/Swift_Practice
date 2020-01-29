//
//  NewsDetailController.swift
//  HoonTable
//
//  Created by 이용훈 on 29/01/2020.
//  Copyright © 2020 Hoon. All rights reserved.
//

import UIKit

class NewsDetailController : UIViewController {
    
    @IBOutlet weak var ImageMain: UIImageView!
    
    @IBOutlet weak var LabalMain: UILabel!
    
    var imageUrl: String?
    var desc: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let img = imageUrl {
            
            if let data = try? Data(contentsOf: URL(string:img)!) {
                DispatchQueue.main.async {
                    self.ImageMain.image = UIImage(data: data)
                }
            }
        }
        
        if let d = desc {
            self.LabalMain.text = d
        }
    }
}
