//
//  TobTabBar.swift
//  AniRecord
//
//  Created by 장세희 on 2/3/25.
//

import SwiftUI

struct TopTabBar<T: Hashable, Content: View>: View {
    let tabs: [T] // 탭 목록 (제네릭 타입)
    @Binding var selectedTab: T // 선택된 탭 (외부에서 제어)
    let content: (T) -> Content // 콘텐츠를 클로저로 받음
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedTab = tab
                        }
                    }) {
//                        Text(String(describing: tab))
                        Text(tabName(tab))
                            .font(.system(size: 16, weight: selectedTab == tab ? .bold : .medium))
                            .foregroundColor(selectedTab == tab ? .black : .gray)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.top, 10)
            .padding(.bottom, 6)

            // 강조 바 (Underbar)
            GeometryReader { geometry in
                let tabWidth = geometry.size.width / CGFloat(tabs.count)
                let underbarWidth = tabWidth * 0.8
                let index = CGFloat(tabs.firstIndex(of: selectedTab) ?? 0)
                let offsetX = index * tabWidth + (tabWidth - underbarWidth) / 2

                Rectangle()
                    .frame(width: underbarWidth, height: 2)
                    .foregroundColor(.black)
                    .offset(x: offsetX, y: 0)
                    .animation(.easeInOut(duration: 0.2), value: selectedTab)
            }
            .frame(height: 2) // 강조 바 높이 유지

            Divider() // 가로선 (강조 바와 동일한 위치)
            
            // 선택된 탭에 따른 콘텐츠를 동적으로 렌더링
            content(selectedTab)
                .padding(.top, 20)
                .padding(.bottom, 60)
        }
    }
    
    private func tabName(_ tab: T) -> String {
        if let tabEnum = tab as? (any RawRepresentable<String>) {
            return tabEnum.rawValue // Enum이면 한글 반환
        }
        return String(describing: tab) // 일반 String이면 그대로 반환
    }
}
