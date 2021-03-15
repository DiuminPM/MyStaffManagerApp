//
//  AllMyStaffVC.swift
//  MyStaffManagerApp
//
//  Created by DiuminPM on 14.03.2021.
//

import UIKit

class AllMyStaffVC: UITableViewController {
    
    var staffs = [""]
    var cellIndentyfire = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        createdTableView()
            
        }
    
    func createdTableView() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIndentyfire)
       
    }

    
    private func setupNavigationBar() {
        self.navigationItem.title = "My staff"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(canceled)
        )
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewStaff)
        )
        
        
    }
    
    @objc func canceled() {
        let mainVC = AutorizationVC()
        mainVC.modalPresentationStyle = .fullScreen
        mainVC.modalTransitionStyle = .flipHorizontal
        present(mainVC, animated: true)
    }
    
    @objc func addNewStaff() {
        let addVC = AddNewStaffVC()
        navigationController?.pushViewController(addVC, animated: true)
    }
    // MARK: - Table view Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return staffs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIndentyfire, for: indexPath)
        let staff = staffs[indexPath.row]
        cell.textLabel?.text = staff
    
        return cell
    }
    
    // MARK: - Table view Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    

   
}


