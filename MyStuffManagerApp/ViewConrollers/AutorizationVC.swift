//
//  ViewController.swift
//  MyStuffManagerApp
//
//  Created by DiuminPM on 14.03.2021.
//

import UIKit
import SnapKit

class AutorizationVC: UIViewController, UITextFieldDelegate {
    
    let nameTF = UITextField()
    let passwordTF = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        nameTF.delegate = self
    }

    private func initialize() {
        view.backgroundColor = UIColor(red: 203/255, green: 203/255, blue: 203/255, alpha: 1)
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
        passwordTF.placeholder = "Enter your password"
        passwordTF.isSecureTextEntry = true
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
        let buttonRegistered = UIButton(type: .system)
        buttonRegistered.setTitleColor(.white, for: .normal)
        buttonRegistered.setTitle("Registered", for: .normal)
        buttonRegistered.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonRegistered.backgroundColor = .systemBlue
        buttonRegistered.layer.cornerRadius = 10
        view.addSubview(buttonRegistered)
        buttonRegistered.snp.makeConstraints { maker in
            maker.top.equalTo(buttonLogIn.snp.bottom).offset(10)
            maker.left.right.equalToSuperview().inset(16)
        }
        let notExistLabel = UILabel()
        notExistLabel.text = "User does not exist"
        notExistLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        notExistLabel.isHidden = true
        view.addSubview(notExistLabel)
        notExistLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(buttonRegistered.snp.bottom).offset(15)
        }
    }
    
    @objc private func buttonPressed() {
        
        let selectionCityVC = SelectionViewController()
        selectionCityVC.modalPresentationStyle = .fullScreen
        present(selectionCityVC, animated: false)
        
//        navigationController?.pushViewController(selectionCityVC, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    

}
// расширение для отступа использовать: textField.indent(size: 10)
extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}

