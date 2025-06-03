//
//  SheetDetailView.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/24/25.
//

import SwiftUI

struct SheetDetailView: View {
    @Binding var isPresented: Bool

    var body: some View {
        ZStack {
            // 배경색 적용
            Color.yellow.opacity(0.2)
                .ignoresSafeArea() // 시트 전체 채우기

            VStack(spacing: 20) {
                Text("시트 뷰")
                    .font(.title)

                Button("닫기") {
                    isPresented = false
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
    }
}
