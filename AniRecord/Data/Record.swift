//
//  Item.swift
//  AniRecord
//
//  Created by 장세희 on 2/2/25.
//

import Foundation
import SwiftData

@Model
final class Record {
    var timestamp: Date // 타임스탬프
    
    var releaseYear: Int // 연재 년도
    var releaseQuarter: Int // 연재 분기
    var hasNextSeason: Bool // 다음 시즌 제작 확정 여부
//    
    var title: String // 제목
    var synopsis: String // 줄거리
    var memo: String // 메모
//    
    var isWatched: Bool // 시청 완료 여부
//    
    // 기록 추가 시
    init(timestamp: Date) {
        self.timestamp = timestamp
        self.releaseYear = 0
        self.releaseQuarter = 0
        self.hasNextSeason = false
        self.title = "추가된 기록"
        self.synopsis = ""
        self.memo = ""
        self.isWatched = false
    }
    
    init(timestamp: Date, releaseYear: Int, releaseQuarter: Int, hasNextSeason: Bool, title: String, synopsis: String, memo: String, isWatched: Bool) {
        self.timestamp = timestamp
        self.releaseYear = releaseYear
        self.releaseQuarter = releaseQuarter
        self.hasNextSeason = hasNextSeason
        self.title = title
        self.synopsis = synopsis
        self.memo = memo
        self.isWatched = isWatched
    }
    
}
