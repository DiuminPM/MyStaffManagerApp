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
        switch indexPath.row {
        case 0:
            cell.titleNameCategory.text = "Используется"
            cell.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        case 1:
            cell.titleNameCategory.text = "Мои вещи"
            cell.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        case 2:
            cell.titleNameCategory.text = "Лежат на полке"
            cell.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        case 3:
            cell.titleNameCategory.text = "Чужие вещи"
            cell.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        case 4:
            cell.titleNameCategory.text = "Отдал поюзать"
            cell.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        case 5:
            cell.titleNameCategory.text = "Хочу купить"
            cell.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        case 6:
            cell.titleNameCategory.text = "Продаю"
            cell.backgroundColor = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
        case 7:
            cell.titleNameCategory.text = "В ремонте"
            cell.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        case 8:
            cell.titleNameCategory.text = "Мои бывшии"
            cell.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        default:
            break
        }
        return cell
    }
    
    // MARK: - Table view Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    

   
}



