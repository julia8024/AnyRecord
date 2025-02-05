//
//  Tag.swift
//  AnyRecord
//
//  Created by 장세희 on 2/6/25.
//

import Foundation
import SwiftData

@Model
final class Tag {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
