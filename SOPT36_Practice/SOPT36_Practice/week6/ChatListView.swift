//
//  ChatListView.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/17/25.
//

import SwiftUI

struct ChatListView: View {
    let item: [ChatListDummy] = chatDummy
    
    var body: some View {
        List(item) { item in
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Image(item.profileImageName)
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    VStack(alignment: .leading) {
                        HStack(spacing: 5) {
                            Text(item.name)
                                .font(.headline)
                                .fontWeight(.bold)
                            Text(item.location)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.secondary)
                        }
                        
                        Text(item.message)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    Image(item.thumbnailImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .frame(width: 40, height: 40)
                }
            }
        }
    }
}

#Preview {
    ChatListView()
}
