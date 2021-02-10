//
//  ViewController.swift
//  Inventory
//
//  Created by Ridoan Wibisono on 09/02/21.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    var item_in_room = Array<String>()
    var electronic_devices = Array<String>()
    var furniture = Array<String>()
    var item_brown_color = Array<String>()
    var item_purchased_on = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        inventoryData()
        
        //      Mark:  uncomment below to see print the result
        
                itemInRoom()
//                electronicDevice()
//                findFurniture()
//                brownItem()
//                purchaseOn()
    }
    
    
    func itemInRoom() {
        print("1. items in the Meeting Room")
        if !item_in_room.isEmpty {
            print(item_in_room)
        }else{
            print("not found")
        }
    }
    func electronicDevice() {
        print("2. all electronic devices")
        if !electronic_devices.isEmpty {
            print(electronic_devices)
        }else{
            print("not found")
        }
    }
    func findFurniture() {
        print("3. all the furniture")
        if !furniture.isEmpty {
            print(furniture)
        }else{
            print("not found")
        }
    }
    func brownItem() {
        print("4. all items were purchased on 16 Januari 2020")
        if !item_purchased_on.isEmpty {
            print(item_purchased_on)
        }else{
            print("not found")
        }
    }
    func purchaseOn() {
        print("5. all items with brown color")
        if !item_brown_color.isEmpty {
            print(item_brown_color)
        }else{
            print("not found")
        }
    }
    
    
    func inventoryData(){
        
        let path = Bundle.main.path(forResource: "inventory_list", ofType: "json")
        let jsonString = try? String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        if let dataFromString = jsonString!.data(using: .utf8, allowLossyConversion: false) {
            let json = try! JSON(data: dataFromString)
            
            for (_,subJson):(String, JSON) in json {
                
                let search_key = "Meeting Room".lowercased()
                if(subJson["placement"]["name"].stringValue.lowercased().contains(search_key) == true){
                    item_in_room.append(subJson["name"].stringValue)
                }
                
                let search_key_1 = "electronic".lowercased()
                if (subJson["type"].stringValue.lowercased().contains(search_key_1) == true) {
                    electronic_devices.append(subJson["name"].stringValue)
                }
                
                let search_key_2 = "furniture".lowercased()
                if (subJson["type"].stringValue.lowercased().contains(search_key_2) == true) {
                    furniture.append(subJson["name"].stringValue)
                }
                
                let search_key_3 = "brown".lowercased()
                for (_, s) in subJson["tags"] {
                    if (s.stringValue.lowercased().contains(search_key_3) == true) {
                        item_brown_color.append(subJson["name"].stringValue)
                    }
                }
                
                let dateFormatter = DateFormatter()
                let purchase_date = "16-01-2020"
                
                
                dateFormatter.dateFormat = "DD-MM-yyyy"
                let pDate = dateFormatter.date(from: purchase_date)
                dateFormatter.dateFormat = "DD-MM-yyyy"
                let cDate = dateFormatter.string(from: pDate!)
                
                
                let timeResult = (subJson["purchased_at"].double)
                let date = Date(timeIntervalSince1970: timeResult!)
                dateFormatter.dateFormat = "DD-MM-yyyy"
                let purchased_at = dateFormatter.string(from: date)
                
                
                if (purchased_at == cDate) {
                    item_purchased_on.append(subJson["name"].stringValue)
                }
                
            }
            
        }
        
    }


}

