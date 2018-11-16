import Foundation

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: nil, views: viewsDictionary))
    }
}
final class RoundedByHeightButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = CGFloat(self.bounds.size.height / 2.0)
    }
}

extension UICollectionView {
    func ReloadSectionAt(_ SectionToReload: Int) {
        self.reloadSections(IndexSet(integer: SectionToReload))
    }
}

extension UIAlertController {
    static func OKAlert(title titleText: String, message messageText: String?) -> UIAlertController {
        let alert = UIAlertController(title: titleText, message: messageText, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        return alert
    }
}
extension UIImageView {
    static func AppBasic(image: UIImage?, contentMode: UIViewContentMode, rounded: Bool = false) -> UIImageView {
        let imageView = (rounded ? RoundedByHeightImageView() : UIImageView())
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        imageView.clipsToBounds = true;
        imageView.image = image
        imageView.contentMode = contentMode
        return imageView
    }
}

extension UICollectionView {
    
    static func AppBasicFlowCV(background: UIColor, scroll: UICollectionViewScrollDirection = .vertical, headerStick: Bool = false, footerStick: Bool = false ) -> UICollectionView {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scroll
        layout.sectionHeadersPinToVisibleBounds = headerStick;
        layout.sectionFootersPinToVisibleBounds = footerStick;
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false;
        cv.backgroundColor = background
        cv.showsVerticalScrollIndicator = (scroll == .vertical ? true : false)
        cv.showsHorizontalScrollIndicator = (scroll == .horizontal ? true : false)
        cv.alwaysBounceVertical = (scroll == .vertical ? true : false)
        cv.alwaysBounceHorizontal = (scroll == .horizontal ? true : false)
        
        return cv
    }
    
    static func StaticFlowCV(background: UIColor, scroll: UICollectionViewScrollDirection = .vertical) -> UICollectionView {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scroll
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false;
        cv.backgroundColor = background
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.alwaysBounceVertical = false
        cv.alwaysBounceHorizontal = false
        return cv
    }
}

class RoundedByHeightImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = CGFloat(self.bounds.size.height / 2.0)
    }
}


class RoundedByHeightView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = CGFloat(self.bounds.size.height / 2.0)
    }
}

class App_Custom_UIView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints  = false
        viewDidLoad_NoSuperNeeded()
    }
    
    func viewDidLoad_NoSuperNeeded() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class SingleViewIndicator: UIView {
    
    private let ActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGray
        self.layer.opacity = 1 // 1 because it also takes away opacity from the indicator
        addSubview(ActivityIndicator)
        self.isHidden = true;
    }
    
    func Show() {
        self.isHidden = false;
        ActivityIndicator.center = self.center
        ActivityIndicator.startAnimating()
    }
    
    func Hide() { self.isHidden = true; }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class AppBasicView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false;
        SetupView_NoSuperNeeded()
    }
    
    func SetupView_NoSuperNeeded() {} // when a view override this, they don't need to call the super.SetupView_NoSuperNeeded() call.
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    
    static func AppCircleView(_ background: UIColor) -> UIView {
        let view = RoundedByHeightView()
        view.backgroundColor = background
        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
    }
    
    static func AppSingleViewIndicator() -> SingleViewIndicator {
        let view = SingleViewIndicator()
        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
    }
    
    static func AppGeneric(background: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = background
        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
    }
    
    func addConstraintWithFormat(format: String, view: UIView) {
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":view]))
    }
    
    func FillWithChildView(H:Bool, V: Bool, view: UIView) {
        if H {
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":view]))
        }
        if V {
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":view]))
        }
    }
    
    static func UDSingleViewIndicator() -> SingleViewIndicator {
        let view = SingleViewIndicator()
        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
    }
    
}

extension UIColor {
}
