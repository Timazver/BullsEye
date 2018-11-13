//
//  ViewController.swift
//  BullsEye
//
//  Created by tima on 11/11/18.
//  Copyright © 2018 com.tim. All rights reserved.
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
    @IBAction func showAlert() {
        var alert=UIAlertController(title: "Hello world", message: "My first Alert popup", preferredStyle: .alert)
        var action=UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

