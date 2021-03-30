//
//  SectionMyStaffVC.swift
//  MyStaffManagerApp
//
//  Created by DiuminPM on 14.03.2021.
//


import UIKit

class SectionMyStaffVC: UITableViewController {
    
    var staffs = [""]
    var cellIndentyfire = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        createdTableView()
        }
    
    func createdTableView() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIndentyfire)
        self.tableView.register(CategoryStaffCustomCell.self, forCellReuseIdentifier: CategoryStaffCustomCell.indentifire)
    }

    private func setupNavigationBar() {
        self.navigationItem.title = "Category Stuff"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(canceled)
        )
        
        
    }
    
    @objc func canceled() {
        let mainVC = AutorizationVC()
        mainVC.modalPresentationStyle = .fullScreen
        mainVC.modalTransitionStyle = .flipHorizontal
        present(mainVC, animated: true)
    }
    
    // MARK: - Table view Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: CategoryStaffCustomCell.indentifire, for: indexPath) as! CategoryStaffCustomCell
        cell.titleNameCategory.text = "Используется"
        
        
    
        return cell
    }
    
    // MARK: - Table view Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    

   
}


