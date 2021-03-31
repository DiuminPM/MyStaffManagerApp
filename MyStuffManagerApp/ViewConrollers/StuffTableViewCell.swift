//
//  stuffTableViewCell.swift
//  MyStuffManagerApp
//
//  Created by DiuminPM on 17.03.2021.
//

import UIKit
import SnapKit

class StuffTableViewCell: UITableViewCell {
    
    var logoStuff = UIImageView()
    var titleName = UILabel()
    static let indentifire = "StuffTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        
        contentView.addSubview(logoStuff)
        logoStuff.layer.cornerRadius = 10
        logoStuff.layer.borderWidth = 2
        logoStuff.clipsToBounds = true
        logoStuff.snp.makeConstraints { maker in
            maker.top.left.bottom.equalToSuperview().inset(5)
            maker.width.equalTo(100)
        }
        contentView.addSubview(titleName)
        titleName.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(116)
            maker.right.equalToSuperview().inset(16)
        }
    }
}
