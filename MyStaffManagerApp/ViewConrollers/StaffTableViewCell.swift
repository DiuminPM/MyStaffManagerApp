//
//  staffTableViewCell.swift
//  MyStaffManagerApp
//
//  Created by DiuminPM on 17.03.2021.
//

import UIKit
import SnapKit

class StaffTableViewCell: UITableViewCell {
    
    var logoStuff = UIImageView()
    var titleName = UILabel()
    static let indentifire = "StaffTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        
        contentView.addSubview(logoStuff)
        logoStuff.image = #imageLiteral(resourceName: "Image")
        logoStuff.snp.makeConstraints { maker in
            maker.top.left.bottom.equalToSuperview().inset(5)
            maker.width.equalTo(100)
            
        }
        titleName.text = "Staff"
        contentView.addSubview(titleName)
        titleName.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(116)
            maker.right.equalToSuperview().inset(16)
        }
        
    }
    
   

}
