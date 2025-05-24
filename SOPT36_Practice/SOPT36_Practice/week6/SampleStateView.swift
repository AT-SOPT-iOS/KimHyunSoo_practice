//
//  SampleStateView.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/17/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var name = "현수"
    
    var body: some View {
        VStack {
            Text(name)
            Button(action: {
                self.name = "나연"
            }) {
                Text("이름 바꾸기")
            }
        }
    }
}

#Preview {
    ContentView()
}
