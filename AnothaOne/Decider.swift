//
//  Decider.swift
//  AnothaOne
//
//  Created by Noah Gomez on 11/8/18.
//

import Foundation

private enum PersonWorking {
    case M,J,N
}

//CHANGE THIS VARIABLE WHEN YOU ARE WORKING
private var personWorking: PersonWorking  = .M;

class Decider: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        ServerIndicator.AddIndicator()
        
        switch personWorking {
            
        case .M:
            let storyboard = UIStoryboard(name: "Settings", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "SettingsStoryBoardID") as! SettingsTableViewController
            (UIApplication.shared.delegate as! AppDelegate).changeRootViewController(controller)
            //(UIApplication.shared.delegate as! AppDelegate).changeRootViewController(SettingsTableViewController())
        case .N:
            
            if (Int(truncating: backendless.userService.isValidUserToken()) != 0) {
                Decider.goToHomePage()
            } else {
                (UIApplication.shared.delegate as! AppDelegate).changeRootViewController(GoogleLoginVC())
            }
            
        case .J:
            //THIS IS WHERE YOUR FLOW LAYOUT IS
            let layout = UICollectionViewFlowLayout()
            let myVC = UINavigationController(rootViewController: HomeController(collectionViewLayout: layout));
            (UIApplication.shared.delegate as! AppDelegate).changeRootViewController(myVC)
        }
        ServerIndicator.RemoveIndicator()
    }
    
    static func goToHomePage() {
        let layout = UICollectionViewFlowLayout()
        let myVC = UINavigationController(rootViewController: HomeController(collectionViewLayout: layout));
        (UIApplication.shared.delegate as! AppDelegate).changeRootViewController(myVC)
    }
    
}
