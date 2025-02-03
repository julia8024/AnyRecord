//
//  RecordView.swift
//  AnyRecord
//
//  Created by 장세희 on 2/2/25.
//

import SwiftUI
import SwiftData

enum RecordTopTab: String, CaseIterable {
    case all = "전체"
    case watched = "시청 완료"
    case wish = "보고싶은"
}

struct RecordView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var records: [Record] // SwiftData에서 불러오기
    
    @State private var isAddingRecord = false // 기록 추가 모달
    
    let tabOptions = RecordTopTab.allCases // Enum으로 탭 목록 설정
    @State private var selectedTab: RecordTopTab = .all
    
    var body: some View {
        VStack {
            TopTabBar(tabs: tabOptions, selectedTab: $selectedTab) { tab in
                // 탭 선택에 따라 다른 뷰 표시
                VStack {
                    if tab == .all {
                        
                        RecordListView(records: records)
                        
                    } else if tab == .watched {
                        
                        RecordListView(records: records.filter {$0.isWatched})
                        
                    } else {
                        VStack {
                            Text("위시")
                        }
//                        WishListView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(.systemBackground))
            }
        }
        .overlay(
            VStack {
                CircleButton(icon: "plus", action: {
                    isAddingRecord = true
                })
                    .padding(20)
                }
            
            //오른쪽 하단에 버튼 고정
            ,alignment: .bottomTrailing
        )
        .sheet(isPresented: $isAddingRecord) {
            RecordAddView()
        }
    }
}

#Preview {
    RecordView()
}
