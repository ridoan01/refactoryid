//
//  TasksViewController.swift
//  TodoTask
//
//  Created by Ridoan Wibisono on 10/02/21.
//

import UIKit

struct dateTask {
    var avail_task : Bool = false
    let day : String
    let date : String
}

struct Tasks {
    let start_date : String
    let end_date : String
    let isComplete : Bool
    let task_name : String
}

class TasksViewController: UIViewController {
    
    @IBOutlet weak var im_profile: UIImageView!
    @IBOutlet weak var lbl_task_greet: UILabel!
    @IBOutlet weak var tbl_task: UITableView!
    @IBOutlet weak var lbl_today: UILabel!
    
    var dtask : [dateTask] = []
    var task_list : [Tasks] = []
    
    let formatter = DateFormatter()
    var today_task = "0"
    
    var curr_task : [Tasks]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initView()
        getTask()
    }
    
    func initView() {
        //        im_profile.layer.cornerRadius = im_profile.frame.height/2
        //        im_profile.clipsToBounds = true
        tbl_task.delegate = self
        tbl_task.dataSource = self
        tbl_task.rowHeight = UITableView.automaticDimension
        tbl_task.estimatedRowHeight = 600.0
        
    }
    
    func getTask(){
        task_list.append(Tasks(start_date: "08022021 10:00", end_date: "08022021 10:30", isComplete: false, task_name: "Doing something"))
        task_list.append(Tasks(start_date: "10022021 08:00", end_date: "10022021 10:00", isComplete: false, task_name: "Doing something 1"))
        task_list.append(Tasks(start_date: "12022021 10:00", end_date: "12022021 11:00", isComplete: false, task_name: "Doing something 2"))
        task_list.append(Tasks(start_date: "07022021 11:00", end_date: "07022021 12:00", isComplete: false, task_name: "Doing something 3"))
        task_list.append(Tasks(start_date: "07022021 13:00", end_date: "07022021 14:00", isComplete: true, task_name: "Doing something 4"))
        getCalendar()
    }
    
    
    
    func getCalendar() {
        
        formatter.dateFormat = "E, d MMM yyyy "
        let now = Date()
        let dateString = formatter.string(from:now)
        
        
        var components = Calendar.current.dateComponents([.year, .month], from: now)
        components.month = (components.month ?? 0) + 1
        components.hour = (components.hour ?? 0) - 1
        let endOfMonth = Calendar.current.date(from: components)!
        formatter.dateFormat = "dMMyyyy"
        let last = formatter.string(from: endOfMonth)
        
        lbl_today.text = dateString
        
        let ls = Int(last.prefix(2))
        let lr = String(last.suffix(6))
        
        for i in 1...ls!{
            var str = String(i)+lr
            if i<10 {
                str = "0"+str
            }
            
            formatter.dateFormat = "ddMMyyyy"
            let nDate = formatter.date(from: str)
            formatter.dateFormat = "Edd"
            let day = formatter.string(from: nDate!)
            
            
            var avail = false
            for x in task_list{
                let sd = x.start_date.prefix(8)
                if(sd == str){
                    avail = true
                }            }
            
            dtask.append(dateTask(avail_task: avail,day: String(day.prefix(1)), date: String(i)))
        }
        
        
    }
    
}

extension TasksViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dtask.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dateCell", for: indexPath as IndexPath) as! DateCollectionViewCell
        let t = self.dtask[indexPath.row].avail_task
        if t == true {
            cell.im_active.alpha = 1
        }else{
            cell.im_active.alpha = 0
        }
        
        formatter.dateFormat = "d"
        let cdate = Date()
        let now = formatter.string(from:cdate)
        let curr_date = Int(now)
        
        
        cell.lbl_day.text = self.dtask[indexPath.row].day
        cell.lbl_date.text = self.dtask[indexPath.row].date
        
        cell.backgroundColor = UIColor.init(red: 240/255, green: 243/255, blue: 248/255, alpha: 1)
        cell.layer.cornerRadius = 12
        
        if indexPath.row == (curr_date! - 1) {
            
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
            cell.isSelected = true
            cell.backgroundColor = UIColor.init(red: 4/255, green: 66/255, blue: 208/255, alpha: 1)
            
            if t == true {
                curr_task.removeAll()
                var c_date = String(curr_date!)
                if curr_date! < 10 {
                    c_date = "0"+c_date
                }
                
                for i in task_list {
                    let dd = i.start_date.prefix(2)
                    if dd == c_date {
                        curr_task.append(Tasks(start_date: i.start_date, end_date: i.end_date, isComplete: i.isComplete, task_name: i.task_name))
                    }
                }
                
                if(curr_task.count > 1){
                    lbl_task_greet.text = String(curr_task.count) + " Tasks for Today"
                }else{
                    lbl_task_greet.text = String(curr_task.count) + " Task for Today"
                }
                
                
                
                tbl_task.reloadData()
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor =  UIColor.init(red: 4/255, green: 66/255, blue: 208/255, alpha: 1)
        cell?.isSelected = true
        
        curr_task.removeAll()
        let curr_date = indexPath.row + 1
        var c_date = String(curr_date)
        if curr_date < 10 {
            c_date = "0"+c_date
        }
        for i in task_list {
            let dd = i.start_date.prefix(2)
            if dd == c_date {
                curr_task.append(Tasks(start_date: i.start_date, end_date: i.end_date, isComplete: i.isComplete, task_name: i.task_name))
            }
        }
        tbl_task.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.init(red: 240/255, green: 243/255, blue: 248/255, alpha: 1)
        cell?.isSelected = false
        
    }
}


extension TasksViewController : UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return curr_task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hourCell", for: indexPath as IndexPath) as! HourTableViewCell
        
        let tbl_Item = Tasks(
            start_date: String(curr_task[indexPath.row].start_date.suffix(5)),
            end_date: String(curr_task[indexPath.row].end_date.suffix(5)),
            isComplete: curr_task[indexPath.row].isComplete,
            task_name: curr_task[indexPath.row].task_name)
        
        cell.tItem = tbl_Item
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell!.selectionStyle = .none
    }
    
    
}


class HourTableViewCell: UITableViewCell {
    @IBOutlet weak var lbl_hour : UILabel!
    @IBOutlet weak var lbl_task_name: UILabel!
    @IBOutlet weak var lbl_task_time: UILabel!
    @IBOutlet weak var btn_complete: UIButton!
    @IBOutlet weak var vw_backgroud: UIView!
    @IBOutlet weak var im_elips: UIImageView!
    
    var tItem : Tasks! {
        didSet{
            lbl_hour.text = tItem.start_date
            lbl_task_name.text = tItem.task_name
            lbl_task_time.text = tItem.start_date.suffix(5) + " - " + tItem.end_date.suffix(5)
            if tItem.isComplete == true {
                btn_complete.isEnabled = false
                btn_complete.backgroundColor = UIColor.init(red: 240/255, green: 243/255, blue: 248/255, alpha: 1)
                btn_complete.tintColor = UIColor.gray
                btn_complete.setTitleColor(UIColor.gray, for: .normal)
                btn_complete.alpha = 0.5
                
                vw_backgroud.backgroundColor = UIColor.init(red: 255/255, green: 242/255, blue: 230/255, alpha: 1)
                
                lbl_task_name.textColor = UIColor.init(red: 253/255, green: 145/255, blue: 53/255, alpha: 1)
                lbl_task_time.textColor = UIColor.init(red: 253/255, green: 145/255, blue: 53/255, alpha: 1)
                im_elips.tintColor = UIColor.init(red: 253/255, green: 145/255, blue: 53/255, alpha: 1)
                
            }else{
                btn_complete.isEnabled = true
            }
            
        }
    }
    
    
}
