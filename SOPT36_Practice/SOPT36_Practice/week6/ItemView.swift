//
//  ItemView.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/17/25.
//

import SwiftUI

struct ItemView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .bottomTrailing) {
                Image("markmaark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                Image("red-heart")
                    .padding(15)
                    .fixedSize()
            }
            
            HStack(spacing: 5) {
                Text("이마쿠")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("성수동")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Text("8282828282원")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.orange)
        }
        .padding()
    }
}
#Preview {
    ItemView()
}
