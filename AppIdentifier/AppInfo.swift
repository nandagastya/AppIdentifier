//
//  AppInfo.swift
//  AppIdentifier
//
//  Created by Agastya Nand on 03/07/25.
//

import Foundation

struct AppInfo: Identifiable {
    let id = UUID()
    let name: String
    let scheme: String
    let category: String?
    let iconURL: String?
    var isPresent: Bool = false
}
