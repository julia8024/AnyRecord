//
//  RecordEnums.swift
//  AnyRecord
//
//  Created by 장세희 on 2/6/25.
//

import Foundation

enum RecordType: String, Codable {
    case anime = "애니메이션"
    case webtoon = "웹툰"
    case webnovel = "웹소설"
}

enum RecordStatus: String, Codable {
    case ongoing = "연재 중"
    case paused = "휴재"
    case completed = "완결"
}
