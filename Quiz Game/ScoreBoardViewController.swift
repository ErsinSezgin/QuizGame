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
        titleLabel.text = "Congratz \(Utility.sharedInstance.getUserName())"
        scoreLabel.text = "\(score!)/10"
    }
    
    @IBAction func replayButtonPressed(_ sender: AnyObject){
        self.navigationController?.popViewController(animated: true)
        self.delegate.replay(sender: self)
    }
    
}
