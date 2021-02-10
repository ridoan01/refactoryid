//
//  ViewController.swift
//  Profile
//
//  Created by Ridoan Wibisono on 09/02/21.
//

import UIKit
import SwiftyJSON

struct user {
    let id : Int
    let username : String
    let full_name : String
    let birthday : String
    let phone : Array<String>
    
}

struct article {
    let id: Int
    let title: String
    let published_at: String
}

class ViewController: UIViewController {

    var user_no_phone : [user] = []
    var user_have_article : [user] = []
    var user_with_annis : [user] = []
    var user_with_article_at_year : [user] = []
    var user_born_at_year : [user] = []
    
    var article_contain_key : [article] = []
    var article_publish_before_year : [article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        profileData()
        
//      Mark:  uncomment below to see print the result
        
        userNoPhone()
//        userWithArticle()
//        findAnnis()
//        userWithArticleYear()
//        userBornOn()
//        articleTips()
//        articleBefore()
        
        
    }
    
    func userNoPhone() {
        print("1. users who don't have any phone numbers")
        if !user_no_phone.isEmpty {
            print(user_no_phone)
        }else{
            print("not found")
        }
        
    }
    func userWithArticle() {
        print("2. users who have articles")
        if !user_have_article.isEmpty {
            print(user_have_article)
        }else{
            print("not found")
        }
    }
    func findAnnis() {
        print("3. users who have \"annis\" on their name")
        if !user_with_annis.isEmpty {
            print(user_with_annis)
        }else{
            print("not found")
        }
    }
    func userWithArticleYear() {
        print("4. users who have articles on the year 2020")
        if !user_with_article_at_year.isEmpty {
            print(user_with_article_at_year)
        }else{
            print("not found")
        }
    }
    func userBornOn() {
        print("5. users who are born in 1986")
        if !user_born_at_year.isEmpty {
            print(user_born_at_year)
        }else{
            print("not found")
        }
    }
    func articleTips() {
        print("6. articles that contain \"tips\" on the title")
        if !article_contain_key.isEmpty {
            print(article_contain_key)
        }else{
            print("not found")
        }
    }
    func articleBefore() {
        print("7. articles published before August 2019")
        if !article_publish_before_year.isEmpty {
            print(article_publish_before_year)
        }else{
            print("not found")
        }
    }
    
    
    
    func profileData(){
        let path = Bundle.main.path(forResource: "profile_list", ofType: "json")
        let jsonString = try? String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        let dateFormatter = DateFormatter()
        
        
        
        
        if let dataFromString = jsonString!.data(using: .utf8, allowLossyConversion: false) {
            let json = try! JSON(data: dataFromString)
            
            for (_,subJson):(String, JSON) in json {
                
                var ph : Array<String> = []
                if(subJson["profile"]["phones"].isEmpty == false){
                    for (_,s):(String, JSON) in subJson["profile"]["phones"] {
                        ph.append(s.stringValue)
                    }
                }
                
                
                if(subJson["profile"]["phones"].isEmpty == true){
                    user_no_phone.append(user(id: subJson["id"].intValue,
                                              username: subJson["username"].stringValue,
                                              full_name: subJson["profile"]["full_name"].stringValue,
                                              birthday: subJson["profile"]["birthday"].stringValue,
                                              phone: ph))
                }
                
                if ((subJson["profile"]["full_name"].string?.lowercased().contains("annis")) == true) {
                    user_with_annis.append(user(id: subJson["id"].intValue,
                                                username: subJson["username"].stringValue,
                                                full_name: subJson["profile"]["full_name"].stringValue,
                                                birthday: subJson["profile"]["birthday"].stringValue,
                                                phone: ph))
                }
                
                
                if (subJson["articles:"].isEmpty == false){
                    user_have_article.append(user(id: subJson["id"].intValue,
                                                  username: subJson["username"].stringValue,
                                                  full_name: subJson["profile"]["full_name"].stringValue,
                                                  birthday: subJson["profile"]["birthday"].stringValue,
                                                  phone: ph))
                    
                    for (_,sj):(String, JSON) in subJson["articles:"] {
                        
                        
                        if sj["title"].string?.lowercased().contains("tips") == true {
                            article_contain_key.append(article(id: sj["id"].intValue, title: sj["title"].stringValue, published_at: sj["published_at"].stringValue))
                        }
                        
                        let publish_before = "08/2019"
                        dateFormatter.dateFormat = "MM/yyyy"
                        let pDate = dateFormatter.date(from: publish_before)
                        dateFormatter.dateFormat = "MM/yyyy"
                        let cDate = dateFormatter.string(from: pDate!)
                        
                        
                        let dateString = String(sj["published_at"].string!)
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                        let date = dateFormatter.date(from: dateString)
                        dateFormatter.dateFormat = "MM/yyyy"
                        let dataDate = dateFormatter.string(from: date!)
                        
                        if dataDate < cDate {
                            article_publish_before_year.append(article(id: sj["id"].intValue, title: sj["title"].stringValue, published_at: sj["published_at"].stringValue))
                        }
                        
                        
                        let year_article = 2020
                        let pub_article = Int((sj["published_at"].string?.prefix(4))!)
                        
                        if pub_article == year_article {
                            
                            user_with_article_at_year.append(user(id: subJson["id"].intValue,
                                                                  username: subJson["username"].stringValue,
                                                                  full_name: subJson["profile"]["full_name"].stringValue,
                                                                  birthday: subJson["profile"]["birthday"].stringValue,
                                                                  phone: ph))
                        }
                        
                        
                    }
                }
                
                
                let bd = Int((subJson["profile"]["birthday"].string?.prefix(4))!)
                if bd! == 1986 {
                    user_born_at_year.append(user(id: subJson["id"].intValue,
                                                  username: subJson["username"].stringValue,
                                                  full_name: subJson["profile"]["full_name"].stringValue,
                                                  birthday: subJson["profile"]["birthday"].stringValue,
                                                  phone: ph))
                }
            }
            
        }
        
    }


}

