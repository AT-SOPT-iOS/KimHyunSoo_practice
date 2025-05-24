//
//  InstagramView.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/17/25.
//

import SwiftUI

struct InstagramView: View {
    let profileList: [ProfileModel] = profileDummy
    let users = ["현수", "제노", "정우", "맹수", "재현이"]
    let messages = [
        "안녕하세요!",
        "영화 보러 가자요 ",
        "사진 잘 봤어요!",
        "내일 점심 어때요?",
        "내 말 들리나요"
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 20) {
                ForEach(profileList) { profile in
                    ZStack(alignment: .bottomTrailing) {
                        Image(profile.image)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        Circle()
                            .foregroundColor(.green)
                            .frame(width: 15, height: 15)
                            .offset(x:2, y:2)
                    }
                }
            }
            .padding()
            
            List {
                ForEach(0..<users.count, id: \.self) { index in
                    HStack(spacing: 12) {
                        ZStack(alignment: .bottomTrailing) {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.gray)
                            
                            Circle()
                                .fill(Color.green)
                                .frame(width: 12, height: 12)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(users[index])
                                .font(.headline)
                            
                            Text(messages[index])
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        Text("오전 9:41")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 8)
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    InstagramView()
}
