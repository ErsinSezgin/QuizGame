//
//  QuizViewController.swift
//  Quiz Game
//
//  Created by Ersin Sezgin on 11/10/2016.
//  Copyright © 2016 Ersin Sezgin. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var buttonE: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    var questionCount: Int = 0
    var correctAnsCount: Int = 0
    var timeCounter: Int = 0
    var timer: Timer?
    let quizHelper: QuizHelper = QuizHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetQuestion()
        continueButton.isHidden = true
    }
    
    func resetQuestion(){
        timeCounter = 30
        timeLabel.text = "\(timeCounter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.checkTime), userInfo: nil, repeats: true)
        questionCount += 1
        self.navigationItem.title = "Question \(questionCount)"
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        quizHelper.createNewQuestion()
        question.text = quizHelper.q
        
        buttonA.backgroundColor = UIColor.white
        buttonB.backgroundColor = UIColor.white
        buttonC.backgroundColor = UIColor.white
        buttonD.backgroundColor = UIColor.white
        buttonE.backgroundColor = UIColor.white
        
        buttonA.setTitle(String(format:"%d", (quizHelper.answers?[0].value)!), for: UIControlState.normal)
        buttonB.setTitle(String(format:"%d", (quizHelper.answers?[1].value)!), for: UIControlState.normal)
        buttonC.setTitle(String(format:"%d", (quizHelper.answers?[2].value)!), for: UIControlState.normal)
        buttonD.setTitle(String(format:"%d", (quizHelper.answers?[3].value)!), for: UIControlState.normal)
        buttonE.setTitle(String(format:"%d", (quizHelper.answers?[4].value)!), for: UIControlState.normal)
    }
    
    func checkTime(){
        if(timeCounter == 1){
            questionEnded()
        }else{
            timeCounter -= 1
            timeLabel.text = "\(timeCounter)"
        }
    }
    
    func questionEnded(){
        self.view.isUserInteractionEnabled = false
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        timer?.invalidate()
        timer = nil
        timeLabel.text = ""
        if(questionCount == 10){
            question.text = "Game is over! \nPlease continue to the scoreboard"
            continueButton.isHidden = false
        }
    }
    
    @IBAction func answerSelected(_ sender: UIButton){
        let x = Int(sender.titleLabel!.text!)
        if(x == quizHelper.correctAnswer){
            sender.backgroundColor = UIColor.green
            correctAnsCount += 1
        }else{
            sender.backgroundColor = UIColor.red
        }
        questionEnded()
    }
    
    @IBAction func nextButtonPressed(_ sender: AnyObject){
        resetQuestion()
        self.view.isUserInteractionEnabled = true
    }
    
    @IBAction func continueButtonPressed(_ sender: AnyObject) {
        
    }
}
