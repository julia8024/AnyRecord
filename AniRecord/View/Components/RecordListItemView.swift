//
//  RecordListItemView.swift
//  AniRecord
//
//  Created by 장세희 on 2/3/25.
//

import SwiftUI
import SwiftData

struct RecordListItemView: View {
    
    let record: Record
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("\(record.releaseYear)년 \(record.releaseQuarter)분기")
                        .font(.system(size: 14))
                        .foregroundStyle(.secondary)
                    
                    Text("\(record.title)")
                        .font(.system(size: 16))
                        .foregroundStyle(.primary)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                Button(action: {
                    record.isWatched = !record.isWatched
                    
                }, label: {
                    if (record.isWatched) {
                        Image(systemName: "checkmark.circle")
                            .foregroundStyle(.primary)
                            .environment(\.symbolVariants, .none)
                            .font(.system(size: 24))
                    } else {
                        Image(systemName: "circle")
                            .foregroundStyle(.gray)
                            .environment(\.symbolVariants, .none)
                            .font(.system(size: 24))
                    }
                })
                
            } // HStack
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            
            Divider()
        }
        
        
    } // body
}


#Preview {
    let container = try! ModelContainer(for: Record.self, configurations: .init(isStoredInMemoryOnly: true))

    let sampleRecord = Record(timestamp: Date())
    
    container.mainContext.insert(sampleRecord)

    return RecordListItemView(record: sampleRecord)
        .modelContainer(container)
}
