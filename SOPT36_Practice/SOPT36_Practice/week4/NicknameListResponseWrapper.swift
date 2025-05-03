//
//  NicknameListResponseWrapper.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/3/25.
//

import UIKit

struct NicknameResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: NicknameListResponseModel
}

struct NicknameListResponseModel: Codable {
    let nicknameList: [String]
}
