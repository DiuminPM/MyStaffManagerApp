//
//  CategoryStuffCustomCell.swift
//  MyStuffManagerApp
//
//  Created by DiuminPM on 30.03.2021.
//

import UIKit
import SnapKit

class CategoryStuffCustomCell: UITableViewCell {
    
    var titleNameCategory = UILabel()
    static let indentifire = "CategoryStuffCustomCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        titleNameCategory.textAlignment = .center
        titleNameCategory.font = .systemFont(ofSize: 26)
        contentView.addSubview(titleNameCategory)
        titleNameCategory.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
        }
        
    }
}

