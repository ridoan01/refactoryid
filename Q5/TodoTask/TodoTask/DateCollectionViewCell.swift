//
//  DateCollectionViewCell.swift
//  TodoTask
//
//  Created by Ridoan Wibisono on 10/02/21.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var im_active : UIImageView!
    @IBOutlet weak var lbl_day: UILabel!
    @IBOutlet weak var lbl_date: UILabel!
    
    override var isSelected : Bool {
        didSet{
            if (isSelected == true) {
                lbl_day.textColor = UIColor.white
                lbl_date.textColor = UIColor.white
            }else{
                lbl_day.textColor = UIColor.gray
                lbl_date.textColor = UIColor.gray
            }
            
            
        }
        
    }
}
