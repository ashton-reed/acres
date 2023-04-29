//
//  HomeScreenViewController.swift
//  acres
//
//  Created by Ashton Reed Humphrey on 4/28/23.
//

import UIKit
//import LinkKit
import OSLog


class HomeScreenViewController: UIViewController {
    //var handler: Handler?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        //createConfiguration()
        deepLinking()
    }

    
    func deepLinking() {
        let path = "https://www.iosacres.com/plaid"
        let application = UIApplication.shared
        let appUrl = URL(string: path)
        let webUrl = URL(string: "https://www.iosacres.com") // if the appURL is not valid it will redirect to this path
        if application.canOpenURL(appUrl!) {
            application.open(appUrl!, options: [:], completionHandler: nil)
        } else {
            NSLog("Could not open the website URL")
            application.open(webUrl!)
        }
    }

    
//    func createConfiguration() {
//        let logger = Logger()
//        // With custom configuration
//        let linkToken = "link-sandbox-1b2bd885-57d0-4968-a39c-a11b409fe399"
//        let onSuccess: (LinkSuccess) -> Void = { (success) in
//          // Read success.publicToken here
//          // Log/handle success.metadata here
//            logger.log("Good things happened")
//        }
//        let linkConfiguration = LinkTokenConfiguration(token: linkToken, onSuccess: onSuccess)
//        let handlerResult = Plaid.create(linkConfiguration)
//
//        switch handlerResult {
//        case .success(let handler):
//            self.handler = handler
//            print("successful!")
//            handler.open(presentUsing: .viewController(self))
//        case .failure(let error):
//            print("failed something",error)
//          // Log and handle the error here.
//        }
//    }
}

