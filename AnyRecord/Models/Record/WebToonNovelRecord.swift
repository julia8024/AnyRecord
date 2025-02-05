//
//  WebToonNovelRecord.swift
//  AnyRecord
//
//  Created by 장세희 on 2/6/25.
//

import Foundation
import SwiftData

@Model
final class WebToonNovelRecord: RecordProtocol {
    var title: String
    var recordType: RecordType
    var isWatched: Bool
    var tags: [Tag]
    var platforms: [Platform]
    var notes: [Note]
    var timeStamp: Date
    
    var author: String // 작가
    var recordStatus: RecordStatus // 연재 상태 (연재 중, 휴재, 완결)
    var related: [WebToonNovelRecord] // 비슷한 작품
    
    init(title: String,
         recordType: RecordType,
         isWatched: Bool = false,
         tags: [Tag] = [],
         platforms: [Platform] = [],
         notes: [Note] = [],
         timeStamp: Date = Date(), // 타임스탬프 자동 입력
         author: String = "",
         recordStatus: RecordStatus,
         related: [WebToonNovelRecord] = []) {
        self.title = title
        self.recordType = recordType
        self.isWatched = isWatched
        self.tags = tags
        self.platforms = platforms
        self.notes = notes
        self.timeStamp = timeStamp
        self.author = author
        self.recordStatus = recordStatus
        self.related = related
    }

    
}
