//
//  CheckBox.swift
//  AnyRecord
//
//  Created by 장세희 on 2/3/25.
//

import SwiftUI

// iOS 16 이하에서도 동작하는 커스텀 체크박스
struct CheckBox: View {
    
    @Binding var isChecked: Bool // 외부에서 제어
    var text: String = ""
    
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            HStack {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .foregroundColor(isChecked ? .primary : .gray)
                    .font(.title3)
                
                if (text != "") {
                    Text("\(text)")
                        .font(.body)
                }
            }
        }
        .buttonStyle(PlainButtonStyle()) // 기본 버튼 스타일 제거
    }
}
