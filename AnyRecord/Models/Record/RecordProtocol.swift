//
//  RecordProtocol.swift
//  AnyRecord
//
//  Created by 장세희 on 2/6/25.
//

import Foundation

protocol RecordProtocol {
    var title: String { get set } // 작품명
    var recordType: RecordType { get set } // 타입 (애니메이션, 웹툰, 웹소설)
    var isWatched: Bool { get set } // 봤는지 여부
    var tags: [Tag] { get set } // 태그 (장르 등)
    var platforms: [Platform] { get set } // 연재 플랫폼
    var notes: [Note] { get set } // 노트
    var timeStamp: Date { get set } // 타임스탬프
}
