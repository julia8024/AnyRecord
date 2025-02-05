//
//  AnimeRecord.swift
//  AnyRecord
//
//  Created by 장세희 on 2/6/25.
//

import Foundation
import SwiftData

@Model
final class AnimeRecord: RecordProtocol {
    var title: String
    var recordType: RecordType
    var isWatched: Bool
    var tags: [Tag]
    var platforms: [Platform]
    var notes: [Note]
    var timeStamp: Date
    
    var releaseYear: Int? // 연재 년도
    var releaseQuarter: Int? // 연재 분기
    var hasNextSeason: Bool // 다음 시즌 제작 확정 여부
    var series: [AnimeRecord] // 시리즈
    var related: [AnimeRecord] // 비슷한 작품
    
    init(title: String,
         recordType: RecordType,
         isWatched: Bool = false,
         tags: [Tag] = [],
         platforms: [Platform] = [],
         notes: [Note] = [],
         timeStamp: Date = Date(), // 타임스탬프 자동 입력
         releaseYear: Int? = nil,
         releaseQuarter: Int? = nil,
         hasNextSeason: Bool = false,
         series: [AnimeRecord] = [],
         related: [AnimeRecord] = []) {
        self.title = title
        self.recordType = recordType
        self.isWatched = isWatched
        self.tags = tags
        self.platforms = platforms
        self.notes = notes
        self.timeStamp = timeStamp
        self.releaseYear = releaseYear
        self.releaseQuarter = releaseQuarter
        self.hasNextSeason = hasNextSeason
        self.series = series
        self.related = related
    }
    
}
