//
//  ViewController.swift
//  Hello Zig
//
//  Created by Matthew Iannucci on 12/9/18.
//  Copyright © 2018 Matthew Iannucci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var currentCountLabel: UILabel!
    
    var count: Int32 = 0 {
        didSet {
            currentCountLabel.text = "The current count is \(count)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func incrementCount(_ sender: Any) {
        count = add(count, 1)
    }
}

