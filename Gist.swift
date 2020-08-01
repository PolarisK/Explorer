//
//  Gist.swift
//  RESThub
//
//  Created by Harrison on 7/30/19.
//  Copyright © 2019 Harrison. All rights reserved.
//

import Foundation

struct Gist: Encodable {
    var id: String?
    var isPublic: Bool
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case id, description, isPublic = "public"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(isPublic, forKey: .isPublic)
        try container.encode(description, forKey: .description)
        try container.encodeIfPresent(id, forKey: .id)
    }
}

extension Gist: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.isPublic = try container.decode(Bool.self, forKey: .isPublic)
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? "Description is nil"
    }
}
