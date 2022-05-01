//
//  SecondViewController.swift
//  Concentration Game
//
//  Created by zeyad on 7/4/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labelRect = CGRect(x: 30, y: 30, width: 200, height: 200)
        let label = UILabel(frame: labelRect)
        label.text = "zeyad"
        view.addSubview(label)
        
    }
    
    
    
    
}
