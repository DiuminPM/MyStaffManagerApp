//
//  AddNewStaffVC.swift
//  MyStaffManagerApp
//
//  Created by DiuminPM on 15.03.2021.
//

import UIKit

class AddNewStaffVC: UITableViewController {
    
    var staffs = ["Name stuff", "Price", "Serial number", "Location"]
    var cellIndentyfire = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        createdTableView()
            
        }
    
    func createdTableView() {
        self.tableView.register(CustomAddStaffTableViewCell.self, forCellReuseIdentifier: CustomAddStaffTableViewCell.indentifire)
       
    }

    
    private func setupNavigationBar() {
        self.navigationItem.title = "Add staff"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(canceled)
        )
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(addNewStaff)
        )
        
        
    }
    
    @objc func canceled() {
        navigationController?.popViewController(animated: true)
     
    }
    
    @objc func addNewStaff() {
        let mainVC = AutorizationVC()
        mainVC.modalPresentationStyle = .fullScreen
        mainVC.modalTransitionStyle = .flipHorizontal
        present(mainVC, animated: true)
    }
    // MARK: - Table view Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return staffs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: CustomAddStaffTableViewCell.indentifire, for: indexPath) as? CustomAddStaffTableViewCell else {
            return UITableViewCell()
        }
        let staff = staffs[indexPath.row]
        cell.specLabel.text = staff
    
        return cell
    }
    
    // MARK: - Table view Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    

   
}
