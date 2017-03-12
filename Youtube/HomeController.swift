//
//  ViewController.swift
//  Youtube
//
//  Created by Sai206511854 on 3/12/17.
//  Copyright © 2017 Sai206511854. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        navigationController?.navigationBar.isTranslucent = false
        
        let titlelabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width-32, height: view.frame.height))
        titlelabel.text = "Home"
        titlelabel.textColor = UIColor.white
        titlelabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titlelabel
        collectionView?.backgroundColor = UIColor.white
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! VideoCell
        setUp(cell)
        return cell
    }
    
    private func setUp(_ cell: VideoCell) {
        cell.imageView.image = UIImage(named: "coldplay album")
        cell.imageView.contentMode = .scaleAspectFill
        cell.imageView.clipsToBounds = true
        cell.profileImageView.image = UIImage(named: "coldplay-profile")
        cell.profileImageView.layer.cornerRadius = cell.profileImageView.frame.width/2
        cell.profileImageView.contentMode = .scaleAspectFill
        cell.profileImageView.clipsToBounds = true
        cell.mainTextLabel.text = "Head full of dreams"
        cell.subtitleTextLabel.text = "Coldplay"

    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = (view.frame.width-32) * 9/16
        return CGSize(width: view.frame.width, height: height+70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
