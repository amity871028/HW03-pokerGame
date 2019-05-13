//
//  EndViewController.swift
//  HW03-game
//
//  Created by User04 on 2019/5/13.
//  Copyright © 2019 ntou. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {
    var titleLabel: String?
    var result: String?
    @IBOutlet weak var showTitleLabel: UILabel!
    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var showImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showTitleLabel.text = titleLabel
        let playerPoint = UserDefaults.standard.integer(forKey: "playerPoint")
        let npcPoint = UserDefaults.standard.integer(forKey: "npcPoint")
        showLabel.text = "最後比數： " + String(playerPoint) + " : " + String(npcPoint)
        var images = [UIImage]()
        for number in 1...2 {
            if let result = result {
                let image = UIImage(named: String(format: "%@_%d", result, number))!
                images.append(image)
            }
        }
        let animatedImage = UIImage.animatedImage(with: images, duration: 0.5)
        showImageView.image = animatedImage
        // Do any additional setup after loading the view.
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
