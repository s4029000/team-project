//
//  Item.swift
//  team project
//
//  Created by 马马驭昊 on 2026/8/12.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
