//
//  BottomFixButton.swift
//  AniRecord
//
//  Created by 장세희 on 2/3/25.
//

import SwiftUI

struct CircleButton: View {
    
    let icon: String
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button(
                action: action,
                label: {
                    VStack {
                        Image(systemName: icon)
                            .foregroundStyle(.background)
                            .font(.system(size: 24))
                    }
                    .padding(15)
                    .background(Color(.label))
                    .clipShape(Circle())
                }
            )
        
        }
    }
}

#Preview {
    CircleButton(icon: "plus") {
        
    }
}
