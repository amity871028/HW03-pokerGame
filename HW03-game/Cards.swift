//
//  Cards.swift
//  HW03-game
//
//  Created by User04 on 2019/5/9.
//  Copyright © 2019 ntou. All rights reserved.
//

import Foundation

struct Card{
    var face:Int
    var suit:Int
    
    init(_ face: Int, _ suit: Int){
        self.face = face
        self.suit = suit
    }
}
