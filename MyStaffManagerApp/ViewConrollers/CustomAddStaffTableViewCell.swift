//
//  CustomAddStaffTableViewCell.swift
//  MyStaffManagerApp
//
//  Created by DiuminPM on 15.03.2021.
//

import UIKit
import SnapKit

class CustomAddStaffTableViewCell: UITableViewCell {
    
    let specLabel = UILabel()
    let specTF = UITextField()
    
    static let indentifire = "CustomAddStaffTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .gray
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        specLabel.text = nil
    }
    
    
    private func initialize() {
        
        contentView.addSubview(specLabel)
        specLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(10)
            maker.left.right.equalToSuperview().inset(16)
        }
        
        specTF.placeholder = "Enter spec"
        contentView.addSubview(specTF)
        specTF.snp.makeConstraints { maker in
            maker.top.equalTo(specLabel).inset(20)
            maker.left.right.equalToSuperview().inset(16)
        }
        
    }
    
}
