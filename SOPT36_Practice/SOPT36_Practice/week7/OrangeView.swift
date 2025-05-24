//
//  OrangeView.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/24/25.
//

import SwiftUI

struct OrangeView: View {
    let row = [GridItem(.fixed(100)), GridItem(.fixed(100))]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: row, spacing: 0) {
                ForEach(0..<20) { value in
                    VStack {
                        Rectangle()
                            .fill(Color.orange)
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                        Text("🍊 \(value)개")
                    }
                    .padding(5)
                }
            }
        }
    }
}

#Preview {
    OrangeView()
}
