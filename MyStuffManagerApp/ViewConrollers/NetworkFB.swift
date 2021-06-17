//
//  NetworkFB.swift
//  MyStuffManagerApp
//
//  Created by DiuminPM on 17.06.2021.
//

import Foundation
import Firebase
import FirebaseStorage

class NetworkManagerFB {
    static let shared = NetworkManagerFB()
    
    let userID = Auth.auth().currentUser?.uid
    
    
    func getData() {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child("users").child(userID!).child("stuffs").observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
//          let value = snapshot.value as? NSDictionary
//            let stuffss = [Stuff(snapShot: snapshot)]
            for object in snapshot.children.allObjects {
                let stuff = Stuff(snapShot: object as! DataSnapshot)
                stuffs.append(stuff)
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
            
            print(stuffs.count)

          // ...
          }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func upload(currentStuffName: String, photo: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
        let ref = Storage.storage().reference().child("Stuffphoto").child(currentStuffName)
        
        guard let imageData = photo.jpegData(compressionQuality: 0.4) else { return }
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        ref.putData(imageData, metadata: metadata) { metadata, error in
            guard let _ = metadata else {
                completion(.failure(error!))
                return
            }
            ref.downloadURL { url, error in
                guard let url = url else {
                    completion(.failure(error!))
                    return
                }
                completion(.success(url))
            }
        }
    }
    
    func fetchImage(urlImage: String) -> UIImage {
        let ref = Storage.storage().reference(forURL: urlImage)
        var image = UIImage()
        let megabyte = Int64(1*1024*1024)
        ref.getData(maxSize: megabyte) { data, error in
            guard let imageData = data else { return }
            image = UIImage(data: imageData)!
        }
        return image
    }
}
