//
//  UserModel.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/24/25.
//

import Foundation

struct User: Hashable {
    let id = UUID()
    let name: String
    let age: Int
}
