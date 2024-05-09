//
//  ResultViewController.swift
//  Gacha
//
//  Created by 佐伯小遥 on 2024/05/09.
//

import UIKit

class ResultViewController: UIViewController {
    
    //乱数を入れるためのInt型の変数を用意
    var number: Int!
    
    //背景画像とモンスターの画像を表示するためのImageViewを用意
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var characterImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 0-9までのランダムな数（乱数）を発生させる
        var number = Int.random(in: 0...9)
        
        switch number{
        case 9:
            characterImageView.image = UIImage(named: "IoTMesh")
            backgroundImageView.image = UIImage(named: "bgBlue")
        case 7,8:
            characterImageView.image = UIImage(named: "camera")
            backgroundImageView.image = UIImage(named: "bgGreen")
        case 0..<7 :
            characterImageView.image = UIImage(named: "iphone")
            backgroundImageView.image = UIImage(named: "bgRed")
        default:
            print("error")
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //キャラクター出現時のアニメーション
        self.characterImageView.center = self.view.center
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseIn, .autoreverse, .repeat], animations: {self.characterImageView.center.y += 10.0}){
            _ in
            self.characterImageView.center.y -= 10.0
        }
    }
    
    // ResultViewControllerを閉じて前の画面に戻る
    @IBAction func back(){
        self.dismiss(animated: true,completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
