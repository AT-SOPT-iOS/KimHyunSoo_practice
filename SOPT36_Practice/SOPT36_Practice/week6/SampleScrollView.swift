//
//  SampleScrollView.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/17/25.
//

import SwiftUI

struct SampleScrollView: View {
    var body: some View {
        ScrollView() {
            VStack {
                ForEach(1..<100) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }
            
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    SampleScrollView()
}
