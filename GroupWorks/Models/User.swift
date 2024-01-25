//
//  User.swift
//  WorksApp
//
//  Created by 大島大和 on 2024/01/05.
//

import Foundation

struct User:Codable {
    let employeeCode: Int
    let employeeName: String
    //部署
    let division: String
    //役職
    let position: String
    //有効なユーザーかどうか
    let flag: Int
}
