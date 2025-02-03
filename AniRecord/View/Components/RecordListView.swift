//
//  RecordList.swift
//  AniRecord
//
//  Created by 장세희 on 2/3/25.
//

import SwiftUI

struct RecordListView: View {
    
    @State var emptyText: String = "아직 작성된 기록이 없어요"
    @State var records: [Record] = []
    
    var body: some View {
        if records.isEmpty {
            VStack {
                Text("\(emptyText)")
                    .font(.system(size: 16))
                    .foregroundStyle(.gray)
            }
        } else {
            ScrollView {
                LazyVStack {
                    ForEach(records) { record in
                        RecordListItemView(record: record)
                    }
                }
            }
        }
    }
}

