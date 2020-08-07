//
//  ViewController.swift
//  miniProject2
//
//  Created by Apple on 8/6/20.
//  Copyright © 2020 Ayesha Zaker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionNumber: UILabel!
    
    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var questionPicture: UIImageView!
    
    
    
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    @IBOutlet weak var answerFour: UIButton!
    

    @IBAction func answerOneFunc(_ sender: Any) {
        if (isCorrect(selectedAnswer: 0)) {
            nextQuestion()
        }
    }
    @IBAction func answerTwoFunc(_ sender: Any) {
        if (isCorrect(selectedAnswer: 1)) {
            nextQuestion()
        }
    }
    @IBAction func answerThreeFunc(_ sender: Any) {
        if (isCorrect(selectedAnswer: 2)) {
            nextQuestion()
        }
    }
    @IBAction func answerFourFunc(_ sender: Any) {
        if (isCorrect(selectedAnswer: 3)) {
            nextQuestion()
        }
    }
    
    var currentQuestion = -1;
    var numQuestions = -1;
    
    var questions: Array<Dictionary<String, Any>> = [];
    
    let QuestionOne = [
        "question": "When was the constituion written?",
        "answers": ["1776","1787","1777","1788"],
        "correct": "1776",
        "image_path": "signingoftheconsttitutionglanzmann"
    
        ] as [String : Any]
    
    let QuestionTwo = [
        "question": "when was the declaration of independence written?",
        "answers": ["1774", "1775", "1776","1777"],
        "correct": "1774",
        "image_path": "declaration_independence"
        ] as [String : Any]

    let QuestionThree = [
        "question": "who was the first president?",
        "answers": ["donald j trump", "kanye west", "abraham lincoln","george washington"],
        "correct": "george washington",
        "image_path": "declaration_independence"
        ] as [String : Any]
       
    func isCorrect(selectedAnswer: Int) -> Bool{
        let questionData = questions[currentQuestion]
        let answers = questionData["answers"] as! Array<String>
        let answer = questionData["correct"] as? String
        
        return answers[selectedAnswer] == answer
        
    }

    func nextQuestion(){
        currentQuestion += 1
        currentQuestion %= numQuestions
        let questionData = questions[currentQuestion]
        let answers = questionData["answers"] as! Array<String>
        
        questionTitle.text = questionData["question"] as? String
        answerOne.setTitle(answers[0], for: .normal)
        answerTwo.setTitle(answers[1], for: .normal)
        answerThree.setTitle(answers[2], for: .normal)
        answerFour.setTitle(answers[3], for: .normal)
        questionNumber.text = "Question " + String(currentQuestion+1)
        
        questionPicture.image = UIImage(named: questionData["image_path"] as? String ?? "america")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        questions = [QuestionOne,
                     QuestionTwo] as Array<Dictionary<String, Any>>
        numQuestions = questions.count
        nextQuestion()
    }


}

