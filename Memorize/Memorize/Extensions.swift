//
//  Extensions.swift
//  Memorize
//
//  Created by Tiago Chaves on 26/01/23.
//

import Foundation

extension Array {
    var randomValue: Element? {
        if count > 0 {
            let randomIndex = Int.random(in: 1..<count)
            return self[randomIndex]
        }
        return nil
    }
    
    var randomIndex: Int {
        if count > 1 {
            return Int.random(in: 1..<count)
        }
        return 0
    }
    
    var oneAndOnly: Element? {
        count == 1 ? first : nil
    }
}
