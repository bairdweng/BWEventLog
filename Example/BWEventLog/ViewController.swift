//
//  ViewController.swift
//  BWEventLog
//
//  Created by bairdweng on 08/10/2020.
//  Copyright (c) 2020 bairdweng. All rights reserved.
//

import UIKit
import BWEventLog
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        BWEventLog.register()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

