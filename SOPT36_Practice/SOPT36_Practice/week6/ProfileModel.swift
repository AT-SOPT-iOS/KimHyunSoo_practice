//
//  ProfileModel.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 5/17/25.
//

import SwiftUI

struct ProfileModel: Identifiable {
    var id = UUID()
    var image: String
}

let profileDummy: [ProfileModel] = [
    ProfileModel(image: "mark"),
    ProfileModel(image: "mark"),
    ProfileModel(image: "mark"),
    ProfileModel(image: "mark"),
    ProfileModel(image: "mark"),
    ProfileModel(image: "mark")
]
