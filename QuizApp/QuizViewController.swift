//
//  QuizViewController.swift
//  QuizApp
//
//  Created by 野村大悟 on 2020/09/28.
//

import Foundation
import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var numberOfQuestions: UILabel!
    @IBOutlet weak var answerNumbar: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    
    @IBOutlet weak var backQuestion: UIButton!
    
    var num:Int = 1
    var correctAnswer:Int = 0
    var totalCorrectAnswer:Int = 0
    var rightOrWrongArray:[String] = []
    var sectionArray:[String] = []
    
    

    
    //問題文
    let question = [
        "お酢に卵を殻ごといれると卵はどうなるでしょう？",
        "リンカーンは大統領になる前は何をしていたでしょうか？",
        "飛行機の中で食べるように作られた野菜があります。その野菜はどれでしょう？",
        "日本初のハンバーガーチェーンはどこでしょう？",
        "魚のある部分を調べるとおおよその年齢を調べることができると言われています。それはどこの部位ですか？",
        "ジュースはパッケージに果物の切り口のイラストが載っているものと載っていないものがありますがこの違いは何でしょうか？",
        "シャンパンとスパークリングワインの違いは何ですか？",
        "義務教育の義務が課されているのは誰？",
        "砂肝すなぎもは鶏にわとりのどの部分？",
        "宝石の表面に明るい筋が出来る現象は「○○効果」？"
    ]
    let answer:[Int:String] = [
    1:"お酢の酸性が卵の殻のカルシウムを溶かしてしまうんですね。",
    2:"トランプの話術はプロレスラーを参考にしたとも言われており、プロレスから学んだことを政治の世界でも生かしている。",
    3:"切らずにそのまま料理に使えるという利点を活かし、海外の航空会社ではミニトマトが日本で一般的になる以前から、よく使われていた。",
    4:"当初はダイエーとアメリカのマクドナルドが一緒に日本国内にマクドナルドを出す計画でしたが出資比率で揉めたため中止となりました。その後ダイエーが単独で出店したのが「ドムドムバーガー」というチェーンです。",
    5:"年輪のようなものがあります。",
    6:"果汁が100%かどうかの違い。切り口のイラストが載っていたら果汁100％です。",
    7:"シャンパンとはフランスのシャンパーニュ地方で栽培された葡萄で作られたもののみを指します。",
    8:"日本国憲法26条の「すべて国民は、法律の定めるところにより、その保護する子女に普通教育を受けさせる義務を負ふ」という文言が根拠となっています。",
    9:"鶏は歯が無いため胃の中で砂を利用してエサをすり潰すことから",
    10:"宝石に光を照らすと猫の目のような線が見えることから。"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answer1Button.layer.cornerRadius = 10
        answer2Button.layer.cornerRadius = 10
        answer3Button.layer.cornerRadius = 10
        answer4Button.layer.cornerRadius = 10
        numberOfQuestions.text = "第\(num)問"
        answerNumbar.textColor = UIColor.red
        questionIndicate()
        answerNumbar.isHidden = true
        backQuestion.isHidden = true
        
        for i in 1 ... question.count{
            sectionArray = ["第\(i)問"]
            print(sectionArray)
        }
    }
    
    ////////////////////////////////以下function////////////////////////////////////////////
    
    //現在の問題数と問題を表示した後、１０問終了後画面遷移する
    func resultAnnouncement(){
        qusetionNumberAdd()
        questionIndicate()
    }
    
    //現在の問題数を表示する
    func qusetionNumberAdd(){
        num += 1
        numberOfQuestions.text = "第\(num)問"
    }
    
    //正解数で分岐させる
    func ScreenTransition(){
        //１０問正解で分岐
        if totalCorrectAnswer == 10{
            
            let storyBorad1 = UIStoryboard(name: "AllQuestionsCorrect", bundle: nil)
            let allQuestionsCorrectViewController =
                storyBorad1.instantiateViewController(identifier: "allQuestionsCorrectViewController") as! AllQuestionsCorrectViewController
            allQuestionsCorrectViewController.allQuestionsCorrectViewControllerRightOrWrong = rightOrWrongArray
            self.present(allQuestionsCorrectViewController, animated: true, completion: nil)
         //7問以上正解で分岐
        }else if totalCorrectAnswer >= 7{
            
            let storyBorad2 = UIStoryboard(name: "SevenQuestionsCorrect", bundle: nil)
            let sevenQuestionsCorrectViewController = storyBorad2.instantiateViewController(identifier: "sevenQuestionsCorrectViewController") as! SevenQuestionsCorrectViewController
            sevenQuestionsCorrectViewController.outputValue = "\(totalCorrectAnswer)問正解"
            sevenQuestionsCorrectViewController.sevenQuestionsCorrectViewControllerRightOrWrong = rightOrWrongArray
            self.present(sevenQuestionsCorrectViewController, animated: true, completion: nil)
        //６問以下なら分岐
        }else{
            
            let storyBorad3 = UIStoryboard(name: "SixAnderQuestionsCorrect", bundle: nil)
            let sixAnderQuestionsCorrectViewController = storyBorad3.instantiateViewController(identifier: "sixAnderQuestionsCorrectViewController") as! SixAnderQuestionsCorrectViewController
            sixAnderQuestionsCorrectViewController.outputValue = "\(totalCorrectAnswer)問正解"
            sixAnderQuestionsCorrectViewController.sixAnderQuestionsCorrectViewControllerRightOrWrong = rightOrWrongArray
            self.present(sixAnderQuestionsCorrectViewController, animated: true, completion: nil)
            
        }
    }
    
    //問題文表示
    func questionIndicate(){
        switch(num){
        case 1:
            questionLabel.text = question[0]
            answer1Button.setTitle("透明な卵になる", for: UIControl.State.normal)
            answer2Button.setTitle("鏡のようになんでもうつる卵になる", for: UIControl.State.normal)
            answer2Button.titleLabel?.adjustsFontSizeToFitWidth = true
            answer3Button.setTitle("卵が溶けてなくなる", for: UIControl.State.normal)
            answer4Button.setTitle("卵が石のように堅くなる", for: UIControl.State.normal)
            correctAnswer = 1
            //お酢の酸性が卵の殻のカルシウムを溶かしてしまうんですね。
            
        case 2:
            questionLabel.text = question[1]
            answer1Button.setTitle("プロ野球選手", for: UIControl.State.normal)
            answer2Button.setTitle("猟師", for: UIControl.State.normal)
            answer3Button.setTitle("レスラー", for: UIControl.State.normal)
            answer4Button.setTitle("タクシー運転手", for: UIControl.State.normal)
            correctAnswer = 3
            //トランプの話術はプロレスラーを参考にしたとも言われており、プロレスから学んだことを政治の世界でも生かしている。
            
        case 3:
            questionLabel.text = question[2]
            answer1Button.setTitle("ミニトマト", for: UIControl.State.normal)
            answer2Button.setTitle("パプリカ", for: UIControl.State.normal)
            answer3Button.setTitle("アボカド", for: UIControl.State.normal)
            answer4Button.setTitle("ズッキーニ", for: UIControl.State.normal)
            correctAnswer = 1
            //切らずにそのまま料理に使えるという利点を活かし、海外の航空会社ではミニトマトが日本で一般的になる以前から、よく使われていた
            
        case 4:
            questionLabel.text = question[3]
            answer1Button.setTitle("マクドナルド", for: UIControl.State.normal)
            answer2Button.setTitle("ロッテリア", for: UIControl.State.normal)
            answer3Button.setTitle("モスバーガー", for: UIControl.State.normal)
            answer4Button.setTitle("ドムドムバーガー", for: UIControl.State.normal)
            correctAnswer = 4
            //当初はダイエーとアメリカのマクドナルドが一緒に日本国内にマクドナルドを出す計画でしたが出資比率で揉めたため中止となりました。その後ダイエーが単独で出店したのが「ドムドムバーガー」というチェーンです。
            
        case 5:
            questionLabel.text = question[4]
            answer1Button.setTitle("エラ", for: UIControl.State.normal)
            answer2Button.setTitle("鱗", for: UIControl.State.normal)
            answer3Button.setTitle("背びれ", for: UIControl.State.normal)
            answer4Button.setTitle("尾びれ", for: UIControl.State.normal)
            correctAnswer = 2
            //年輪のようなものがあります。
            
        case 6:
            questionLabel.text = question[5]
            answer1Button.setTitle("デザインによるもの", for: UIControl.State.normal)
            answer2Button.setTitle("生産地によるもの", for: UIControl.State.normal)
            answer3Button.setTitle("果汁の量によるもの", for: UIControl.State.normal)
            answer4Button.setTitle("生産国によるもの", for: UIControl.State.normal)
            correctAnswer = 3
            //果汁が100%かどうかの違い。切り口のイラストが載っていたら果汁100％です。
            
        case 7:
            questionLabel.text = question[6]
            answer1Button.setTitle("値段", for: UIControl.State.normal)
            answer2Button.setTitle("葡萄の品種", for: UIControl.State.normal)
            answer3Button.setTitle("炭酸の量", for: UIControl.State.normal)
            answer4Button.setTitle("葡萄の生産地", for: UIControl.State.normal)
            correctAnswer = 4
            //シャンパンとはフランスのシャンパーニュ地方で栽培された葡萄で作られたもののみを指します。
            
        case 8:
            questionLabel.text = question[7]
            answer1Button.setTitle("親", for: UIControl.State.normal)
            answer2Button.setTitle("子供", for: UIControl.State.normal)
            answer3Button.setTitle("世帯主", for: UIControl.State.normal)
            answer4Button.setTitle("国", for: UIControl.State.normal)
            correctAnswer = 1
            //日本国憲法26条の「すべて国民は、法律の定めるところにより、その保護する子女に普通教育を受けさせる義務を負ふ」という文言が根拠となっています。
            
        case 9:
            questionLabel.text = question[8]
            answer1Button.setTitle("胃", for: UIControl.State.normal)
            answer2Button.setTitle("心臓", for: UIControl.State.normal)
            answer3Button.setTitle("肝臓", for: UIControl.State.normal)
            answer4Button.setTitle("腸", for: UIControl.State.normal)
            correctAnswer = 1
            //鶏は歯が無いため胃の中で砂を利用してエサをすり潰すことから
        
        case 10:
            questionLabel.text = question[9]
            answer1Button.setTitle("キャッツアイ", for: UIControl.State.normal)
            answer2Button.setTitle("モーゼ", for: UIControl.State.normal)
            answer3Button.setTitle("ライトスコープ", for: UIControl.State.normal)
            answer4Button.setTitle("ムーンライト", for: UIControl.State.normal)
            correctAnswer = 1
            //宝石に光を照らすと猫の目のような線が見えることから。
            
        default:
            break
        }
    }
    
    //回答後に回答ボタンと問題文を消し正否とクイズにもどるボタンを表示
    func answerAnnouncement(){
        answer1Button.isHidden = true
        answer2Button.isHidden = true
        answer3Button.isHidden = true
        answer4Button.isHidden = true
        backQuestion.isHidden = false
        answerNumbar.isHidden = false
        answerNumbar.adjustsFontSizeToFitWidth = true
        questionLabel.text = answer[num]
    }
    
    //正否の表示色を変える
    func changeColorBule(){
        answerNumbar.textColor = UIColor.blue
    }
    //正否の表示色を変える
    func changeColorRed(){
        answerNumbar.textColor = UIColor.red
    }
    //クイズに戻るボタンの文字を変える
    func changeSettitle(){
        if num == 10 {
            backQuestion.setTitle("結果発表！", for: UIControl.State.normal)
            
        }
    }

    
//    回答ボタン、正解ならtotalCorrectAnswerに１追加しanswerNumbarに正解を代入
//    その後、正解発表とクイズに戻るボタンの表示
    @IBAction func answer1(_ sender: Any) {
        if correctAnswer == 1{
            totalCorrectAnswer += 1
            answerNumbar.text = "正解!"
            rightOrWrongArray.append("　正解！")
        }else{
            changeColorBule()
            answerNumbar.text = "不正解..."
            rightOrWrongArray.append("　不正解...")
        }
        answerAnnouncement()
        print(rightOrWrongArray)
    }
    
    @IBAction func answer2(_ sender: Any) {
        if correctAnswer == 2{
            totalCorrectAnswer += 1
            answerNumbar.text = "正解!"
            rightOrWrongArray.append("　正解！")
        }else{
            changeColorBule()
            answerNumbar.text = "不正解..."
            rightOrWrongArray.append("　不正解...")
        }
        answerAnnouncement()
        print(rightOrWrongArray)
    }
    
    @IBAction func answer3(_ sender: Any) {
        if correctAnswer == 3{
            totalCorrectAnswer += 1
            answerNumbar.text = "正解!"
            rightOrWrongArray.append("　正解！")
        }else{
            changeColorBule()
            answerNumbar.text = "不正解..."
            rightOrWrongArray.append("　不正解...")
        }
        answerAnnouncement()
        print(rightOrWrongArray)
    }
    
    @IBAction func answer4(_ sender: Any) {
        if correctAnswer == 4{
            totalCorrectAnswer += 1
            answerNumbar.text = "正解!"
            rightOrWrongArray.append("　正解！")
        }else{
            changeColorBule()
            answerNumbar.text = "不正解..."
            rightOrWrongArray.append("　不正解...")
        }
        answerAnnouncement()
        print(rightOrWrongArray)
    }
    
    //回答ボタンを表示し、正否と自らを非表示にし、問題に戻る、問題数が十問を超えたら結果画面に遷移する
    @IBAction func backQuestionButton(_ sender: Any) {
        if num == 10{
            ScreenTransition()
        }
        answer1Button.isHidden = false
        answer2Button.isHidden = false
        answer3Button.isHidden = false
        answer4Button.isHidden = false
        backQuestion.isHidden = true
        answerNumbar.isHidden = true
        changeColorRed()
        resultAnnouncement()
        changeSettitle()
    }
    
}

