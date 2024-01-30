//
//  Chat.swift
//  WorksApp
//
//  Created by 大島大和 on 2024/01/05.
//

import Foundation

struct Chat:Decodable {
    let id: Int
    let name: String
    let messages: [Message]
}
