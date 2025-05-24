//
//  VerticalSmileys.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/24/25.
//

import SwiftUI

struct VerticalSmileys: View {
    let col = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: col) {
                ForEach(0..<20) { value in
                    VStack {
                        Image("mark")
                            .resizable()
                            .scaledToFill()
                        Text("Mark \(value+1)")
                    }
                }
                .padding()
                .border(Color.gray)
            }
            .padding()
        }
    }
}

#Preview {
    VerticalSmileys()
}
