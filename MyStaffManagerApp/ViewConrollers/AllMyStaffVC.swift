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
        self.tableView.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIndentyfire)
        self.tableView.register(StaffTableViewCell.self, forCellReuseIdentifier: StaffTableViewCell.indentifire)
       
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
        let addVC = UINavigationController(rootViewController: AddNewStaffVC())
        addVC.modalPresentationStyle = .fullScreen
        navigationController?.present(addVC, animated: true)
//        navigationController?.pushViewController(addVC, animated: true)
    }
    // MARK: - Table view Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: StaffTableViewCell.indentifire, for: indexPath) as? StaffTableViewCell else {
            return UITableViewCell()
        }
        
    
        return cell
    }
    
    // MARK: - Table view Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    

   
}



