//
//  HomeViewController.swift
//  Quiz Game
//
//  Created by Ersin Sezgin on 12/10/2016.
//  Copyright © 2016 Ersin Sezgin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startQuizButtonPressed(_ sender : AnyObject){
        self.performSegue(withIdentifier: "StartQuizSegue", sender: self)
    }

}
