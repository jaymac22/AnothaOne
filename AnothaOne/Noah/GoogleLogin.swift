
import Foundation
import GoogleSignIn

class GoogleLoginVC: UIViewController, GIDSignInUIDelegate {
    
    private static var shared: GoogleLoginVC? = nil;
    
    fileprivate let GoogleHolder = UIView.AppGeneric(background: .clear);
    fileprivate let GoogleButton = GIDSignInButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 157/255, green: 251/255, blue: 250/255, alpha: 0.7)
        GoogleLoginVC.shared = self;

        GIDSignIn.sharedInstance().uiDelegate = self
        GoogleButton.style = .wide
        GoogleButton.colorScheme = .light
        
        let H = GoogleButton.frame.height
        let W = GoogleButton.frame.width + 24
        self.view.addSubview(GoogleHolder)
        GoogleHolder.addSubview(GoogleButton)
        GoogleHolder.widthAnchor.constraint(equalToConstant: W).isActive = true;
        GoogleHolder.heightAnchor.constraint(equalToConstant: H).isActive = true;
        GoogleHolder.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
        //GoogleHolder.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -96).isActive = true;
        GoogleHolder.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 96).isActive = true;
        GoogleButton.frame = CGRect(x: 0, y: 0, width: W, height: H)
        
        let iv = UIImageView.AppBasic(image: #imageLiteral(resourceName: "Headlines"), contentMode: .scaleAspectFit, rounded: false)
        self.view.addSubview(iv)
        iv.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -164).isActive = true;
        iv.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
        iv.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 2/3, constant: 0).isActive = true;
        iv.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/6, constant: 0).isActive = true;
        
        let icon = UIImageView.AppBasic(image: #imageLiteral(resourceName: "icon"), contentMode: .scaleAspectFit, rounded: false)
        self.view.addSubview(icon)
        icon.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -32).isActive = true;
        icon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
        icon.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0, constant: 96).isActive = true;
        icon.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0, constant: 96).isActive = true;
        
    }
    
    static func didSignInWithGoogleUser(user: GIDGoogleUser) {
        ServerIndicator.AddIndicator()
        //ServerIndicator.AddIndicator()
        backendless.userService.setStayLoggedIn(true)
        let token = user.authentication.idToken
        backendless.userService.login(withGoogleSDK: token, accessToken: user.authentication.accessToken,
                                      response: { (user: BackendlessUser?) -> Void in
                                        GoogleLoginVC.shared?.didLogin(withUser: user!, GoogleLogin: true);
        },error: { (fault : Fault?) -> Void in
            print("Server reported an error: ","\(fault?.description ?? "error not found")")
            ServerIndicator.RemoveIndicator()
        })
    }
    
    func didLogin(withUser user: BackendlessUser, GoogleLogin: Bool = false) {
        print("DID LOGING")
        //let controller = UIStoryboard(name: "Settings", bundle: nil).instantiateViewController(withIdentifier: "SettingsStoryBoardID") as! SettingsTableViewController
        let cc = UIStoryboard(name: "API", bundle: nil).instantiateViewController(withIdentifier: "APIID") as! APIVC
        (UIApplication.shared.delegate as! AppDelegate).changeRootViewController(cc)
        ServerIndicator.RemoveIndicator()
    }
    
}

