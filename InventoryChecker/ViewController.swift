//
//  ViewController.swift
//  InventoryChecker
//
//  Created by William Sjahrial on 4/29/17.
//  Copyright © 2017 Mirai Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet var startButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startButtonTapped(_ sender: Any) {
        
        print("Hello, World!")
        
    }

}

