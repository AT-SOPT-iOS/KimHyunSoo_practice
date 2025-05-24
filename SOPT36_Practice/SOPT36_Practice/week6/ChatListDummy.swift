//
//  ChatListDummy.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/17/25.
//

import SwiftUI

struct ChatListDummy: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let message: String
    let profileImageName: String
    let thumbnailImageName: String
}

let chatDummy: [ChatListDummy] = [
    ChatListDummy(name: "마쿠", location: "문정동", message: "확인했습니다! 감사합니다 :)", profileImageName: "mark", thumbnailImageName: "markmaark"),
    ChatListDummy(name: "마쿠", location: "문정동", message: "확인했습니다! 감사합니다 :)", profileImageName: "mark", thumbnailImageName: "markmaark"),
    ChatListDummy(name: "마쿠", location: "문정동", message: "확인했습니다! 감사합니다 :)", profileImageName: "mark", thumbnailImageName: "markmaark"),
    ChatListDummy(name: "마쿠", location: "문정동", message: "확인했습니다! 감사합니다 :)", profileImageName: "mark", thumbnailImageName: "markmaark"),
    ChatListDummy(name: "마쿠", location: "문정동", message: "확인했습니다! 감사합니다 :)", profileImageName: "mark", thumbnailImageName: "markmaark")
]

