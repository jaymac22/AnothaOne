//
//  FriendCell.swift
//  AnothaOne
//
//  Created by Noah Gomez on 11/27/18.
//

import Foundation

class Friend {
    var name: String = ""
    var name2: String = ""
}

class FriendCell: BaseCell {
    
    static let cellID = "FriendCell"
    
    func setTextForFriend(e: Friend){
        titleLabel.text = e.name
        subtitleTextView.text = e.name2
        self.updateFocusIfNeeded()
    }
    
    let thumbnailImageView: UIImageView = UIImageView()
    
    let userProfileImageView: UIImageView = UIImageView()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
    let titleLabel: UILabel = UILabel()
    
    let subtitleTextView: UITextView = UITextView()
    
    override func setupViews() {
        thumbnailImageView.contentMode = .scaleAspectFill
        thumbnailImageView.clipsToBounds = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.isUserInteractionEnabled = false;
        
        //userProfileImageView.image = UIImage(named: "taylor_swift_profile")
        userProfileImageView.layer.cornerRadius = 22
        userProfileImageView.layer.masksToBounds = true
        userProfileImageView.backgroundColor = UIColor.lightGray
        
        subtitleTextView.translatesAutoresizingMaskIntoConstraints = false
        //subtitleTextView.text = "TaylorSwiftVEVO • 1,604,684,607 views • 2 years ago"
        subtitleTextView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        subtitleTextView.textColor = UIColor.lightGray
        subtitleTextView.isUserInteractionEnabled = false;
        
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: thumbnailImageView)
        
        addConstraintsWithFormat("H:|-16-[v0(44)]", views: userProfileImageView)
        
        //vertical constraints
        addConstraintsWithFormat("V:|[v0(0)]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, userProfileImageView, separatorView)
        
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        
        titleLabel.bottomAnchor.constraint(equalTo: userProfileImageView.centerYAnchor).isActive = true;
        //top constraint
        //        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        //left constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        //height constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        //left constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        //height constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
    }
}
