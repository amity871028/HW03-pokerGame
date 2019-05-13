//
//  RuleViewController.swift
//  HW03-game
//
//  Created by User04 on 2019/5/13.
//  Copyright © 2019 ntou. All rights reserved.
//

import UIKit

class RuleViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        backView.layer.borderColor = UIColor(red:189.0/255.0, green: 26.0/255.0, blue: 43.0/255.0, alpha: 1).cgColor
        backView.layer.borderWidth = 2.0;
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
