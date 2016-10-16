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
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        nameTF.text = Utility.sharedInstance.getUserName()
    }
    
    func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    @IBAction func startQuizButtonPressed(_ sender : AnyObject){
        Utility.sharedInstance.setUserName(username: nameTF.text!)
        self.performSegue(withIdentifier: "StartQuizSegue", sender: self)
    }

}
