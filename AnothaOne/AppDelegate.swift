
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
    static private let APP_ID = "EB0B9661-93E1-23D1-FFEE-25DB85DF8100"
    static private let IOS_API = "C05C5319-987F-4E8C-FF15-327EFD9D1900"
    static private let REST_API = "F79A3D56-5493-B314-FFD6-0A09528AAC00"
    
    static private let GoogleSignIn_KEY = "593716154431-agaubq4jb3tjvfaoiden777j28ianofd"
    
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

