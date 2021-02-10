//
//  ViewController.swift
//  TodoTask
//
//  Created by Ridoan Wibisono on 09/02/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MainContainerView: UIView!
    
    var container : ContainerViewController!
    var screenNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        if screenNum == 0 {
            container.segueIdentifierReceivedFromParent("TaskView")
        }else{
            container.segueIdentifierReceivedFromParent("SettingView")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainContainer" {
            self.container = segue.destination as? ContainerViewController
            
        }
    }
    @IBAction func btn_task(_ sender: Any) {
        container.segueIdentifierReceivedFromParent("TaskView")
        screenNum = 0
    }
    @IBAction func btn_setting(_ sender: Any) {
        container.segueIdentifierReceivedFromParent("SettingView")
        screenNum = 0
    }
    
}

