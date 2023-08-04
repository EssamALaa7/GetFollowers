//
//  FollowersCollection.swift
//  GetFollowers App
//
//  Created by Essam on 31/07/2023.
//

import UIKit

class FollowersCollection: UICollectionViewCell {
    @IBOutlet weak var imagView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }
    func initialSetup (){
        imagView.layer.cornerRadius    = 60
    }

}
