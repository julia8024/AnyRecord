//
//  RecordProtocol.swift
//  AnyRecord
//
//  Created by 장세희 on 2/6/25.
//

import Foundation

protocol RecordProtocol {
    var title: String { get set }
    var isWatched: Bool { get set }
    var note: Note { get set }
}
