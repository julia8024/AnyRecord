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

    @State private var isPickerPresented: Bool = false // 연재 기간 바텀시트
    
    let currentYear = Calendar.current.component(.year, from: Date())
    let years: [Int] // 연도 리스트 (역순 정렬)
    
    let quarters = [1, 2, 3, 4]

    
    init() {
        self.years = Array((2000...(currentYear + 2)).reversed()) // 최신 연도부터 정렬
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        // 제목 입력
                        Text("제목")
                            .font(.headline)
                        TextField("제목 입력", text: $title)
                            .textFieldStyle(.plain)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        HStack {
                            // 연재 연도 및 분기 선택
                            Text("연재 기간")
                                .font(.headline)
                            
                            Spacer()
                            
                            Button(action: {
                                if (releaseYear == nil && releaseQuarter == nil) {
                                    releaseYear = currentYear
                                    releaseQuarter = 1
                                }
                                
                                isPickerPresented.toggle()
                            }, label: {
                                HStack {
                                    Text(releaseYear != nil && releaseQuarter != nil ? "\(String(releaseYear!))년 \(releaseQuarter!)분기" : "선택")
                                    if (releaseYear != nil && releaseQuarter != nil) {
                                        Button(action: {
                                            releaseYear = nil
                                            releaseQuarter = nil
                                        }, label: {
                                            Image(systemName: "xmark.circle")
                                                .environment(\.symbolVariants, .none)
                                        })
                                    }
                                        
                                }
                            })
                            .sheet(isPresented: $isPickerPresented, content: {
                                VStack {
                                    // 툴바 추가
                                    HStack {
                                        Button("취소") {
                                            isPickerPresented = false
                                        }
                                        .foregroundStyle(.blue)
                                        
                                        Spacer()
                                        
                                        Text("연재 기간 선택")
                                            .font(.headline)
                                        
                                        Spacer()
                                        
                                        Button("완료") {
                                            isPickerPresented = false
                                        }
                                        .bold()
                                        .foregroundStyle(.blue)
                                    }
                                    .padding()
                                    
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
                                            get: { releaseQuarter ?? 1 },
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
                                    .padding()
                                    
                                    Spacer()
                                }
                                .presentationDetents([.fraction(0.4)]) // 바텀시트 크기 설정
                            }) // sheet
                        }
                
                        CheckBox(isChecked: $hasNextSeason, text: "다음 시즌 제작 확정")
                            .padding(.top, 10)
                    }
                
                    VStack(alignment: .leading, spacing: 10) {
                        // 메모 입력
                        Text("메모")
                            .font(.headline)
                        
                        TextEditor(text: $memo)
                            .frame(minHeight: 80)
                            .padding(8)
                            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5)))
                    }
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
        // 하나라도 nil이면 둘다 nil로 변경
        if (releaseYear == nil || releaseQuarter == nil) {
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
