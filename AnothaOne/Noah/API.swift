import Foundation
import UIKit

@objcMembers
class Person: NSObject {
    var objectId: String?
    var name: String = "Noah"
    var ddd: NSDate = NSDate()
}

extension UIViewController {
    func ShowOkAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}

class APIVC: UIViewController {
    
    var serviceName = "test"
    let APINames = ["ccnn","postEvent", "getAllEvents", "getMyEvents","submitResponse","deleteAccount"]
    var p = Person()
    
    
    @IBAction func didClickOne(_ sender: Any) {
        let methodName = APINames[0]
        
        backendless.customService.invoke(serviceName, method: methodName, args: [0, p], response: { (resp) in
            
            guard let GoodResponse = resp as? [String : Any] else {
                self.ShowOkAlert(title: "No Response Found", message: "")
                return;
            }
            
            if let _ = (GoodResponse["drop"]) as? Double {
                //self.ShowOkAlert(title: "Date Found", message: NSDate(timeIntervalSince1970: tmp1 / 1000).description)
            }
            
            self.ShowOkAlert(title: "Response from \(methodName)", message: GoodResponse.description)
            
        }, error: { value in
            let errorMsg = value?.detail ?? "Error could not be determined"
            self.ShowOkAlert(title: "Error from \(methodName)", message: errorMsg)
        })
    }
    
    @IBAction func didClickTwo(_ sender: Any) {
        let methodName = APINames[1]
        backendless.customService.invoke(serviceName, method: methodName, args: [0, p], response: { (resp) in
            
            guard let GoodResponse = resp as? [String : Any] else {
                self.ShowOkAlert(title: "No Response Found", message: "")
                return;
            }
            
            self.ShowOkAlert(title: "Response from \(methodName)", message: GoodResponse.description)
            
        }, error: { value in
            let errorMsg = value?.detail ?? "Error could not be determined"
            self.ShowOkAlert(title: "Error from \(methodName)", message: errorMsg)
        })
    }
    
    @IBAction func didClickThree(_ sender: Any) {
        let methodName = APINames[2]
        backendless.customService.invoke(serviceName, method: methodName, args: [0, p], response: { (resp) in
            
            guard let GoodResponse = resp as? [String : Any] else {
                self.ShowOkAlert(title: "No Response Found", message: "")
                return;
            }
            
            self.ShowOkAlert(title: "Response from \(methodName)", message: GoodResponse.description)
            
        }, error: { value in
            let errorMsg = value?.detail ?? "Error could not be determined"
            self.ShowOkAlert(title: "Error from \(methodName)", message: errorMsg)
        })
    }
    @IBAction func didClickFive(_ sender: Any) {
        let methodName = APINames[4]
        backendless.customService.invoke(serviceName, method: methodName, args: [0, p], response: { (resp) in
            
            guard let GoodResponse = resp as? [String : Any] else {
                self.ShowOkAlert(title: "No Response Found", message: "")
                return;
            }
            
            self.ShowOkAlert(title: "Response from \(methodName)", message: GoodResponse.description)
            
        }, error: { value in
            let errorMsg = value?.detail ?? "Error could not be determined"
            self.ShowOkAlert(title: "Error from \(methodName)", message: errorMsg)
        })
    }
    @IBAction func deleteAccount(_ sender: Any) {
        let methodName = APINames[5]
        backendless.customService.invoke(serviceName, method: methodName, args: [0, p], response: { (resp) in
            
            guard let GoodResponse = resp as? [String : Any] else {
                self.ShowOkAlert(title: "No Response Found", message: "")
                return;
            }
            
            self.ShowOkAlert(title: "Response from \(methodName)", message: GoodResponse.description)
            
        }, error: { value in
            let errorMsg = value?.detail ?? "Error could not be determined"
            self.ShowOkAlert(title: "Error from \(methodName)", message: errorMsg)
        })
    }
    
    @IBAction func getMyEvents(_ sender: Any) {
        let methodName = APINames[3]
        backendless.customService.invoke(serviceName, method: methodName, args: [0, p], response: { (resp) in
            
            guard let GoodResponse = resp as? [String : Any] else {
                self.ShowOkAlert(title: "No Response Found", message: "")
                return;
            }
            
            self.ShowOkAlert(title: "Response from \(methodName)", message: GoodResponse.description)
            
        }, error: { value in
            let errorMsg = value?.detail ?? "Error could not be determined"
            self.ShowOkAlert(title: "Error from \(methodName)", message: errorMsg)
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
