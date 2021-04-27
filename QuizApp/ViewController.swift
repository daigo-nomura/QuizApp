//
//  ViewController.swift
//  QuizApp
//
//  Created by 野村大悟 on 2020/09/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quizStart: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        quizStart.layer.cornerRadius = 10
    }

    //画面遷移してクイズを始める
    @IBAction func quizStartButton(_ sender: Any) {
        let storyBorad = UIStoryboard(name: "quiz", bundle: nil)
        
        let quizViewController = storyBorad.instantiateViewController(identifier: "quizViewController") as! QuizViewController
        
        self.present(quizViewController, animated: true, completion: nil)
    }
    
}

