//
//  Note.swift
//  AnyRecord
//
//  Created by 장세희 on 2/6/25.
//

import Foundation
import SwiftData


// 기록 > 나의 기록

@Model
final class Note {
    var timeStamp: Date
    var title: String
    var content: String
    
    init(timeStamp: Date, title: String, content: String) {
        self.timeStamp = timeStamp
        self.title = title
        self.content = content
    }
}
