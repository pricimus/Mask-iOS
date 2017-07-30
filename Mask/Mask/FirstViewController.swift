//
//  FirstViewController.swift
//  Mask
//
//  Created by Edward Price on 30/07/2017.
//  Copyright © 2017 Edward Price. All rights reserved.
//

import Foundation
import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "First view"
        view.backgroundColor = .blue
        
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.layer.cornerRadius = 3
        button.titleLabel?.font = UIFont.init(name: "NunitoSans-ExtraBold", size: 10)
        button.isEnabled = true
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Map", for: UIControlState())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: 5.0, left: 10.0, bottom: 5.0, right: 10.0)
        button.addTarget(self, action: #selector(handleMap), for: .touchUpInside)
        
        view.addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func handleMap()
    {
        print("Show map")
        let mapViewController = ViewController()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.pushViewController(mapViewController, animated: true)
    }

}
