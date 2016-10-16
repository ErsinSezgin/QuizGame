//
//  QuizViewController.swift
//  Quiz Game
//
//  Created by Ersin Sezgin on 11/10/2016.
//  Copyright © 2016 Ersin Sezgin. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, ReplayDelegate {

    @IBOutlet weak var buttonA: AnswerButton!
    @IBOutlet weak var buttonB: AnswerButton!
    @IBOutlet weak var buttonC: AnswerButton!
    @IBOutlet weak var buttonD: AnswerButton!
    @IBOutlet weak var buttonE: AnswerButton!
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
    }
    
    func resetQuestion(){
        timeCounter = 10
        timeLabel.text = "\(timeCounter) sec"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.checkTime), userInfo: nil, repeats: true)
        questionCount += 1
        self.navigationItem.title = "Question \(questionCount)"
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        quizHelper.createNewQuestion()
        question.text = quizHelper.q
        
        buttonA.resetButton()
        buttonB.resetButton()
        buttonC.resetButton()
        buttonD.resetButton()
        buttonE.resetButton()
        
        buttonA.setTitle(String(format:"%d", (quizHelper.answers?[0].value)!), for: UIControlState.normal)
        buttonB.setTitle(String(format:"%d", (quizHelper.answers?[1].value)!), for: UIControlState.normal)
        buttonC.setTitle(String(format:"%d", (quizHelper.answers?[2].value)!), for: UIControlState.normal)
        buttonD.setTitle(String(format:"%d", (quizHelper.answers?[3].value)!), for: UIControlState.normal)
        buttonE.setTitle(String(format:"%d", (quizHelper.answers?[4].value)!), for: UIControlState.normal)
    }
    
    func checkTime(){
        if(timeCounter == 1){
            timer?.invalidate()
            timer = nil
            resetQuestion()
        }else{
            timeCounter -= 1
            timeLabel.text = "\(timeCounter) sec"
        }
    }
    
    func questionEnded(){
        self.view.isUserInteractionEnabled = false
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        timer?.invalidate()
        timer = nil
        timeLabel.text = ""
        if(questionCount == 10){
            self.performSegue(withIdentifier: "ScoreBoardSegue", sender: self)
        }
    }
    
    func replay(sender: ScoreBoardViewController) {
        self.view.isUserInteractionEnabled = true
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        questionCount = 0
        correctAnsCount = 0
        resetQuestion()
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ScoreBoardSegue" {
            let vc = segue.destination as! ScoreBoardViewController
            vc.delegate = self
            vc.score = correctAnsCount
        }
    }
}
