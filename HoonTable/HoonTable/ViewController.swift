//
//  ViewController.swift
//  HoonTable
//
//  Created by 이용훈 on 26/01/2020.
//  Copyright © 2020 Hoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var TableViewMain: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Data의 갯수
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //어떤 Data를 넣을 것인지?
        
        //let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1")
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        
        // as? - 확실하지 않을 때, as! - 확실할 때
        
        cell.LabelText.text = "\(indexPath.row)"
        
        //cell.textLabel?.text = "\(indexPath.row)"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
    }
    
    //Table View Practice


}

