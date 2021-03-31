//
//  NamesStaffTableViewCell.swift
//  MyStaffManagerApp
//
//  Created by DiuminPM on 18.03.2021.
//

import UIKit

class NamesStaffTableViewCell: UITableViewCell {
    @IBOutlet var nameStaff: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameStaff.placeholder = "Enter spec"
        nameStaff.backgroundColor = .white
        nameStaff.layer.cornerRadius = 10
        nameStaff.layer.borderColor = UIColor.black.cgColor
        nameStaff.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
