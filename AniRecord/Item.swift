//
//  Item.swift
//  AniRecord
//
//  Created by 장세희 on 2/2/25.
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
