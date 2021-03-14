//
//  StuffListVC.swift
//  MyStaffManagerApp
//
//  Created by DiuminPM on 14.03.2021.
//

import Foundation
import SnapKit

class SelectionViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        
       
    }
    
    private func setupTabBar() {

        let firstVC = UINavigationController(rootViewController: AllMyStaffVC())
        firstVC.tabBarItem.title = "AllMyStaff"
//        firstVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: .favorites, tag: 1)

        let secondVC = UINavigationController(rootViewController: SectionMyStaffVC())
        secondVC.tabBarItem.title = "Category Stuff"
//        secondVC.tabBarItem = UITabBarItem.init()

        viewControllers = [firstVC, secondVC]
    }

   
}

