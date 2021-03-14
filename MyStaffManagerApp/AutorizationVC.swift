//
//  ViewController.swift
//  MyStaffManagerApp
//
//  Created by DiuminPM on 14.03.2021.
//

import UIKit
import SnapKit

class AutorizationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        
    }

    private func initialize() {
        view.backgroundColor = UIColor(red: 203/255, green: 203/255, blue: 203/255, alpha: 1)
//        let labelName = UILabel()
//        labelName.text = "Name"
//        labelName.font = UIFont.systemFont(ofSize: 24)
//        view.addSubview(labelName)
//        labelName.snp.makeConstraints { maker in
//            maker.centerX.equalToSuperview()
//            maker.top.equalToSuperview().inset(400)
//
//        }
        let nameTF = UITextField()
        nameTF.placeholder = "Enter your name"
        nameTF.backgroundColor = .white
        nameTF.layer.cornerRadius = 10
        nameTF.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        nameTF.layer.borderColor = UIColor.black.cgColor
        nameTF.layer.borderWidth = 1
        nameTF.indent(size: 10)
        view.addSubview(nameTF)
        nameTF.snp.makeConstraints { maker in
            maker.centerX.centerY.equalToSuperview()
            maker.left.right.equalToSuperview().inset(16)
            maker.height.equalTo(40)
        }
//        let labelPassword = UILabel()
//        labelPassword.text = "Password"
//        labelPassword.font = UIFont.systemFont(ofSize: 24)
//        view.addSubview(labelPassword)
//        labelPassword.snp.makeConstraints { maker in
//            maker.centerX.equalToSuperview()
//            maker.top.equalTo(nameTF).inset(40)
//
//        }
        let passwordTF = UITextField()
        passwordTF.placeholder = "Enter your password"
        passwordTF.backgroundColor = .white
        passwordTF.layer.cornerRadius = 10
        passwordTF.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        passwordTF.layer.borderColor = UIColor.black.cgColor
        passwordTF.layer.borderWidth = 1
        passwordTF.indent(size: 10)
        view.addSubview(passwordTF)
        passwordTF.snp.makeConstraints { maker in
            maker.top.equalTo(nameTF).inset(39)
            maker.centerX.equalToSuperview()
            maker.left.right.equalToSuperview().inset(16)
            maker.height.equalTo(40)
        }
        let buttonLogIn = UIButton(type: .system)
        buttonLogIn.setTitleColor(.white, for: .normal)
        buttonLogIn.setTitle("Log in", for: .normal)
        buttonLogIn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonLogIn.backgroundColor = .systemBlue
        buttonLogIn.layer.cornerRadius = 10
        view.addSubview(buttonLogIn)
        buttonLogIn.snp.makeConstraints { maker in
            maker.top.equalTo(passwordTF).inset(60)
            maker.left.right.equalToSuperview().inset(16)
            
        }
    }
    
    @objc private func buttonPressed() {
        let selectionCityVC = SelectionViewController()
        selectionCityVC.modalPresentationStyle = .fullScreen
        present(selectionCityVC, animated: false)
//        navigationController?.pushViewController(selectionCityVC, animated: true)
    }
    

}
// расширение для отступа использовать: textField.indent(size: 10)
extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}
