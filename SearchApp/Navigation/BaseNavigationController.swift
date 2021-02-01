//
//  BaseNavigationController.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 26.01.2021.
//

import UIKit

public class BaseNavigationController : UINavigationController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            self.overrideUserInterfaceStyle = .light
        }
    }
    
    override open var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
}

