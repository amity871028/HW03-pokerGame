//
//  ViewController.swift
//  HW03-game
//
//  Created by User04 on 2019/5/6.
//  Copyright © 2019 ntou. All rights reserved.
//

import UIKit
import SafariServices
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UserDefaults.standard.set(0, forKey: "playerPoint")
        UserDefaults.standard.set(0, forKey: "npcPoint")
        UserDefaults.standard.set(0, forKey: "gameCount")
    
        let content = UNMutableNotificationContent()
        content.title = "咦？是不是很久沒玩了啊啊啊"
        content.body = "趕快登入玩個幾局吧！！！"
        content.badge = 1
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "notification1", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

    @IBAction func anotherWebsite(_ sender: Any) {
        if let url = URL(string: "https://zh.wikipedia.org/wiki/Category:%E6%92%B2%E5%85%8B%E7%89%8C%E9%81%8A%E6%88%B2") {
            let controller = SFSafariViewController(url: url)
            present(controller, animated: true, completion: nil)
        }
    }
}

