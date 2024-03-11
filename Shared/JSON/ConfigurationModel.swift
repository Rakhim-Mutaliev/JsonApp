//
//  ConfigurationModel.swift
//  JsonApp (iOS)
//
//  Created by Rakhim  on 28.02.2024.
//

import Foundation
import SwiftUI

struct ConfigurationModel: Codable {
    var key: String
    var devValue: String
    var prodValue: String?
    var tags: String?
}

extension ConfigurationModel {
    private enum CodingKeys: String, CodingKey { case key, prodValue, tags }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.key = try container.decode(String.self, forKey: .key)
        self.prodValue = try container.decodeIfPresent(String.self, forKey: .prodValue)
        self.tags = try container.decodeIfPresent(String.self, forKey: .tags)
        
        self.devValue = ""
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(key, forKey: .key)
        try container.encode(prodValue, forKey: .prodValue)
        try container.encode(tags, forKey: .tags)
    }
}
