//
//  AllMyStuffVC.swift
//  MyStuffManagerApp
//
//  Created by DiuminPM on 14.03.2021.
//

import UIKit
import Firebase
import FirebaseStorage

class AllMyStuffVC: UITableViewController {

    let cellIndentyfire = "Cell"
    static var imageStuffs: [String: UIImage] = [:]
    var ref: DatabaseReference!
    let userID = Auth.auth().currentUser?.uid
    var steffs: [Stuff] = []
    var urlImage: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        createdTableView()
        
        
        ref = Database.database().reference()
        NetworkManagerFB.shared.getData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
        }
    
    func createdTableView() {
        self.tableView.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIndentyfire)
        self.tableView.register(StuffTableViewCell.self, forCellReuseIdentifier: StuffTableViewCell.indentifire)

       
    }
    
    @objc func loadList(notification: NSNotification){
        self.tableView.reloadData()
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = "My stuff"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(canceled)
        )
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewStuff)
        )
    }
    
    @objc func canceled() {
        let mainVC = AutorizationVC()
        mainVC.modalPresentationStyle = .fullScreen
        mainVC.modalTransitionStyle = .flipHorizontal
        present(mainVC, animated: true)
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    @objc func addStuff() {
        let newStuff = AddNewStuffVC()
        newStuff.saveNewStuff()
        stuffs.append(newStuff.newStuff!)
        print("check")
        tableView.reloadData()
        print(stuffs)
    }
    
    @objc func addNewStuff() {
        let addVC = UINavigationController(rootViewController: AddNewStuffVC())
        addVC.modalPresentationStyle = .fullScreen
        navigationController?.present(addVC, animated: true)
    }
    // MARK: - Table view Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stuffs.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: StuffTableViewCell.indentifire, for: indexPath) as! StuffTableViewCell
        let stuff = stuffs[indexPath.row]
//        let image = AllMyStuffVC.imageStuffs[indexPath.row]
        DispatchQueue.main.async {
            let ref = Storage.storage().reference(forURL: stuff.image!)
            var image = UIImage()
            let megabyte = Int64(1*1024*1024)
            ref.getData(maxSize: megabyte) { data, error in
                guard let imageData = data else { return }
                image = UIImage(data: imageData)!
                cell.logoStuff.image = image
            }
        }
        cell.titleName.text = stuff.name
        cell.locationName.text = stuff.image
    
        return cell
    }
    
    // MARK: - Table view Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    

   
}



