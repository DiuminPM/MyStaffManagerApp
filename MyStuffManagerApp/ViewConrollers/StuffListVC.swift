//
//  StuffListVC.swift
//  MyStuffManagerApp
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

        let firstVC = UINavigationController(rootViewController: AllMyStuffVC())
        firstVC.tabBarItem.title = "AllMyStuff"
//        firstVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: .favorites, tag: 1)

        let secondVC = UINavigationController(rootViewController: SectionMyStuffVC())
        secondVC.tabBarItem.title = "Category Stuff"
//        secondVC.tabBarItem = UITabBarItem.init()

        viewControllers = [firstVC, secondVC]
    }

   
}

