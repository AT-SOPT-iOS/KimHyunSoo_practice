//
//  UpdateNicknameResponseBody.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/7/25.
//

import UIKit

struct UpdateNicknameResponseBody: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: String?
}
