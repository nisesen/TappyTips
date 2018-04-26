//
//  PostCell.swift
//  TappyTips
//
//  Created by Daniel Shiferaw on 4/24/18.
//  Copyright © 2018 Daniel Shiferaw. All rights reserved.
//

import Foundation
import UIKit

class PostCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init not implemented")
    }
        
    // post image
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //post title
    let titleLabel: UILabel = {
        let title = UILabel()
        title.backgroundColor = .purple
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    
    //post serparate view
    let separetorView: UIView =  {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //like icon
    let likeIconView: UIImageView = {
        let likeView = UIImageView()
        likeView.image = #imageLiteral(resourceName: "icons8-heart-outline-50")
        likeView.translatesAutoresizingMaskIntoConstraints = false;
        return likeView
    }()
    
    // number of likes
    let postLikes: UILabel = {
        let likes = UILabel()
        likes.text = "10"
        likes.textAlignment = .right
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()
        
    func setupView() {
        
        addSubview(thumbnailImageView)
        addSubview(titleLabel)
        addSubview(likeIconView)
        addSubview(postLikes)
        addSubview(separetorView)
        
        //set horizontal constraints of the post thumbnail
        addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: thumbnailImageView)
        
        
        //set vertical constraint of the post thumbnail
        addConstraintsWithFormat(format: "V:|-10-[v0]-8-[v1(30)]-16-[v2(2)]|", views: thumbnailImageView, titleLabel, separetorView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separetorView)
        
        
        //set the top constraints of the title thumbnail
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        //horizontal constraints of post title and likes
        addConstraintsWithFormat(format: "H:|-10-[v0]-8-[v1(30)]-16-[v2]-20-|", views: titleLabel, likeIconView, postLikes)
        
        //set the like top icon constraints
        addConstraint(NSLayoutConstraint(item: likeIconView, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        //set the like icon left constraint
        addConstraint(NSLayoutConstraint(item: likeIconView, attribute: .left, relatedBy: .equal, toItem: titleLabel, attribute: .right, multiplier: 1, constant: 8))
        //set the like icon right constraint
        addConstraint(NSLayoutConstraint(item: likeIconView, attribute: .right, relatedBy: .equal, toItem: postLikes, attribute: .left, multiplier: 1, constant: 4))
        //set the like icon height
        addConstraint(NSLayoutConstraint(item: likeIconView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))

        //set the left constraint of the post like
        addConstraint(NSLayoutConstraint(item: postLikes, attribute: .left, relatedBy: .equal, toItem: titleLabel, attribute: .right, multiplier: 1, constant: 16))
        //set the height of Post Likes
        addConstraint(NSLayoutConstraint(item: postLikes, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        //set the top constraint of Post likes
        addConstraint(NSLayoutConstraint(item: postLikes, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
       
    }
    
}


extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDict = [String: UIView]()
        for (index, view) in views.enumerated() {
            viewsDict["v\(index)"] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict))
    }
}
