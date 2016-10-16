//
//  HomeViewController.swift
//  Quiz Game
//
//  Created by Ersin Sezgin on 12/10/2016.
//  Copyright © 2016 Ersin Sezgin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.text = Utility.sharedInstance.getUserName()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startQuizButtonPressed(_ sender : AnyObject){
        Utility.sharedInstance.setUserName(username: nameTF.text!)
        self.performSegue(withIdentifier: "StartQuizSegue", sender: self)
    }

}
