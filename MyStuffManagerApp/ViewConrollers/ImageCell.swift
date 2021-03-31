//
//  imageCell.swift
//  MyStaffManagerApp
//
//  Created by DiuminPM on 15.03.2021.
//

import UIKit
import SnapKit

class ImageCell: UITableViewCell {
    
    var addImage = UIImageView()
    
    static let indentifire = "ImageCell"
    
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
        addImage.image = nil
    }
    
    
    private func initialize() {
        
        contentView.addSubview(addImage)
        addImage.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
        }
        
        
    }
    
}

