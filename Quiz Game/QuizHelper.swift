//
//  QuizHelper.swift
//  Quiz Game
//
//  Created by Ersin Sezgin on 11/10/2016.
//  Copyright © 2016 Ersin Sezgin. All rights reserved.
//

import UIKit

class QuizHelper: NSObject {
    var answers : [Answer]?
    var correctAnswer : Int = 0
    var q: String = ""
    
    public func createNewQuestion(){
        let a = arc4random_uniform(100)
        let b = arc4random_uniform(100)
        q = "\(a) + \(b) = ?"
        correctAnswer = Int(a+b);
        answers = []
        fillAnswersArray(answer: correctAnswer)
    }
    
    func fillAnswersArray(answer: Int){
        answers?.append(Answer(value: answer, correct: true))
        answers?.append(Answer(value: answer - 10, correct: false))
        answers?.append(Answer(value: answer - 20, correct: false))
        answers?.append(Answer(value: answer + 10, correct: false))
        answers?.append(Answer(value: answer + 20, correct: false))
    }
    
    public func checkUserAnswer(answer: Int) -> Bool{
        return answer == correctAnswer
    }
    
    
    
}
