//
//  AddNewStaffVC.swift
//  MyStaffManagerApp
//
//  Created by DiuminPM on 15.03.2021.
//

import UIKit
import SnapKit

class AddNewStaffVC: UIViewController {
    
    let nameTextField = UITextField()
    let priceTextField = UITextField()
    let serialNumberTextField = UITextField()
    let locationTextField = UITextField()
    var newImageButton = UIButton(type: .system)
    let scrollView = UIScrollView()
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        initialize()
//        keybordWillUP(upSise: -220)

        self.navigationItem.rightBarButtonItem?.isEnabled = false
        nameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        
//        NotificationCenter.default.addObserver(self, selector: #selector(textFieldTextDidChange), name: UITextField.textDidChangeNotification, object: nil)
        }
    
    private func initialize() {
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        newImageButton.setImage(#imageLiteral(resourceName: "Photo"), for: .normal)
        newImageButton.addTarget(self, action: #selector(addPhoto), for: .touchUpInside)
        view.addSubview(newImageButton)
        newImageButton.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(116)
            maker.centerX.equalToSuperview().offset(10)
        }
        let nameLabel = UILabel()
        nameLabel.text = "Name:"
        nameLabel.font = .systemFont(ofSize: 20)
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(20)
            maker.top.equalTo(newImageButton.snp.bottom).offset(16)
        }
        nameTextField.placeholder = "enter name"
        nameTextField.backgroundColor = .white
        nameTextField.layer.cornerRadius = 10
        nameTextField.layer.borderColor = UIColor.black.cgColor
        nameTextField.layer.borderWidth = 1
        nameTextField.delegate = self
        nameTextField.indent(size: 10)
        view.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { maker in
            maker.top.equalTo(nameLabel.snp.bottom).offset(8)
            maker.left.right.equalToSuperview().inset(16)
            maker.height.equalTo(30)
        }
        let locationLabel = UILabel()
        locationLabel.text = "Location stuff:"
        locationLabel.font = .systemFont(ofSize: 20)
        view.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(20)
            maker.top.equalTo(nameTextField.snp.bottom).offset(10)
        }
        locationTextField.placeholder = "enter location stuff"
        locationTextField.backgroundColor = .white
        locationTextField.layer.cornerRadius = 10
        locationTextField.layer.borderColor = UIColor.black.cgColor
        locationTextField.layer.borderWidth = 1
        locationTextField.delegate = self
        locationTextField.indent(size: 10)
        view.addSubview(locationTextField)
        locationTextField.snp.makeConstraints { maker in
            maker.top.equalTo(locationLabel.snp.bottom).offset(8)
            maker.left.right.equalToSuperview().inset(16)
            maker.height.equalTo(30)
        }
        let serialNumberLabel = UILabel()
        serialNumberLabel.text = "Serial number:"
        serialNumberLabel.font = .systemFont(ofSize: 20)
        view.addSubview(serialNumberLabel)
        serialNumberLabel.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(20)
            maker.top.equalTo(locationTextField.snp.bottom).offset(10)
        }
        serialNumberTextField.placeholder = "enter serial number stuff"
        serialNumberTextField.backgroundColor = .white
        serialNumberTextField.layer.cornerRadius = 10
        serialNumberTextField.layer.borderColor = UIColor.black.cgColor
        serialNumberTextField.layer.borderWidth = 1
        serialNumberTextField.delegate = self
        serialNumberTextField.indent(size: 10)
        view.addSubview(serialNumberTextField)
        serialNumberTextField.snp.makeConstraints { maker in
            maker.top.equalTo(serialNumberLabel.snp.bottom).offset(8)
            maker.left.right.equalToSuperview().inset(16)
            maker.height.equalTo(30)
        }
        let priceLabel = UILabel()
        priceLabel.text = "Price stuff:"
        priceLabel.font = .systemFont(ofSize: 20)
        view.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(20)
            maker.top.equalTo(serialNumberTextField.snp.bottom).offset(10)
        }
        priceTextField.placeholder = "enter price stuff"
        priceTextField.backgroundColor = .white
        priceTextField.layer.cornerRadius = 10
        priceTextField.layer.borderColor = UIColor.black.cgColor
        priceTextField.layer.borderWidth = 1
        priceTextField.delegate = self
        priceTextField.indent(size: 10)
        view.addSubview(priceTextField)
        priceTextField.snp.makeConstraints { maker in
            maker.top.equalTo(priceLabel.snp.bottom).offset(8)
            maker.left.right.equalToSuperview().inset(16)
            maker.height.equalTo(30)
        }
    }
    
//MARK: Work with NavigationBar
    private func setupNavigationBar() {
        self.navigationItem.title = "Add staff"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(canceled)
        )
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(addNewStaff)
        )
        
        
    }
    private func saveNewStaff() {
        
    }
    
    @objc func canceled() {
        dismiss(animated: true)
     
    }
    
    @objc func addNewStaff() {
        let mainVC = AutorizationVC()
        mainVC.modalPresentationStyle = .fullScreen
        mainVC.modalTransitionStyle = .flipHorizontal
        present(mainVC, animated: true)
    }
    
//MARK: Add Photo: Camera or Gallery
    @objc func addPhoto() {
        let cameraIcon = #imageLiteral(resourceName: "camera")
        let photoIcon = #imageLiteral(resourceName: "photo")
        
        let actionSheet = UIAlertController(title: nil,
                                            message: nil,
                                            preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            self.chooseImagePicker(source: .camera)
        }
        
        camera.setValue(cameraIcon, forKey: "image")
        camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        
        let photo = UIAlertAction(title: "Photo", style: .default) { _ in
            self.chooseImagePicker(source: .photoLibrary)
        }
        
        photo.setValue(photoIcon, forKey: "image")
        photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        actionSheet.addAction(camera)
        actionSheet.addAction(photo)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true)
        } 
}

//MARK: Extension UITextField
extension AddNewStaffVC: UITextFieldDelegate {
    
    // Скрываем клавиатуру по нажатию на Done
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == priceTextField {
        self.view.frame.origin.y = -100
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.view.frame.origin.y = 0
        return true
    }
//    @objc func textFieldTextDidChange() {
//        self.navigationItem.rightBarButtonItem?.isEnabled = true
//    }
    @objc private func textFieldChanged() {

        if nameTextField.text!.isEmpty == false {
            self.navigationItem.rightBarButtonItem!.isEnabled = true
            
        } else {
            self.navigationItem.rightBarButtonItem!.isEnabled = false
        }
    }
//    func keybordWillUP(upSise: CGFloat) {
//        NotificationCenter.default.addObserver(forName: UITextField.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
//            self.view.frame.origin.y = upSise
//        }
//        NotificationCenter.default.addObserver(forName: UITextField.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
//            self.view.frame.origin.y = 0
//        }
//    }
    
}

//MARK: Work with image
extension AddNewStaffVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
}


