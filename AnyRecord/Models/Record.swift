//
//  Item.swift
//  AnyRecord
//
//  Created by 장세희 on 2/2/25.
//

import Foundation
import SwiftData

@Model
final class Record {
    var timestamp: Date // 타임스탬프
    
    var releaseYear: Int? // 연재 년도
    var releaseQuarter: Int? // 연재 분기
    var hasNextSeason: Bool // 다음 시즌 제작 확정 여부

    var title: String // 제목

    var isWatched: Bool // 시청 완료 여부
    
        
    
    // 기록 추가 시
    init(timestamp: Date) {
        self.timestamp = timestamp
        self.releaseYear = nil
        self.releaseQuarter = nil
        self.hasNextSeason = false
        self.title = "추가된 기록"
        self.isWatched = false
    }
    
    init(
            timestamp: Date = Date(),
            releaseYear: Int? = nil, // 기본값 `nil`
            releaseQuarter: Int? = nil, // 기본값 `nil`
            hasNextSeason: Bool = false,
            title: String = "",
            isWatched: Bool = false
        ) {
            self.timestamp = timestamp
            self.releaseYear = releaseYear
            self.releaseQuarter = releaseQuarter
            self.hasNextSeason = hasNextSeason
            self.title = title
            self.isWatched = isWatched
        }
    
}
