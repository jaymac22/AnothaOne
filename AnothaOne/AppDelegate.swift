
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let APPLICATION_ID = "0755D83A-0AE7-EE32-FF9F-F4C86A875200"
    let API_KEY = "496F6BA2-9D71-7F11-FFE4-9729E76D1C00"
    let SERVER_URL = "https://api.backendless.com"
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Backendless.sharedInstance().hostURL = SERVER_URL
        Backendless.sharedInstance().initApp(APPLICATION_ID, apiKey: API_KEY)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = LoginVC()
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

