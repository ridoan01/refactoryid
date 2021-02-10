//
//  ViewController.swift
//  Cashier
//
//  Created by Ridoan Wibisono on 09/02/21.
//

import UIKit

struct belanjaan {
    var item : String
    var harga : Int
}

class ViewController: UIViewController {

    var belanja: [belanjaan] = []
    var toko_name = ""
    var cashier_name = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        input()
    }
    
    func input() {
        toko_name = "     Warung Makan Sederhana"
        cashier_name = "Rudiawan"
        
//         Add multiple item
        addBelanja(item: "Nasi", hrg: 5000)
        addBelanja(item: "Lauk", hrg: 10000)
        addBelanja(item: "Minum", hrg: 5000)
        
//        print everything
        printReceipt()
    }
    
    
    func addBelanja(item: String, hrg: Int){
        belanja.append(belanjaan(item: item, harga: hrg))
    }
    
    func clearData(){
        toko_name = ""
        cashier_name = ""
        belanja.removeAll()
    }
    
    func printReceipt() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss "
        let now = Date()
        let dateString = formatter.string(from:now)
        
        let date = dateString
        
        var total = 0
        
        for i in belanja {
            total = i.harga + total
        }
        
        let h1 = toko_name
        let h2 = "Tanggal :          "+date
        let h3 = "Nama Kasir :            "+cashier_name
        let h4 = "================================"
        
        if h1.count > 30 {
            print(h1.prefix(30)+"\n")
            let res = h1.count - 30
            let sp = getSeparator(sp: (30-res), dot: false)
            print(sp+h1.suffix(res)+"\n")
            
        }else{
            print(h1+"\n")
        }
        
        if h2.count > 30 {
            print(h2.prefix(30)+"\n")
            let res = h2.count - 30
            let sp = getSeparator(sp: (30-res), dot: false)
            print(sp+h2.suffix(res)+"\n")
        }else{
            print(h2+"\n")
        }
        
        if h3.count > 30 {
            print(h3.prefix(30)+"\n")
            let res = h3.count - 30
            let sp = getSeparator(sp: (30-res), dot: false)
            print(sp+h3.suffix(res)+"\n")
        }else{
            print(h3+"\n")
        }
        
        if h4.count > 30 {
            print(h4.prefix(30)+"\n")
            let res = h4.count - 30
            let sp = getSeparator(sp: (30-res), dot: false)
            print(sp+h4.suffix(res)+"\n")
        }else{
            print(h4+"\n")
        }
        
        for i in belanja {
            let brg = i.item
            let str_harga = formatMoney(mon: i.harga)
            let hrg = "Rp" + str_harga
            let bh = brg+hrg
            if bh.count > 30 {
                let sp = getSeparator(sp: (60 - bh.count), dot: true)
                let nbh = brg+sp+hrg
                print(nbh.prefix(30)+"\n")
                print(nbh.suffix(30)+"\n")
            }else{
                let sp = getSeparator(sp: (30 - bh.count), dot: true)
                print(brg+sp+hrg+"\n")
            }
        }
        
        let htotal = "Total"
        let str_total = formatMoney(mon: total)
        let ht = htotal+"Rp"+str_total
        if ht.count > 30 {
            let sp = getSeparator(sp: (60 - ht.count), dot: true)
            let hts = htotal+sp + "Rp" + str_total
            print(hts.prefix(30)+"\n")
            print(hts.suffix(30)+"\n")
        }else{
            let sp = getSeparator(sp: (30 - ht.count), dot: true)
            print(htotal+sp + "Rp" + str_total)
        }
        
    }
    
    func getSeparator(sp: Int, dot:Bool) -> String {
        if dot == true {
            var dot = ""
            for _ in 1...sp {
                dot = dot + "."
            }
            return dot
        }else{
            var dot = ""
            for _ in 1...sp {
                dot = dot + " "
            }
            return dot
        }
        
    }
    
    func formatMoney(mon : Int) -> String {
        var str_money = String(mon)
        
        if mon > 999 && mon < 1000000 {
            let hc = str_money.count - 3
            let tail = str_money.suffix(3)
            str_money = str_money.prefix(hc) + "." + tail
        }
        
        return str_money
    }


}

