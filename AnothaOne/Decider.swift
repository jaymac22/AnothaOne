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
private var personWorking: PersonWorking  = .N;

class Decider: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        ServerIndicator.AddIndicator()
        
        switch personWorking {
            
        case .M:
            (UIApplication.shared.delegate as! AppDelegate).changeRootViewController(SettingsTableViewController())
        case .N:
            (UIApplication.shared.delegate as! AppDelegate).changeRootViewController(GoogleLoginVC())
        case .J:
            //THIS IS WHERE YOUR FLOW LAYOUT IS
            let layout = UICollectionViewFlowLayout()
            let myVC = UINavigationController(rootViewController: HomeController(collectionViewLayout: layout));
            (UIApplication.shared.delegate as! AppDelegate).changeRootViewController(myVC)
        }
        ServerIndicator.RemoveIndicator()
    }
    
}
