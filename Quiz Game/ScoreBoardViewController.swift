//
//  ScoreBoardViewController.swift
//  Quiz Game
//
//  Created by Ersin Sezgin on 16/10/2016.
//  Copyright © 2016 Ersin Sezgin. All rights reserved.
//

import UIKit

protocol ReplayDelegate {
    func replay(sender: ScoreBoardViewController)
}

class ScoreBoardViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var replayButton: UIButton!
    
    public var score: Int!
    public var delegate: ReplayDelegate! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        titleLabel.text = "Congratz \(Utility.sharedInstance.getUserName())"
        scoreLabel.text = "Your score is \(score!)/10"
    }
    
    @IBAction func replayButtonPressed(_ sender: AnyObject){
        self.navigationController?.popViewController(animated: true)
        self.delegate.replay(sender: self)
    }
    
    @IBAction func endButtonPressed(_ sender: AnyObject){
        self.dismiss(animated: true, completion: nil)
    }
    
}
