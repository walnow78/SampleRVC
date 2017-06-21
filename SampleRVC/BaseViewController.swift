//
//  BaseViewController.swift
//  SampleRVC
//
//  Created by Walicki, Pawel (Cognizant) on 6/21/17.
//  Copyright © 2017 es.pael. All rights reserved.
//

import UIKit

/// Base class used on the viewcontrollers on the app
class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRevealVC()
    }
   
    /// Configuration of vertical menu
    private func setupRevealVC(){
        if revealViewController() != nil {
          
            let menuButton = UIBarButtonItem(image: UIImage(named: "reveal-icon"), style: .plain, target: nil, action: nil)
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            navigationItem.leftBarButtonItem = menuButton
        }
    }
}
