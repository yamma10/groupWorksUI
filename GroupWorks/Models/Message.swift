//
//  Message.swift
//  WorksApp
//
//  Created by 大島大和 on 2024/01/05.
//

import Foundation

struct Message: Decodable, Identifiable {
    var id: UUID
    let roomId: Int
    let employeeCode: Int
    let employeeName: String
    let text: String
    let date: String
}
