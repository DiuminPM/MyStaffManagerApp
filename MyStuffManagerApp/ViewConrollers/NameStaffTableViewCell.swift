//
//  CustomAddStaffTableViewCell.swift
//  MyStaffManagerApp
//
//  Created by DiuminPM on 15.03.2021.
//

import UIKit
import SnapKit

class NameStaffTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    var nameLabel = UILabel()
    var nameTF = UITextField()

    
    static let indentifire = "NameStaffTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .gray
        initialize()
//        nameTF.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        nameTF.delegate = self
//    }
    
    
    private func initialize() {
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(10)
            maker.left.right.equalToSuperview().inset(16)
        }
        
        nameTF.placeholder = "Enter spec"
        nameTF.backgroundColor = .white
        nameTF.layer.cornerRadius = 10
        nameTF.layer.borderColor = UIColor.black.cgColor
        nameTF.layer.borderWidth = 1
        nameTF.indent(size: 10)
        nameTF.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        contentView.addSubview(nameTF)
        nameTF.snp.makeConstraints { maker in
            maker.top.equalTo(nameLabel).inset(26)
            maker.left.right.equalToSuperview().inset(16)
            maker.height.equalTo(34)
        }
        
    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("fjgnfj")
//        AddNewStaffVC().navigationItem.rightBarButtonItem?.isEnabled = true
//    }
    
    
    
    @objc private func textFieldChanged() {

        if nameTF.text?.isEmpty == false {
            AddNewStaffVC().navigationItem.rightBarButtonItem?.isEnabled = true
            
        } else {
            AddNewStaffVC().navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    
}
