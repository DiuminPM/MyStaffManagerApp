//
//  ViewController.swift
//  MyStuffManagerApp
//
//  Created by DiuminPM on 14.03.2021.
//

import UIKit
import SnapKit
import Firebase

class AutorizationVC: UIViewController {
    
    let emailTF = UITextField()
    let passwordTF = UITextField()
    let buttonLogIn = UIButton(type: .system)
    let buttonRegistered = UIButton(type: .system)
    let warningLabel = UILabel()



    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        buttonLogIn.isEnabled = false
        buttonRegistered.isEnabled = false
        warningLabel.alpha = 0
        
       
    }

    private func initialize() {
        Auth.auth().addStateDidChangeListener { [weak self](auth, user) in
            if user != nil {
                let selectionCityVC = SelectionViewController()
                selectionCityVC.modalPresentationStyle = .fullScreen
                self?.present(selectionCityVC, animated: false)
            }
        }
        view.backgroundColor = UIColor(red: 203/255, green: 203/255, blue: 203/255, alpha: 1)
        emailTF.placeholder = "Enter your email"
        emailTF.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        emailTF.delegate = self
        emailTF.backgroundColor = .white
        emailTF.layer.cornerRadius = 10
        emailTF.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        emailTF.layer.borderColor = UIColor.black.cgColor
        emailTF.layer.borderWidth = 1
        emailTF.indent(size: 10)
        view.addSubview(emailTF)
        emailTF.snp.makeConstraints { maker in
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
        passwordTF.delegate = self
        passwordTF.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        passwordTF.isSecureTextEntry = true
        passwordTF.backgroundColor = .white
        passwordTF.layer.cornerRadius = 10
        passwordTF.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        passwordTF.layer.borderColor = UIColor.black.cgColor
        passwordTF.layer.borderWidth = 1
        passwordTF.indent(size: 10)
        view.addSubview(passwordTF)
        passwordTF.snp.makeConstraints { maker in
            maker.top.equalTo(emailTF).inset(39)
            maker.centerX.equalToSuperview()
            maker.left.right.equalToSuperview().inset(16)
            maker.height.equalTo(40)
        }
        buttonLogIn.setTitleColor(.white, for: .normal)
        buttonLogIn.setTitle("Log in", for: .normal)
        buttonLogIn.addTarget(self, action: #selector(buttonPressedLogIn), for: .touchUpInside)
        buttonLogIn.backgroundColor = .systemBlue
        buttonLogIn.layer.cornerRadius = 10
        view.addSubview(buttonLogIn)
        buttonLogIn.snp.makeConstraints { maker in
            maker.top.equalTo(passwordTF).inset(60)
            maker.left.right.equalToSuperview().inset(16)
        }
        buttonRegistered.setTitleColor(.white, for: .normal)
        buttonRegistered.setTitle("Registered", for: .normal)
        buttonRegistered.addTarget(self, action: #selector(buttonPressedRegister), for: .touchUpInside)
        buttonRegistered.backgroundColor = .systemBlue
        buttonRegistered.layer.cornerRadius = 10
        view.addSubview(buttonRegistered)
        buttonRegistered.snp.makeConstraints { maker in
            maker.top.equalTo(buttonLogIn.snp.bottom).offset(10)
            maker.left.right.equalToSuperview().inset(16)
        }
        warningLabel.text = "User does not exist"
        warningLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        view.addSubview(warningLabel)
        warningLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(buttonRegistered.snp.bottom).offset(15)
        }
    }
    func displayWarningLable(withText text: String) {
        warningLabel.text = text
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            [weak self] in self?.warningLabel.alpha = 1
        }) { [weak self] complete in
            self?.warningLabel.alpha = 0
        }
        
    }
    
    @objc private func buttonPressedLogIn() {
        Auth.auth().signIn(withEmail: emailTF.text!, password: passwordTF.text!) { [weak self] (user, error) in
            if error != nil {
                self?.displayWarningLable(withText: "error ocured")
                return
            }
            if user != nil {
                let selectionCityVC = SelectionViewController()
                selectionCityVC.modalPresentationStyle = .fullScreen
                self?.present(selectionCityVC, animated: false)
            }
        }
    }
    
    
    @objc private func buttonPressedRegister() {
        
        Auth.auth().createUser(withEmail: emailTF.text!, password: passwordTF.text!) { [weak self] (user, error) in
            if error == nil {
                if user != nil {
                    let selectionCityVC = SelectionViewController()
                    selectionCityVC.modalPresentationStyle = .fullScreen
                    self?.present(selectionCityVC, animated: false)
                }
            }
        }
    }
    
}

//MARK: Extension UITextField
extension AutorizationVC: UITextFieldDelegate {
        // двигаем экран чтобы поля не закрывала клавиатура
    func textFieldDidBeginEditing(_ textField: UITextField) {
       
            self.view.frame.origin.y = -150
        }
        // Скрываем клавиатуру по нажатию на Done и сдвигаем обратно
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.view.frame.origin.y = 0
        return true
    }
        // активность кнопки "add(+)" в зависимости от наличии текста
    @objc private func textFieldChanged() {
        if emailTF.text!.isEmpty == false && passwordTF.text?.isEmpty == false {
            buttonLogIn.isEnabled = true
            buttonRegistered.isEnabled = true
        } else {
            buttonLogIn.isEnabled = false
            buttonRegistered.isEnabled = false
        }
    }
}
// расширение для отступа использовать: textField.indent(size: 10)
extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}

