//
//  RegisterRequestBody.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/3/25.
//

import UIKit

struct RegisterRequestBody: Codable {
    let loginId: String
    let password: String
    let nickname: String
}
