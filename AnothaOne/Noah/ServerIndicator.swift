
import Foundation

final class ServerIndicator: UIView {
    
    private static let shared = ServerIndicator()
    
    private var Activity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 32/255, green: 32/255, blue: 34/255, alpha: 1)
        self.layer.opacity = 0.4
    }
    
    static func AddIndicator() {
        ServerIndicator.shared.AddInternal()
    }
    
    static func RemoveIndicator() {
        ServerIndicator.shared.RemoveInternal()
    }
    
    private func AddInternal() {
        UIApplication.shared.keyWindow?.addSubview(ServerIndicator.shared)
        ServerIndicator.shared.frame = (UIApplication.shared.keyWindow?.frame)!
        self.addSubview(Activity)
        Activity.center = self.center
        Activity.startAnimating()
    }
    
    private func RemoveInternal() {
        Activity.stopAnimating()
        self.Activity.removeFromSuperview()
        self.removeFromSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


