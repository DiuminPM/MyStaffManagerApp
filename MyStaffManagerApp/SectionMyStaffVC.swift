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
        return staffs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIndentyfire, for: indexPath)
        let city = staffs[indexPath.row]
        cell.textLabel?.text = city
    
        return cell
    }
    
    

   
}


