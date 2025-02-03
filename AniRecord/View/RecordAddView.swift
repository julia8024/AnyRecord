//
//  RecordAddView.swift
//  AniRecord
//
//  Created by 장세희 on 2/3/25.
//

import SwiftUI

struct RecordAddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext

    @State private var title: String = ""
    @State private var memo: String = ""
    @State private var releaseYear: Int? = nil
    @State private var releaseQuarter: Int? = nil
    @State private var hasNextSeason: Bool = false
    
    @State private var isLaterInput: Bool = false // "나중에 입력" 체크 여부

    let currentYear = Calendar.current.component(.year, from: Date())
    let years: [Int] // 연도 리스트 (역순 정렬)
    
    let quarters = [1, 2, 3, 4]

    
    init() {
        self.years = Array((2000...(currentYear + 2)).reversed()) // 최신 연도부터 정렬
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    // 제목 입력
                    Text("제목")
                        .font(.headline)
                    TextField("제목 입력", text: $title)
                        .textFieldStyle(.roundedBorder)

                    // 연재 연도 및 분기 선택
                    Text("연재 기간")
                        .font(.headline)
                    
                    CheckBox(isChecked: $isLaterInput, text: "나중에 입력")
                    
                    if (isLaterInput == false) {
                        HStack {
                            Picker("연재 연도", selection: Binding(
                                get: { releaseYear ?? currentYear },
                                set: { releaseYear = $0 }
                            )) {
                                ForEach(years, id: \.self) { year in
                                    Text("\(String(year))").tag(year)
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            
                            Text("년")
                                .font(.body)
                            
                            
                            Picker("연재 분기", selection: Binding(
                                get: { releaseQuarter ?? 0 },
                                set: { releaseQuarter = $0 }
                            )) {
                                ForEach(quarters, id: \.self) { quarter in
                                    Text("\(quarter)").tag(quarter)
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            
                            Text("분기")
                                .font(.body)
                        }
                    }

                    CheckBox(isChecked: $hasNextSeason, text: "다음 시즌 제작 확정")
                    
                    // 메모 입력
                    Text("메모")
                        .font(.headline)
                    TextEditor(text: $memo)
                        .frame(minHeight: 80)
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5)))
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("취소") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("저장") {
                        saveRecord()
                    }
                }
            }
            .toolbarBackground(Color.white, for: .navigationBar) // 툴바 배경을 화이트로 고정
            .toolbarBackground(.visible, for: .navigationBar) // 툴바가 항상 보이도록 설정

        }
    }

    // 새 레코드 저장 로직
    private func saveRecord() {
        if (isLaterInput) {
            releaseYear = nil
            releaseQuarter = nil
        }
        
        let newRecord = Record(
            timestamp: Date(),
            releaseYear: releaseYear,
            releaseQuarter: releaseQuarter,
            hasNextSeason: hasNextSeason,
            title: title.isEmpty ? "제목 없음" : title,
            memo: memo,
            isWatched: false
        )
        modelContext.insert(newRecord)
        dismiss()
    }
}

#Preview {
    RecordAddView()
}
