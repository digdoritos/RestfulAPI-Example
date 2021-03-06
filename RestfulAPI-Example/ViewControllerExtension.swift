//
//  ViewControllerExtension.swift
//  RestfulAPI-Example
//
//  Created by Chun-Tang Wang on 26/03/2017.
//  Copyright © 2017 Chun-Tang Wang. All rights reserved.
//

import UIKit

enum Assets: String {
    case navigationIcon = "nav_icon_menu"
}

extension Notification.Name {
    static let displaySlideMenu = Notification.Name("displaySlideMenu")
}

extension UIViewController {
    
    func addSlideMenu() {
        let image = UIImage(named: Assets.navigationIcon.rawValue)
        let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.toggleMenu))
        navigationItem.leftBarButtonItem = barButtonItem
    }
    
    func toggleMenu() {
        NotificationCenter.default.post(name: Notification.Name.displaySlideMenu, object: nil)
    }
    
    func presentWithPushAnimation(viewControllerToPresent: UIViewController, completion: (() -> Void)? = nil) {
        let transition = CATransition()
        transition.duration = 0.25
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        view.window?.layer.add(transition, forKey: nil)
        
        present(viewControllerToPresent, animated: false, completion: completion)
    }
    
    func dismissWithBackAnimation(completion: (() -> Void)? = nil) {
        let transition = CATransition()
        transition.duration = 0.25
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        view.window?.layer.add(transition, forKey: nil)
        
        dismiss(animated: false, completion: completion)
    }
    
    func showAlert(title: String, message: String) {
        let alertVc = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVc.addAction(action)
        self.present(alertVc, animated: true, completion: nil)
    }
}
