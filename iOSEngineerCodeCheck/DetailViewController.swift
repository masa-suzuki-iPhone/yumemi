//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var wachersLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var issuesLabel: UILabel!
    
    var searchViewController: SearchViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let repo = searchViewController.repogitories[searchViewController.idx]
        
        languageLabel.text = "Written in \(repo["language"] as? String ?? "")"
        starsLabel.text = "\(repo["stargazers_count"] as? Int ?? 0) stars"
        wachersLabel.text = "\(repo["wachers_count"] as? Int ?? 0) watchers"
        forksLabel.text = "\(repo["forks_count"] as? Int ?? 0) forks"
        issuesLabel.text = "\(repo["open_issues_count"] as? Int ?? 0) open issues"
        getImage()
        
    }
    
    func getImage(){
        
        let repo = searchViewController.repogitories[searchViewController.idx]
        
        titleLable.text = repo["full_name"] as? String
        
        guard let owner = repo["owner"] as? [String: Any],
              let imgURL = owner["avatar_url"] as? String
        else{
            return
        }
        
        URLSession.shared.dataTask(with: URL(string: imgURL)!) { (data, res, err) in
            let img = UIImage(data: data!)!
            DispatchQueue.main.async {
                self.imageView.image = img
            }
        }.resume()
    }
}




