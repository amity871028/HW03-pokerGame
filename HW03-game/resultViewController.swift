//
//  resultViewController.swift
//  HW03-game
//
//  Created by User04 on 2019/5/10.
//  Copyright © 2019 ntou. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {
    enum result:String {
        case GOOD = "good"
        case SOSO = "soso"
        case BAD = "bad"
    }
    
    @IBOutlet weak var controlActionButton: UIButton!
    var tmp: String?
    @IBOutlet weak var showLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tmp = tmp {
            showLabel.text = tmp
        }
        if UserDefaults.standard.integer(forKey: "gameCount") == 5 {
            controlActionButton.setTitle("查看最終成績", for: .normal)
        }       // Do any additional setup after loading the view.
    }
    
    @IBAction func next(_ sender: Any) {
        if controlActionButton.currentTitle == "下一局" {
            if let controller = storyboard?.instantiateViewController(withIdentifier: "game") as? GameViewController{
                present(controller, animated: true, completion: nil)
            }
        }
        else {
            let playerPoint = UserDefaults.standard.integer(forKey: "playerPoint")
            let npcPoint = UserDefaults.standard.integer(forKey: "npcPoint")
            if let controller = storyboard?.instantiateViewController(withIdentifier: "end") as? EndViewController{
                if playerPoint > npcPoint {
                    controller.titleLabel = "恭喜！！\n贏得了這場比賽！"
                    controller.result = result.GOOD.rawValue
                }
                else if playerPoint == npcPoint {
                    controller.titleLabel = "哇啊啊！\n平手！！"
                    controller.result = result.SOSO.rawValue
                }
                else {
                    controller.titleLabel = "嗚嗚殘念！\n輸了比賽QQ"
                    controller.result = result.BAD.rawValue
                }
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
