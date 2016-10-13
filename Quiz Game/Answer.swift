//
//  Answer.swift
//  Quiz Game
//
//  Created by Ersin Sezgin on 11/10/2016.
//  Copyright © 2016 Ersin Sezgin. All rights reserved.
//

import UIKit

class Answer: NSObject {
    public var value: Int = 0
    public var correct: Bool = false
    
    init(value: Int, correct: Bool){
        self.value = value;
        self.correct = correct;
    }
}
