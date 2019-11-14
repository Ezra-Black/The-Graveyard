//
//  ViewController.swift
//  Constraints
//
//  Created by Joseph Rogers on 11/13/19.
//  Copyright © 2019 Joseph Rogers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpSubviews()
    }
    
    func setUpSubviews() {
        let blueView = UIView()
        blueView.backgroundColor = .blue
        //disables auto resizing mask and prevents the view from creating its own constraints.
        blueView.translatesAutoresizingMaskIntoConstraints = false
        //this adds it to the actual screen. making it a subview of the view itself.
        view.addSubview(blueView)
        
//        let blueLeadingConstraint = NSLayoutConstraint(item: blueView,
//                                                       attribute: .leading,
//                                                       relatedBy: .equal,
//                                                       toItem: view.safeAreaLayoutGuide,
//                                                       attribute: .leading,
//                                                       multiplier: 1,
//                                                       constant: 20)
        
        let blueLeadingConstraint = blueView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        
//        let blueCenterYConstraint = NSLayoutConstraint(item: blueView,
//                                                       attribute: .centerY,
//                                                             relatedBy: .equal,
//                                                             toItem: view.safeAreaLayoutGuide,
//                                                             attribute: .centerY,
//                                                             multiplier: 1,
//                                                             constant: 0)
        
        let blueCenterYConstraint = blueView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0)
        
//        let blueHeightConstraint = NSLayoutConstraint(item: blueView,
//                                                      attribute: .height,
//                                                             relatedBy: .equal,
//                                                             toItem: nil,
//                                                             attribute: .notAnAttribute,
//                                                             multiplier: 1,
//                                                             constant: 100)
        
        let blueHeightConstraint = blueView.heightAnchor.constraint(equalToConstant: 100)
        
//        let blueWidthConstraints = NSLayoutConstraint(item: blueView,
//                                                      attribute: .width,
//                                                      relatedBy: .equal,
//                                                      toItem: blueView,
//                                                      attribute: .height,
//                                                      multiplier: 2,
//                                                      constant: 0)
        
        let blueWidthConstraints = blueView.widthAnchor.constraint(equalTo: blueView.heightAnchor, multiplier: 2)
        
        NSLayoutConstraint.activate([blueLeadingConstraint, blueCenterYConstraint, blueHeightConstraint, blueWidthConstraints])
    }


}

