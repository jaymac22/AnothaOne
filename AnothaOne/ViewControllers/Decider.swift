//
//  Decider.swift
//  AnothaOne
//
//  Created by Noah Gomez on 11/8/18.
//

import Foundation

private enum Person {
    case M,J,N
}

class Decider: UIViewController {
    
    private var working: Person = .M;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        ServerIndicator.AddIndicator()
        switch working {
        case .M:
            (UIApplication.shared.delegate as! AppDelegate).changeRootViewController(GoogleLoginVC())
        case .J:
            (UIApplication.shared.delegate as! AppDelegate).changeRootViewController(HomeVC())
        case .N:
            (UIApplication.shared.delegate as! AppDelegate).changeRootViewController(GoogleLoginVC())
        }
        ServerIndicator.RemoveIndicator()
    }
    
}
