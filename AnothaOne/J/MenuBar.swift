
import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
        var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
        var homeController: HomeController?
        
        func setupHorizontalBar() {
            let horizontalBarView = UIView()
            horizontalBarView.backgroundColor = UIColor(white: 0.95, alpha: 1)
            horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(horizontalBarView)
            
            horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
            horizontalBarLeftAnchorConstraint?.isActive = true
            
            horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
            horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            //        print(indexPath.item)
            //        let x = CGFloat(indexPath.item) * frame.width / 4
            //        horizontalBarLeftAnchorConstraint?.constant = x
            //
            //        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            //            self.layoutIfNeeded()
            //        }, completion: nil)
            homeController?.scrollToMenuIndex(menuIndex: indexPath.item)
        }
        
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = statusBarColor //UIColor.rgb(red: 230, green: 32, blue: 31)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    let imageNames = ["hot", "friends", "me"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .bottom)
        
        setupHorizontalBar()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = MenuCell.darkIconColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / CGFloat(imageNames.count), height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class MenuCell: BaseCell {
    
    static var darkIconColor = UIColor(white: 0, alpha: 0.4)  //UIColor.rgb(red: 91, green: 14, blue: 13)
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = darkIconColor
        return iv
    }()
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? UIColor.white : MenuCell.darkIconColor
        }
    }
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.white : MenuCell.darkIconColor
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        addConstraintsWithFormat("H:[v0(28)]", views: imageView)
        addConstraintsWithFormat("V:[v0(28)]", views: imageView)
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
}








