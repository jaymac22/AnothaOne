
import UIKit

import GoogleSignIn

var backendless: Backendless { return Backendless.sharedInstance() }

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    var window: UIWindow?
    
    // FilesURL is the prefix string for file service url API calls
    static let FilesURL: String = "https://api.backendless.com/\(AppDelegate.APP_ID)/\(AppDelegate.REST_API)/files/"
    static let ServiceURL: String = "https://api.backendless.com/\(AppDelegate.APP_ID)/\(AppDelegate.REST_API)/services/"
    
    //App Keys & ID's
    static private let API_URL = "https://api.backendless.com"
    static private let APP_ID = "0755D83A-0AE7-EE32-FF9F-F4C86A875200"
    static private let IOS_API = "496F6BA2-9D71-7F11-FFE4-9729E76D1C00"
    static private let REST_API = "42515608-86B4-E758-FFA6-1C17374FD100"
    
    static private let GoogleSignIn_KEY = "649839761633-hldb7ntuoggmos9o30uqp1j9neablg4c"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        backendless.hostURL = AppDelegate.API_URL
        backendless.initApp(AppDelegate.APP_ID, apiKey: AppDelegate.IOS_API)
        
        GIDSignIn.sharedInstance().clientID = AppDelegate.GoogleSignIn_KEY + ".apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().signOut()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = Decider()
        
        return true
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        
        if let error = error {
            print("YEET ON THEM ERRORS")
            dump(error)
            return;
        }
        GoogleLoginVC.didSignInWithGoogleUser(user: user)
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        backendless.userService.logout()
    }
    
    
    func changeRootViewController(_ ToController : UIViewController) {
        //Custom function to change root window
        let desiredViewController = ToController
        DispatchQueue.main.async {
            let snapshot:UIView = (self.window?.snapshotView(afterScreenUpdates: true))!
            desiredViewController.view.addSubview(snapshot);
            self.window?.rootViewController = desiredViewController;
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                snapshot.layer.opacity = 0;
                //snapshot.layer.transform = CATransform3DMakeScale(1, 1, 1);
            }, completion: { (value: Bool) in
                snapshot.removeFromSuperview();
            })
        }
        
    }
}

