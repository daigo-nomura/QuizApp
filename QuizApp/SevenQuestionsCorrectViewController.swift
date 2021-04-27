//
//  SevenQuestionsCorrectViewController.swift
//  QuizApp
//
//  Created by 野村大悟 on 2020/09/28.
//

import Foundation
import UIKit

class SevenQuestionsCorrectViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var numberOfCorrectAnswers: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    var outputValue:String?
    var sevenQuestionsCorrectViewControllerRightOrWrong:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        numberOfCorrectAnswers.text = outputValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sevenQuestionsCorrectViewControllerRightOrWrong.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "第\(indexPath.row + 1)問"
        cell.textLabel!.text! += sevenQuestionsCorrectViewControllerRightOrWrong[indexPath.row]
        cell.textLabel!.font = UIFont.boldSystemFont(ofSize: 20)
        return cell
    }
    
    //トップ画面に遷移する
    @IBAction func backButton(_ sender: Any) {
        let storyBorad1 = UIStoryboard(name: "Main", bundle: nil)
        let viewController =
            storyBorad1.instantiateViewController(identifier: "viewController") as! ViewController
        self.present(viewController, animated: true, completion: nil)
    }
}
