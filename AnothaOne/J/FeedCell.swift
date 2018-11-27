//
//  FeedCell.swift
//  youtube
//
//  Created by Brian Voong on 10/15/18.
//  Copyright © 2018 letsbuildthatapp. All rights reserved.
//

import UIKit

private let EV: [Event] = {
    let a = Event();let b = Event();let c = Event();let d = Event();
    a.title = "Event #1"
    b.title = "Event #2"
    c.title = "Event #3"
    d.title = "Event #4"
    a.location = "Location #1"
    b.location = "Location #2"
    c.location = "Location #3"
    d.location = "Location #4"
    
    return [a,b,c,d]
}()

private let P: [BackendlessUser] = {
    let a = BackendlessUser();let b = BackendlessUser();let c = BackendlessUser();
    a.name = "Noah Gomez"
    b.name = "Jethro Arsenal"
    c.name = "Mike Hawk"
    return [a,b,c]
}()

class FeedCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    static let cellID = "FeedCellID"
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    var type: Screens?
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .brown
        
        collectionView.contentInset = .init(top: 70, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = .init(top: 50, left: 0, bottom: 0, right: 0)
        
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: VideoCell.cellID)
        collectionView.register(EventCell.self, forCellWithReuseIdentifier: EventCell.cellID)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let type = type else {
            return 0;
        }
        
        switch type {
        case .Home:
            return EV.count
        case .Friends:
            return P.count
        case .Profile:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch type! {
        case .Home:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCell.cellID, for: indexPath) as! EventCell
            cell.setTextForEvent(e: EV[indexPath.item])
            return cell
        case .Friends:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCell.cellID, for: indexPath) as! EventCell
            return cell
        case .Profile:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCell.cellID, for: indexPath) as! EventCell
            cell.setTextForEvent(e: EV[indexPath.item])
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let height = (frame.width - 16 - 16) * 9 / 16
        return .init(width: frame.width, height: 50 + 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
