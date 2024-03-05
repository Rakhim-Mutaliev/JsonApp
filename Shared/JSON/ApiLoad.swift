//
//  ApiLoad.swift
//  JsonApp (iOS)
//
//  Created by Rakhim  on 28.02.2024.
//

import Foundation
import SwiftUI

func loadUser() -> [UserModel] {
    if let path = Bundle.main.path(forResource: "converted_data", ofType: "json") {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let items = try decoder.decode([UserModel].self, from: data)
            return items
        } catch {
            fatalError("Ошибка - \(path)")
        }
    }
    return []
}

enum Errors: Error {
    case error
}

