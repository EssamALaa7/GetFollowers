//
//  SecondScreen.swift
//  GetFollowers App
//
//  Created by Essam on 30/07/2023.
//

import UIKit

class SecondScreenVC: UIViewController {
    @IBOutlet weak var lable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var collectioView: UICollectionView!
    var nameUser: String?
    var date : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        collectioView.delegate = self
        collectioView.dataSource = self
        collectioView.register(UINib(nibName: "FollowersCollection", bundle: nil), forCellWithReuseIdentifier: "FollowersCollection")
        lable.text = nameUser
        let dateString = date ?? ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateOfBirth = dateFormatter.date(from: dateString)!

        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: dateOfBirth, to: Date())

        let age = ageComponents.year!
        print(age)
        dateLable.text = "Your Age \(age) Year"
        print("essam")
    }
}
extension SecondScreenVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FollowersCollection", for: indexPath) as! FollowersCollection
        return cell
    }
    
    
}
