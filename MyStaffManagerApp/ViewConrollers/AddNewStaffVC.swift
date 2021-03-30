//
//  AddNewStaffVC.swift
//  MyStaffManagerApp
//
//  Created by DiuminPM on 15.03.2021.
//

import UIKit
import SnapKit

class AddNewStaffVC: UIViewController {
    var imageIsChanged = false
    var nameTextField = UITextField()
    var priceTextField = UITextField()
    var serialNumberTextField = UITextField()
    var locationTextField = UITextField()
    var imageStuff = UIImageView()
    var newStuff: Stuff?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        initialize()
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        nameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        }
    
    private func initialize() {
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        imageStuff.image = #imageLiteral(resourceName: "Photo")
        imageStuff.contentMode = .scaleAspectFit
        let tap = UITapGestureRecognizer(target: self, action: #selector(addPhoto))
        imageStuff.addGestureRecognizer(tap)
        imageStuff.isUserInteractionEnabled = true
        view.addSubview(imageStuff)
        imageStuff.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(100)
            maker.centerX.equalToSuperview().offset(10)
            maker.height.equalTo(150)
        }
        let nameLabel = UILabel()
        nameLabel.text = "Name:"
        nameLabel.font = .systemFont(ofSize: 20)
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(20)
            maker.top.equalTo(imageStuff.snp.bottom).offset(16)
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
//MARK: Save new stuff
    @objc func saveNewStuff() {
        
        var image: UIImage?
        
        if imageIsChanged {
            image = imageStuff.image
        } else {
            image = #imageLiteral(resourceName: "photo")
        }
            newStuff = Stuff(name: nameTextField.text!,
                         price: priceTextField.text,
                         serialNumber: serialNumberTextField.text,
                         location: locationTextField.text,
                         image: image)
        stuffs.append(newStuff!)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        dismiss(animated: true)
        print(newStuff!)
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
            action: #selector(saveNewStuff)
        )
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
        // двигаем экран чтобы поля не закрывала клавиатура
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == serialNumberTextField {
            self.view.frame.origin.y = -70
        }
        if textField == priceTextField {
            self.view.frame.origin.y = -150
        }
        // Скрываем клавиатуру по нажатию на Done и сдвигаем обратно
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.view.frame.origin.y = 0
        return true
    }
        // активность кнопки "add(+)" в зависимости от наличии текста
    @objc private func textFieldChanged() {
        if nameTextField.text!.isEmpty == false {
            self.navigationItem.rightBarButtonItem!.isEnabled = true
        } else {
            self.navigationItem.rightBarButtonItem!.isEnabled = false
        }
    }
}

//MARK: Work with image
extension AddNewStaffVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            imagePicker.delegate = self
            present(imagePicker, animated: true)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageStuff.image = info[.editedImage] as? UIImage
        imageStuff.contentMode = .scaleAspectFit
        imageStuff.clipsToBounds = true
        imageIsChanged = true
        dismiss(animated: true)
    }
}


