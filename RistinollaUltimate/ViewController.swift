//
//  ViewController.swift
//  RistinollaUltimate
//
//  Created by Ville-Matti Hakanpää on 20/12/15.
//  Copyright © 2015 Ville-Matti Hakanpää. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func boardButtonPressed(sender: AnyObject) {
        print("Button was pressed: \(sender.tag)")
    }

    @IBAction func resetGame(sender: AnyObject) {
    }
}

