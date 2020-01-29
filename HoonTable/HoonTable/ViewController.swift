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
    
    var NewsData :Array<Dictionary<String, Any>>?
    
    //http통신 - urlsession
    //JSON 형식 : {"key":"value"} or {["value", "value", "value"]} ...
    
    func getNews() {
        let task = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=14a719d834a948a79392cda8293387b5")!) { (data, response, error) in
            
            if let dataJson = data {
               
                do {
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: [])  as! Dictionary<String, Any>
                    let articles = json["articles"] as! Array<Dictionary<String, Any>>
                    print(articles)
                    self.NewsData = articles
                    
                    DispatchQueue.main.async {
                        self.TableViewMain.reloadData()
                    }
                }
                catch {}
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Data의 갯수
        if let news = NewsData {
            return news.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //어떤 Data를 넣을 것인지?
        
        //let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1")
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        
        // as? - 확실하지 않을 때, as! - 확실할 때
        
        let idx = indexPath.row
        
        if let news = NewsData {
            let row = news[idx]
            if let r = row as? Dictionary<String, Any> {
                
                if let title = r["title"]  as? String {
                    cell.LabelText.text = title
                }
            }
        }
        
        //cell.textLabel?.text = "\(indexPath.row)"
        
        
        return cell
    }
    
    // 1. 클릭 감지
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Click ! \(indexPath.row)")
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "NewsDetailController") as! NewsDetailController
        
       if let news = NewsData {
           let row = news[indexPath.row]
           if let r = row as? Dictionary<String, Any> {
               
               if let imageUrl = r["urlToImage"]  as? String {
                   controller.imageUrl = imageUrl
               }
               if let desc = r["description"]  as? String {
                   controller.desc = desc
               }
           }

       }
        
        //showDetailViewController(controller, sender: nil)
    }
    
    // 2. 세그웨이
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, "NewsDetail" == id {
            if let controller = segue.destination as? NewsDetailController {
                
                if let news = NewsData {
                    if let indexPath = TableViewMain.indexPathForSelectedRow {
                        let row = news[indexPath.row]
                        if let r = row as? Dictionary<String, Any> {
                        
                            if let imageUrl = r["urlToImage"]  as? String {
                                controller.imageUrl = imageUrl
                            }
                            if let desc = r["description"]  as? String {
                                controller.desc = desc
                            }
                        }
                    }

                }
                
            }
        }
    }
        
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        getNews()
    }
    
    //Table View Practice


}

