//
//  ProfileView.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/17/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("markmaark")
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                VStack(alignment: .leading) {
                    Text("마쿠")
                        .font(.headline)
                    Text("안뇽하세요. 저는 마쿠입니다.")
                        .font(.subheadline)
                }
                Spacer()
            }
            .padding()
            .foregroundColor(.primary)
            .background(
                Color.primary
                    .colorInvert()
                    .opacity(0.75)
            )
        }
    }
}

#Preview {
    ProfileView()
}
