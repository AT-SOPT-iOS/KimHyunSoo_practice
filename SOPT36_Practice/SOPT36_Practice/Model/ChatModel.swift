//
//  ChatModel.swift
//  SOPT36_Practice
//
//  Created by MaengKim on 4/26/25.
//

import UIKit

struct ChatModel {
    let profileImg: UIImage
    let name: String
    let place: String
    let message: String
    let itemImg: UIImage
}

extension ChatModel {
    static func dummy() -> [ChatModel] {
        return [
            ChatModel(profileImg: .mark, name: "mark", place: "광진구", message: "내말에답장해줘", itemImg: .coffee),
            ChatModel(profileImg: ._82Mark, name: "mark", place: "광진구", message: "내말에답장해줘", itemImg: .mm)
        ]
    }
}

