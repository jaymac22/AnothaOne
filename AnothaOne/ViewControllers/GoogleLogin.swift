
import Foundation
import GoogleSignIn

class GoogleLoginVC: UIViewController, GIDSignInUIDelegate {
    
    private static var shared: GoogleLoginVC? = nil;
    
    fileprivate let GoogleHolder = UIView.AppGeneric(background: .clear);
    fileprivate let GoogleButton = GIDSignInButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray;
        GoogleLoginVC.shared = self;

        GIDSignIn.sharedInstance().uiDelegate = self
        GoogleButton.style = .wide
        
        let H = GoogleButton.frame.height
        let W = GoogleButton.frame.width + 24
//        self.view.addSubview(GoogleHolder)
//        GoogleHolder.addSubview(GoogleButton)
//        GoogleHolder.widthAnchor.constraint(equalToConstant: W).isActive = true;
//        GoogleHolder.heightAnchor.constraint(equalToConstant: H).isActive = true;
//        GoogleHolder.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true;
//        GoogleHolder.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -32).isActive = true;
        
        GoogleButton.frame = CGRect(x: 0, y: 0, width: W, height: H)
        
    }
    
    static func didSignInWithGoogleUser(user: GIDGoogleUser) {
        //ServerIndicator.AddIndicator()
        backendless.userService.setStayLoggedIn(true)
        let token = user.authentication.idToken
        backendless.userService.login(withGoogleSDK: token, accessToken: user.authentication.accessToken,
                                      response: { (user: BackendlessUser?) -> Void in
                                        GoogleLoginVC.shared?.didLogin(withUser: user!, GoogleLogin: true);
        },error: { (fault : Fault?) -> Void in
            print("Server reported an error: ","\(fault?.description ?? "error not found")")
            //ServerIndicator.RemoveIndicator()
        })
    }
    
    func didLogin(withUser user: BackendlessUser, GoogleLogin: Bool = false) {
        
    }
    
    func GoToWorkoutScreen() {
        ServerIndicator.AddIndicator()
        GoogleLoginVC.shared = nil;
        (UIApplication.shared.delegate as! AppDelegate).changeRootViewController(HomeVC())
        ServerIndicator.RemoveIndicator()
    }
    
}

