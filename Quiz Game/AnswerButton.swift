//
//  AnswerButton.swift
//  Quiz Game
//
//  Created by Ersin Sezgin on 12/10/2016.
//  Copyright © 2016 Ersin Sezgin. All rights reserved.
//

import UIKit

class AnswerButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.bounds = self.frame.insetBy(dx: 5, dy: 5)
        self.backgroundColor = UIColor.init(colorLiteralRed: 0.4, green: 0.7, blue: 0.3, alpha: 1)
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = false;
        self.layer.shadowOffset = CGSize.init(width:5, height:5)
        self.layer.shadowRadius = 5;
        self.layer.shadowOpacity = 0.5;
    }
    
    public func resetButton(){
        self.backgroundColor = UIColor.init(colorLiteralRed: 0.4, green: 0.7, blue: 0.3, alpha: 1)
    }

}
