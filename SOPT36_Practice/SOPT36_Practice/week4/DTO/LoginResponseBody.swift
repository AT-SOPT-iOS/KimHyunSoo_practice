//
//  LoginResponseBody.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/7/25.
//

import UIKit

struct LoginResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: LoginResponseBody
}

struct LoginResponseBody: Codable {
    let userId: Int
}
