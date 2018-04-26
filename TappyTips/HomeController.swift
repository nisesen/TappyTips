//
//  HomeController.swift
//  TappyTips
//
//  Created by Daniel Shiferaw on 4/23/18.
//  Copyright © 2018 Daniel Shiferaw. All rights reserved.
//

import Foundation
import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    let cellId  = "postCell"
    var posts: [UIImage] = [#imageLiteral(resourceName: "photo-300-300"),#imageLiteral(resourceName: "photo-100-300"),#imageLiteral(resourceName: "photo-200-100"),#imageLiteral(resourceName: "photo-100-100"),#imageLiteral(resourceName: "photo-300-200"),#imageLiteral(resourceName: "photo-100-200")]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(PostCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor.white
    }
    
    //number of sections in the collection view
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //returs number of items in sections
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 
    }
    
    
    //returns a cell to display
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PostCell
        cell.thumbnailImageView.image = posts[indexPath.row]
        //cell.thumbnailImageView.contentMode = .scaleAspectFit
        return cell
    }
    //returns the size of a cell 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    
    
    
    
}
