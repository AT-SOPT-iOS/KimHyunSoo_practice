//
//  SheetExampleVie.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/24/25.
//

import SwiftUI

struct SheetExampleView: View {
    @State private var isSheetPresented = false

    var body: some View {
        VStack(spacing: 20) {
            Text("메인 화면")
                .font(.largeTitle)

            Button("시트 열기") {
                isSheetPresented = true
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            SheetDetailView(isPresented: $isSheetPresented)
        }
    }
}

#Preview {
    SheetExampleView()
}
