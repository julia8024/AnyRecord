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
    
    var releaseYear: String // 연재 년도
    var releaseSeason: String // 연재 분기
    var hasNextSeason: Bool // 다음 시즌 제작 확정 여부
    
    var title: String // 제목
    var synopsis: String // 줄거리
    var memo: String // 메모
    
    var isWatched: Bool // 시청 완료 여부
    
    // 기록 추가 시
    init(timestamp: Date) {
        self.timestamp = timestamp
        self.releaseYear = ""
        self.releaseSeason = ""
        self.hasNextSeason = false
        self.title = "추가된 기록"
        self.synopsis = ""
        self.memo = ""
        self.isWatched = false
    }
}
