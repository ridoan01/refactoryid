//
//  CustomTabBarViewController.swift
//  TodoTask
//
//  Created by Ridoan Wibisono on 10/02/21.
//

import UIKit

class CustomTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    var tasksViewController: TasksViewController!
    var centerViewController: AddTaskViewController!
    var settingViewController: SettingViewController!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        tasksViewController = TasksViewController()
        centerViewController = AddTaskViewController()
        settingViewController = SettingViewController()
        
        self.delegate = self
        
        tasksViewController.tabBarItem.image = UIImage(systemName: "rectangle.grid.1x2")
        tasksViewController.tabBarItem.selectedImage =
            UIImage(systemName: "rectangle.grid.1x2")
        
        centerViewController.tabBarItem.image = UIImage(systemName: "plus.app.fill")
        centerViewController.tabBarItem.selectedImage =
            UIImage(systemName: "plus.app.fill")
        
        settingViewController.tabBarItem.image = UIImage(systemName: "gearshape")
        settingViewController.tabBarItem.selectedImage =
            UIImage(systemName: "gearshape")
        
        viewControllers = [tasksViewController, centerViewController, settingViewController]
        
        for tabBarItem in tabBar.items! {
            tabBarItem.title = ""
            tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        
        func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            if viewController.isKind(of: AddTaskViewController.self) {
                let vc =  AddTaskViewController()
                vc.modalPresentationStyle = .currentContext
                self.present(vc, animated: true, completion: nil)
                return false
            }
            return true
        }
    }
    
    
    
    //    override func viewDidLoad() {
    //            super.viewDidLoad()
    //
    //            let controller1 = UIViewController()
    //            controller1.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
    //            let nav1 = UINavigationController(rootViewController: controller1)
    //
    //            let controller2 = UIViewController()
    //            controller2.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
    //            let nav2 = UINavigationController(rootViewController: controller2)
    //
    //            let controller3 = UIViewController()
    //            let nav3 = UINavigationController(rootViewController: controller3)
    //            nav3.title = ""
    //
    //            let controller4 = UIViewController()
    //            controller4.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 4)
    //            let nav4 = UINavigationController(rootViewController: controller4)
    //
    //            let controller5 = UIViewController()
    //            controller5.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 5)
    //            let nav5 = UINavigationController(rootViewController: controller5)
    //
    //
    //            viewControllers = [nav1, nav2, nav3, nav4, nav5]
    //            setupMiddleButton()
    //        }
    //
    //        // MARK: - Setups
    //
    //        func setupMiddleButton() {
    //            let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
    //
    //            var menuButtonFrame = menuButton.frame
    //            menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height
    //            menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
    //            menuButton.frame = menuButtonFrame
    //
    //            menuButton.backgroundColor = UIColor.red
    //            menuButton.layer.cornerRadius = menuButtonFrame.height/2
    //            view.addSubview(menuButton)
    //
    //            menuButton.setImage(UIImage(named: "example"), for: .normal)
    //            menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)
    //
    //            view.layoutIfNeeded()
    //        }
    //
    //
    //        // MARK: - Actions
    //
    //        @objc private func menuButtonAction(sender: UIButton) {
    //            selectedIndex = 2
    //        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 95
        tabBar.frame.origin.y = view.frame.height - 95
    }
    
    //    override func viewDidLoad() {
    //            super.viewDidLoad()
    //
    //            let controller1 = UIViewController()
    //            controller1.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
    //            let nav1 = UINavigationController(rootViewController: controller1)
    //
    ////            let controller2 = UIViewController()
    ////            controller2.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
    ////            let nav2 = UINavigationController(rootViewController: controller2)
    //
    //            let controller2 = AddTaskViewController()
    //            let nav2 = UINavigationController(rootViewController: controller2)
    //            nav2.title = ""
    //
    //            let controller3 = SettingViewController()
    //            controller3.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 3)
    //            let nav3 = UINavigationController(rootViewController: controller3)
    //
    ////            let controller5 = UIViewController()
    ////            controller5.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 5)
    ////            let nav5 = UINavigationController(rootViewController: controller5)
    //
    //            viewControllers = [nav1, nav2, nav3]
    //            setupMiddleButton()
    //        }
    //
    //        func setupMiddleButton() {
    //            let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 61, height: 55))
    //            var menuButtonFrame = menuButton.frame
    //            menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height - 50
    //            menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
    //            menuButton.frame = menuButtonFrame
    //
    ////            menuButton.backgroundColor = UIColor.red
    ////            menuButton.layer.cornerRadius = menuButtonFrame.height/2
    //            view.addSubview(menuButton)
    //
    ////            menuButton.setImage(UIImage(systemName: "plus.app.fill"), for: .normal)
    //
    //            menuButton.setBackgroundImage(UIImage(systemName: "plus.app.fill"), for: .normal)
    //            menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)
    //
    //            view.layoutIfNeeded()
    //        }
    //
    //
    //        // MARK: - Actions
    //
    //        @objc private func menuButtonAction(sender: UIButton) {
    //            selectedIndex = 2
    //        }
    
}
