//
//  GameViewController.swift
//  HW03-game
//
//  Created by User04 on 2019/5/6.
//  Copyright © 2019 ntou. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    var suitString = ["clubs", "diamonds", "hearts", "spades"]
    enum result:String{
        case WIN = "win"
        case LOSE = "lose"
    }
    @IBOutlet weak var playerCardImageView: UIImageView!
    @IBOutlet weak var npcCardImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tmp = UserDefaults.standard.integer(forKey: "gameCount")
        UserDefaults.standard.set(tmp + 1, forKey: "gameCount")
        // Do any additional setup after loading the view.
    }
    @IBAction func dealCard(_ sender: Any) {
        var face = Int.random(in: 1...13)
        var suit = Int.random(in: 0...3)
        let playerCard = Card(face, suit)
        repeat{
            face = Int.random(in: 1...13)
            suit = Int.random(in: 0...3)
        } while face == playerCard.face && suit == playerCard.suit
        let npcCard = Card(face, suit)
        playerCardImageView.image = UIImage(named: "back")
        npcCardImageView.image = UIImage(named: "back")
       playerCardImageView.backgroundColor = UIColor(white: 1, alpha: 1)
        npcCardImageView.backgroundColor = UIColor(white: 1, alpha: 1)
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.8, delay: 0, animations: {
            self.playerCardImageView.center = CGPoint(x:self.playerCardImageView.center.x, y:527)
            self.npcCardImageView.center = CGPoint(x:self.npcCardImageView.center.x, y:187)
        })
        var tmpName = String(playerCard.face) + "_of_" + self.suitString[playerCard.suit]
        Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false){_ in
        self.playerCardImageView.image = UIImage(named: tmpName)
        }
        var WinOrLose:String?
        Timer.scheduledTimer(withTimeInterval: 1.8, repeats: false){_ in
            let controller = UIAlertController(title: "比大小", message: "請選擇比大比小？", preferredStyle: .actionSheet)
            let options = ["大", "小"]
            for option in options {
                let action = UIAlertAction(title: option, style: .default){
                    (action) in
                    if action.title == "大" {
                        if playerCard.face > npcCard.face {
                            WinOrLose = result.WIN.rawValue
                        }
                        else if playerCard.face == npcCard.face {
                            if playerCard.suit > npcCard.suit {
                                WinOrLose = result.WIN.rawValue
                            }
                            else {
                                WinOrLose = result.LOSE.rawValue
                            }
                        }
                        else {
                            WinOrLose = result.LOSE.rawValue
                        }
                        var point = playerCard.face - npcCard.face
                        if point == 0 {
                            point = playerCard.face
                        }
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: false){_ in
                        self.determine(WinOrLose: WinOrLose, point: point)
                        }
                    }
                    else if action.title == "小" {
                        if playerCard.face < npcCard.face {
                            WinOrLose = result.WIN.rawValue
                        }
                        else if playerCard.face == npcCard.face {
                            if playerCard.suit < npcCard.suit {
                                WinOrLose = result.WIN.rawValue
                            }
                            else {
                                WinOrLose = result.LOSE.rawValue
                            }
                        }
                        else {
                            WinOrLose = result.LOSE.rawValue
                        }
                        var point = npcCard.face - playerCard.face
                        if point == 0 {
                            point = playerCard.face
                        }
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: false){_ in
                        self.determine(WinOrLose: WinOrLose, point: point)
                        }
                    }
                    tmpName = String(npcCard.face) + "_of_" + self.suitString[npcCard.suit]
                    self.npcCardImageView.image = UIImage(named: tmpName)
                }
                controller.addAction(action)
            }
            self.present(controller, animated: true, completion: nil)
        }
    }
    func determine(WinOrLose: String?, point: Int){
        if WinOrLose == result.WIN.rawValue {
            let currentPlayerPoint = UserDefaults.standard.integer(forKey: "playerPoint")
            UserDefaults.standard.set(currentPlayerPoint + point, forKey: "playerPoint")
            
            if let controller = storyboard?.instantiateViewController(withIdentifier: "result") as? resultViewController{
                let playerPoint = UserDefaults.standard.integer(forKey: "playerPoint")
                let npcPoint = UserDefaults.standard.integer(forKey: "npcPoint")
                controller.tmp = "恭喜你！贏得這一場比賽！\n此局得分： " + String(point) + "\n目前比數： " + String(playerPoint) + " : " + String(npcPoint)
            present(controller, animated: true, completion: nil)
            }
        }
        else{
            let currentNpcPoint = UserDefaults.standard.integer(forKey: "npcPoint")
            UserDefaults.standard.set(currentNpcPoint - point, forKey: "npcPoint")
            if let controller = storyboard?.instantiateViewController(withIdentifier: "result") as? resultViewController{
                let playerPoint = UserDefaults.standard.integer(forKey: "playerPoint")
                let npcPoint = UserDefaults.standard.integer(forKey: "npcPoint")
                
                controller.tmp = "嗚嗚輸了！別灰心，下一局會更好！\n此局失分： " + String(-point) + "\n目前比數： " + String(playerPoint) + " : " + String(npcPoint)
                present(controller, animated: true, completion: nil)
            }
        }
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
